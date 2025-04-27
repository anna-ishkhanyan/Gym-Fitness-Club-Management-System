-- 1. Detailed attendance report (per-record with duration)
SELECT
  a.AttendanceID,
  a.MemberID,
  m.Name AS MemberName,
  a.Date,
  a.CheckInTime,
  a.CheckOutTime,
  ROUND(
    EXTRACT(EPOCH FROM (a.CheckOutTime - a.CheckInTime)) 
    / 3600, 2) AS DurationHours
FROM Attendance a
JOIN Member m 
  ON a.MemberID = m.MemberID
WHERE a.CheckInTime IS NOT NULL
  AND a.CheckOutTime IS NOT NULL
ORDER BY a.Date, m.Name;


-- 2. Attendance summary by date
SELECT
  a.Date,
  COUNT(DISTINCT a.MemberID) AS TotalAttendance
FROM Attendance a
GROUP BY a.Date
ORDER BY a.Date;


-- 3. Total time spent by each member (aggregate)
SELECT
  m.MemberID,
  m.Name AS MemberName,
  ROUND(
    SUM(
      EXTRACT(EPOCH FROM (a.CheckOutTime - a.CheckInTime)) / 3600
    ), 2
  ) AS TotalHoursSpent
FROM Attendance a
JOIN Member m 
  ON a.MemberID = m.MemberID
WHERE a.CheckInTime IS NOT NULL
  AND a.CheckOutTime IS NOT NULL
GROUP BY m.MemberID, m.Name
ORDER BY TotalHoursSpent DESC;


-- 4. Attendance filtered by trainer & date range
SELECT
  t.TrainerID,
  t.Name AS TrainerName,
  fc.ScheduleTime::date AS ClassDate,
  COUNT(a.AttendanceID) AS TotalCheckIns
FROM Attendance a
JOIN ClassEnrollment ce
  ON a.MemberID = ce.MemberID
JOIN FitnessClass fc
  ON ce.ClassID = fc.ClassID
  AND a.Date = fc.ScheduleTime::date
JOIN Trainer t
  ON fc.TrainerID = t.TrainerID
WHERE fc.ScheduleTime::date BETWEEN '2025-04-01' AND '2025-04-30'
GROUP BY t.TrainerID, t.Name, ClassDate
ORDER BY t.Name, ClassDate;


-- 5. Create/replace view: fitness class participation summary
CREATE OR REPLACE VIEW FitnessClassParticipationSummary AS
SELECT 
  fc.ClassID,
  fc.ClassName,
  fc.ScheduleTime,
  COUNT(ce.MemberID) AS NumberOfParticipants
FROM FitnessClass fc
LEFT JOIN ClassEnrollment ce 
  ON fc.ClassID = ce.ClassID
GROUP BY fc.ClassID, fc.ClassName, fc.ScheduleTime;

-- 6. Query the view
SELECT * 
FROM FitnessClassParticipationSummary
ORDER BY NumberOfParticipants DESC;


-- 7. Monthly revenue report
SELECT
  TO_CHAR(b.PaymentDate, 'YYYY-MM') AS YearMonth,
  SUM(b.Amount) AS TotalRevenue
FROM Billing b
WHERE b.Status = 'Paid'
GROUP BY TO_CHAR(b.PaymentDate, 'YYYY-MM')
ORDER BY YearMonth;


-- 8. Quarterly revenue report
SELECT
  EXTRACT(YEAR FROM b.PaymentDate) AS Year,
  CEIL(EXTRACT(MONTH FROM b.PaymentDate)/3.0) AS Quarter,
  SUM(b.Amount) AS TotalRevenue
FROM Billing b
WHERE b.Status = 'Paid'
GROUP BY Year, Quarter
ORDER BY Year, Quarter;


-- 9. Revenue by membership plan (monthly)
SELECT
  ms.Type AS MembershipType,
  TO_CHAR(b.PaymentDate, 'YYYY-MM') AS YearMonth,
  SUM(b.Amount) AS TotalRevenue
FROM Billing b
JOIN Member m 
  ON b.MemberID = m.MemberID
JOIN Membership ms 
  ON m.MembershipID = ms.MembershipID
WHERE b.Status = 'Paid'
GROUP BY ms.Type, YearMonth
ORDER BY ms.Type, YearMonth;


-- 10. Revenue by payment method (all time)
SELECT
  b.Method,
  SUM(b.Amount) AS TotalRevenue
FROM Billing b
GROUP BY b.Method
ORDER BY b.Method;


-- 11. Outstanding dues & payment success rate (monthly)
SELECT
  TO_CHAR(b.PaymentDate, 'YYYY-MM') AS YearMonth,
  SUM(CASE WHEN b.Status = 'Paid' THEN b.Amount ELSE 0 END) AS PaidAmount,
  SUM(CASE WHEN b.Status != 'Paid' THEN b.Amount ELSE 0 END) AS OutstandingAmount,
  ROUND(
    100.0 * SUM(CASE WHEN b.Status = 'Paid' THEN 1 ELSE 0 END)
    / COUNT(*), 2) AS SuccessRatePercent
FROM Billing b
GROUP BY YearMonth
ORDER BY YearMonth;


-- 12. Trainer load & performance: classes & avg. participants
SELECT
  t.TrainerID,
  t.Name AS TrainerName,
  COUNT(DISTINCT fc.ClassID) AS NumberOfClasses,
  ROUND(AVG(sub.Participants),2) AS AvgParticipants
FROM Trainer t
LEFT JOIN FitnessClass fc 
  ON t.TrainerID = fc.TrainerID
LEFT JOIN (
  SELECT 
    ce.ClassID,
    COUNT(ce.MemberID) AS Participants
  FROM ClassEnrollment ce
  GROUP BY ce.ClassID
) sub ON fc.ClassID = sub.ClassID
GROUP BY t.TrainerID, t.Name
ORDER BY NumberOfClasses DESC;


-- 13. Trainer workout schedule count
SELECT
  t.TrainerID,
  t.Name AS TrainerName,
  COUNT(ws.ScheduleID) AS WorkoutSessions
FROM Trainer t
LEFT JOIN WorkoutSchedule ws 
  ON ws.TrainerID = t.TrainerID
GROUP BY t.TrainerID, t.Name
ORDER BY WorkoutSessions DESC;


-- 14. Trainer attendance retention (% of members attending ≥2 sessions)
WITH trainer_attendance AS (
  SELECT
    fc.TrainerID,
    a.MemberID
  FROM Attendance a
  JOIN ClassEnrollment ce 
    ON a.MemberID = ce.MemberID
    AND a.Date     = ce.EnrollmentDate
  JOIN FitnessClass fc 
    ON ce.ClassID  = fc.ClassID
), member_counts AS (
  SELECT
    TrainerID,
    MemberID,
    COUNT(*) AS attend_count
  FROM trainer_attendance
  GROUP BY TrainerID, MemberID
), summary AS (
  SELECT
    TrainerID,
    COUNT(*) FILTER (WHERE attend_count >= 1) AS TotalMembers,
    COUNT(*) FILTER (WHERE attend_count >= 2) AS RepeatMembers
  FROM member_counts
  GROUP BY TrainerID
)
SELECT
  t.TrainerID,
  t.Name AS TrainerName,
  s.TotalMembers,
  s.RepeatMembers,
  ROUND(
    100.0 * s.RepeatMembers / NULLIF(s.TotalMembers,0),2) AS RetentionPercent
FROM summary s
JOIN Trainer t 
  ON t.TrainerID = s.TrainerID
ORDER BY RetentionPercent DESC;


-- 15. Equipment status & total maintenance reports
SELECT
  e.EquipmentID,
  e.Name AS EquipmentName,
  e.Type,
  e.Status,
  COUNT(fm.MaintenanceID) AS TotalIssues
FROM Equipment e
LEFT JOIN FacilityMaintenance fm 
  ON e.EquipmentID = fm.EquipmentID
GROUP BY e.EquipmentID, e.Name, e.Type, e.Status
ORDER BY e.Status, TotalIssues DESC;


-- 16. Average equipment downtime (resolved cases only)
SELECT
  e.EquipmentID,
  e.Name AS EquipmentName,
  ROUND(
    AVG(
      EXTRACT(
        EPOCH FROM (CURRENT_DATE::timestamp - fm.ReportedDate::timestamp)
      ) / 3600), 2
  ) AS AvgDowntimeHours
FROM FacilityMaintenance fm
JOIN Equipment e 
  ON fm.EquipmentID = e.EquipmentID
 WHERE fm.Status = 'Resolved' 
GROUP BY e.EquipmentID, e.Name
ORDER BY AvgDowntimeHours DESC;


-- 17. Most-reported equipment types
SELECT
  e.Type AS EquipmentType,
  COUNT(fm.MaintenanceID) AS IssueCount
FROM Equipment e
JOIN FacilityMaintenance fm 
  ON e.EquipmentID = fm.EquipmentID
GROUP BY e.Type
ORDER BY IssueCount DESC;


-- 18. Members never checked in
SELECT
  m.MemberID,
  m.Name AS MemberName,
  m.Email,
  m.Phone
FROM Member m
LEFT JOIN Attendance a 
  ON m.MemberID = a.MemberID
WHERE a.AttendanceID IS NULL
ORDER BY m.Name;


-- 19. Members inactive ≥ 15 / 30 days & risk category
SELECT
  m.MemberID,
  m.Name AS MemberName,
  COALESCE(MAX(a.Date), CURRENT_DATE) AS LastVisit,
  (CURRENT_DATE - COALESCE(MAX(a.Date), CURRENT_DATE)) AS DaysSinceLastVisit,
  CASE
    WHEN CURRENT_DATE - COALESCE(MAX(a.Date), CURRENT_DATE) >= 30 THEN 'High Risk'
    WHEN CURRENT_DATE - COALESCE(MAX(a.Date), CURRENT_DATE) >= 15 THEN 'Medium Risk'
    ELSE 'Low Risk'
  END AS RiskCategory
FROM Member m
LEFT JOIN Attendance a 
  ON m.MemberID = a.MemberID
GROUP BY m.MemberID, m.Name
ORDER BY DaysSinceLastVisit DESC;


-- 20. Top 3 most active members (by total check-ins)
SELECT
  m.MemberID,
  m.Name AS MemberName,
  COUNT(a.AttendanceID) AS TotalCheckIns
FROM Attendance a
JOIN Member m 
  ON a.MemberID = m.MemberID
GROUP BY m.MemberID, m.Name
ORDER BY TotalCheckIns DESC
LIMIT 3;


-- 21. Members with > 5 class enrollments
SELECT
  m.MemberID,
  m.Name AS MemberName,
  COUNT(ce.ClassID) AS EnrollmentCount
FROM Member m
JOIN ClassEnrollment ce 
  ON m.MemberID = ce.MemberID
GROUP BY m.MemberID, m.Name
HAVING COUNT(ce.ClassID) > 5
ORDER BY EnrollmentCount DESC;


-- 22. Members with unpaid bills
SELECT
  m.MemberID,
  m.Name AS MemberName,
  b.Amount,
  b.PaymentDate,
  b.Method,
  b.Status
FROM Billing b
JOIN Member m 
  ON b.MemberID = m.MemberID
WHERE b.Status = 'Unpaid'
ORDER BY b.PaymentDate ASC;


-- 23. CalculateTotalPayments() function (per-member total paid)
CREATE OR REPLACE FUNCTION CalculateTotalPayments(member_id_input INTEGER)
RETURNS DECIMAL(10,2) AS $$
DECLARE
  total DECIMAL(10,2);
BEGIN
  SELECT COALESCE(SUM(Amount),0)
    INTO total
  FROM Billing
  WHERE MemberID = member_id_input
    AND Status = 'Paid';
  RETURN total;
END;
$$ LANGUAGE plpgsql;

SELECT CalculateTotalPayments(3) AS TotalPaidByMember3;


-- 24. Membership plan utilization
SELECT
  ms.Type AS MembershipType,
  COUNT(*) AS MemberCount
FROM Member m
JOIN Membership ms
  ON m.MembershipID = ms.MembershipID
GROUP BY ms.Type
ORDER BY MemberCount DESC;


-- 25. Gender distribution of members 
SELECT
  m.Gender,
  COUNT(*) AS Count
FROM Member m
GROUP BY m.Gender
ORDER BY Count DESC;


-- 26. Age-group distribution 
SELECT
  CASE
    WHEN m.Age < 18 THEN '<18'
    WHEN m.Age BETWEEN 18 AND 25 THEN '18–25'
    WHEN m.Age BETWEEN 26 AND 35 THEN '26–35'
    WHEN m.Age BETWEEN 36 AND 50 THEN '36–50'
    ELSE '>50'
  END AS AgeGroup,
  COUNT(*) AS MemberCount
FROM Member m
GROUP BY AgeGroup
ORDER BY MemberCount DESC;


-- 27. Peak check-in hours 
SELECT
  EXTRACT(HOUR FROM a.CheckInTime) AS HourOfDay,
  COUNT(*) AS CheckInCount
FROM Attendance a
WHERE a.CheckInTime IS NOT NULL
GROUP BY HourOfDay
ORDER BY CheckInCount DESC
LIMIT 1;

-- 28. Average visit duration by month
SELECT
  TO_CHAR(a.Date, 'YYYY-MM') AS YearMonth,
  ROUND(
    AVG(
      EXTRACT(EPOCH FROM (a.CheckOutTime - a.CheckInTime)) / 3600
    ), 2 ) AS AvgDurationHours
FROM Attendance a
WHERE a.CheckInTime IS NOT NULL
  AND a.CheckOutTime IS NOT NULL
GROUP BY YearMonth
ORDER BY YearMonth;


-- 29. Class no-show rate 
WITH enr AS (
  SELECT
    fc.ClassID,
    fc.ClassName,
    COUNT(ce.MemberID) AS Enrolled
  FROM ClassEnrollment ce
  JOIN FitnessClass fc ON ce.ClassID = fc.ClassID
  GROUP BY fc.ClassID, fc.ClassName
), att AS (
  SELECT
    fc.ClassID,
    COUNT(DISTINCT a.MemberID) AS Attended
  FROM Attendance a
  JOIN ClassEnrollment ce
    ON a.MemberID = ce.MemberID
   AND a.Date = ce.EnrollmentDate
  JOIN FitnessClass fc
    ON ce.ClassID = fc.ClassID
  GROUP BY fc.ClassID
)
SELECT
  e.ClassID,
  e.ClassName,
  e.Enrolled,
  COALESCE(a.Attended, 0) AS Attended,
  ROUND(
    100.0 * (e.Enrolled - COALESCE(a.Attended, 0)) / e.Enrolled
  , 2)AS NoShowPercent
FROM enr e
LEFT JOIN att a ON e.ClassID = a.ClassID
ORDER BY NoShowPercent DESC;


-- 30. Overdue unpaid bills (> 30 days)
SELECT
  m.MemberID,
  m.Name AS MemberName,
  b.BillingID,
  b.PaymentDate,
  CURRENT_DATE - b.PaymentDate AS DaysOverdue,
  b.Amount
FROM Billing b
JOIN Member m
  ON b.MemberID = m.MemberID
WHERE b.Status != 'Paid'
  AND CURRENT_DATE - b.PaymentDate > 30
ORDER BY DaysOverdue DESC;


-- 31. New vs returning members
WITH first_visits AS (
  SELECT
    MemberID,
    MIN(Date) AS FirstDate
  FROM Attendance
  GROUP BY MemberID
)
SELECT
  SUM(CASE WHEN fv.FirstDate BETWEEN '2025-04-01' AND '2025-04-30' THEN 1 ELSE 0 END)
    AS NewMembers_April,
  SUM(CASE WHEN fv.FirstDate < '2025-04-01' THEN 1 ELSE 0 END)
    AS ReturningMembers_April
FROM first_visits fv
JOIN Attendance a
  ON fv.MemberID = a.MemberID
WHERE a.Date BETWEEN '2025-04-01' AND '2025-04-30';



-- 32. Upcoming maintenance overdue
SELECT
  fm.MaintenanceID,
  e.Name AS EquipmentName,
  fm.ReportedDate,
  CURRENT_DATE - fm.ReportedDate AS DaysOpen,
  fm.Issue
FROM FacilityMaintenance fm
JOIN Equipment e
  ON fm.EquipmentID = e.EquipmentID
WHERE fm.Status != 'Resolved'
  AND CURRENT_DATE - fm.ReportedDate > 7
ORDER BY DaysOpen DESC;


-- 33. Monthly revenue by payment method 
SELECT
  TO_CHAR(b.PaymentDate, 'YYYY-MM') AS YearMonth,
  b.Method AS PaymentMethod,
  SUM(b.Amount) AS TotalRevenue
FROM Billing b
WHERE b.Status = 'Paid'
GROUP BY YearMonth, b.Method
ORDER BY YearMonth, b.Method;
