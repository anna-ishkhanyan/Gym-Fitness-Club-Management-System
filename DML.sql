-- Insert data
-- ---------------------------------------------------------------------------
INSERT INTO Membership (Price, Duration, Type) VALUES
(15000.00, 1, 'Basic'),
(40000.00, 3, 'Standard'),
(75000.00, 6, 'Premium');


INSERT INTO Admin (Name, Role, Email, Phone) VALUES
('Sona Grigoryan', 'Manager', 'sona.grigoryan@gmail.com', '098256901'),
('Arman Petrosyan', 'Coordinator', 'arman.petrosyan@gmail.com', '094260812'),
('Lilit Harutyunyan', 'Coordinator', 'lilit.harutyunyan@gmail.com', '093360563');


INSERT INTO Equipment (Name, Type, Status) VALUES
('Treadmill', 'Cardio', 'Active'),
('Elliptical', 'Cardio', 'In Maintenance'),
('Elliptical', 'Cardio', 'Active'),
('Elliptical', 'Cardio', 'Active'),
('Bench Press', 'Strength', 'In Maintenance'),
('Bench Press', 'Strength', 'Active'),
('Bench Press', 'Strength', 'Active'),
('Bench Press', 'Strength', 'Active'),
('Rowing Machine', 'Cardio', 'Active'),
('Dumbbells', 'Strength', 'Active'),
('Squat Power Rack', 'Strength', 'Active'),
('Barbells', 'Strength', 'Active'),
('Weight Bench', 'Strength', 'Active'),
('Preacher Curl Bench', 'Strength', 'Active'),
('Leg Press Machine', 'Strength', 'Active'),
('Calf Machine', 'Strength', 'Active'),
('Lat Pull Down/Low Row', 'Strength', 'Active'),
('Kettlebells', 'Strength', 'Active'),
('Pilates Reformer', 'Pilates', 'Active'),
('Pilates Chair', 'Pilates', 'Active'),
('Ladder Barrel', 'Pilates', 'Active'),
('Boxing Ring', 'Boxing', 'Active');


INSERT INTO Trainer (Name, Phone, Email, Specialization) VALUES
('Narek Sargsyan', '094650978', 'narek.sargsyan@gmail.com', 'Weightlifting'),
('Mariam Hakobyan', '095030405', 'mariam.hakobyan@gmail.com', 'Weightlifting'),
('Gevorg Hovhannisyan', '096981586', 'gevorg.hovhannisyan@gmail.com', 'Weightlifting'),
('Anna Mkrtchyan', '097744847', 'anna.mkrtchyan@gmail.com', 'Pilates'),
('Hayk Margaryan', '095456123', 'hayk.margaryan@gmail.com', 'Boxing'),
('Vardan Avetisyan', '091234567', 'vardan.avetisyan@gmail.com', 'Cardio'),
('Araksya Davtyan', '091234568', 'araksya.davtyan@gmail.com', 'Pilates'),
('Tigran Gharibyan', '091234569', 'tigran.gharibyan@gmail.com', 'Boxing'),
('Hermine Mkrtchyan', '091234570', 'hermine.mkrtchyan@gmail.com', 'Yoga'),
('Gor Hovhannisyan', '091234571', 'gor.hovhannisyan@gmail.com', 'Weightlifting');


INSERT INTO Member (Name, Age, Gender, Email, Phone, MembershipID) VALUES
('Aram Harutyunyan', 25, 'Male', 'aram.h@gmail.com', '098899865', 1),
('Ani Sargsyan', 22, 'Female', 'ani.sarg2@gmail.com', '099147414', 2),
('Karen Petrosyan', 30, 'Male', 'karenp@gmail.com', '091030499', 3),
('Mane Hovhannisyan', 27, 'Female', 'manehovhan@gmail.com', '094658123', 2),
('David Grigoryan', 35, 'Male', 'david_grig@gmail.com', '097744179', 1),
('Nare Ter-Petrosyan', 24, 'Female', 'nare_nare@gmail.com', '093659515', 1),
('Tigran Ghazaryan', 28, 'Male', 'tigrang1999@gmail.com', '095633987', 3),
('Siranush Avetisyan', 26, 'Female', 'siranushavetisyan@gmail.com', '09546565', 1),
('Sofya Danielyan', 21, 'Female', 'sofya.danielyan@gmail.com', '091123456', 1),
('Hovhannes Khachatryan', 32, 'Male', 'hovhannes.kh@gmail.com', '093654321', 2),
('Lusine Karapetyan', 29, 'Female', 'lusine.karapetyan@gmail.com', '094789456', 3),
('Gor Sahakyan', 26, 'Male', 'gor.sahakyan@gmail.com', '098321654', 2),
('Marine Vardanyan', 23, 'Female', 'marine.vardanyan@gmail.com', '095456789', 1),
('Suren Manukyan', 34, 'Male', 'suren.manukyan@gmail.com', '092147258', 3),
('Hasmik Mkrtchyan', 31, 'Female', 'hasmik.mkrtchyan@gmail.com', '097963852', 2),
('Vahe Hakobyan', 28, 'Male', 'vahe.hakobyan@gmail.com', '091369852', 1),
('Milena Hakobyan', 24, 'Female', 'milena.hakobyan@gmail.com', '093258147', 2),
('Artur Gevorgyan', 29, 'Male', 'artur.gevorgyan@gmail.com', '094785123', 3),
('Alina Grigoryan', 22, 'Female', 'alina.grigoryan@gmail.com', '095741236', 1),
('Samvel Avetisyan', 33, 'Male', 'samvel.avetisyan@gmail.com', '096321478', 3),
('Tatev Abrahamyan', 27, 'Female', 'tatev.abrahamyan@gmail.com', '098654789', 2),
('Hovhannes Harutyunyan', 25, 'Male', 'hovhannes.h@gmail.com', '0941234572', 2),
('Sona Petrosyan', 25, 'Female', 'sona.petrosyan@gmail.com', '0912345682', 1),
('Gagik Grigoryan', 32, 'Male', 'gagik.grigoryan@gmail.com', '0957432183', 2),
('Lilit Mkrtchyan', 26, 'Female', 'lilit.mkrtchyan@gmail.com', '0939876544', 3),
('Hayk Avetisyan', 31, 'Male', 'hayk.avetisyan@gmail.com', '0914376255', 1),
('Narek Sargsyan', 28, 'Male', 'narek.sargsyan@gmail.com', '0951986346', 2),
('Anahit Khachatryan', 29, 'Female', 'anahit.khachatryan@gmail.com', '0918462577', 3),
('Tigran Hovhannisyan', 23, 'Male', 'tigran.hovhannisyan@gmail.com', '0935748298', 1),
('Shushan Mkrtchyan', 34, 'Female', 'shushan.mkrtchyan@gmail.com', '0956128379', 2),
('Ararat Danielyan', 27, 'Male', 'ararat.danielyan@gmail.com', '0941982350', 3),
('Mariam Harutyunyan', 21, 'Female', 'mariam.harutyunyan@gmail.com', '0942837461', 1),
('Sargis Ghazaryan', 25, 'Male', 'sargis.ghazaryan@gmail.com', '0917532942', 2),
('Ruzanna Avetisyan', 28, 'Female', 'ruzanna.avetisyan@gmail.com', '0954238973', 3),
('Ashot Mkrtchyan', 33, 'Male', 'ashot.mkrtchyan@gmail.com', '0939246574', 1),
('Lusine Sargsyan', 29, 'Female', 'lusine.sargsyan@gmail.com', '0943859675', 2),
('Vache Khachatryan', 30, 'Male', 'vache.khachatryan@gmail.com', '0916423506', 3),
('Liana Petrosyan', 24, 'Female', 'liana.petrosyan@gmail.com', '0915617427', 1),
('Gor Grigoryan', 27, 'Male', 'gor.grigoryan@gmail.com', '0936548198', 2),
('Anush Mkrtchyan', 22, 'Female', 'anush.mkrtchyan@gmail.com', '0957826539', 3),
('Hrant Hakobyan', 31, 'Male', 'hrant.hakobyan@gmail.com', '0913124870', 1),
('Tatev Ghazaryan', 23, 'Female', 'tatev.ghazaryan@gmail.com', '0949203671', 2),
('Viktor Harutyunyan', 26, 'Male', 'viktor.harutyunyan@gmail.com', '0914756202', 3),
('Shoghik Avetisyan', 32, 'Female', 'shoghik.avetisyan@gmail.com', '0913648273', 1),
('Sergey Danielyan', 28, 'Male', 'sergey.danielyan@gmail.com', '0956420394', 2),
('Liana Ghazaryan', 24, 'Female', 'liana.ghazaryan@gmail.com', '0949571325', 3),
('Ruben Petrosyan', 30, 'Male', 'ruben.petrosyan@gmail.com', '0918326476', 1),
('Nora Hovhannisyan', 27, 'Female', 'nora.hovhannisyan@gmail.com', '0952714067', 2),
('Hakob Mkrtchyan', 28, 'Male', 'hakob.mkrtchyan@gmail.com', '0935026748', 3),
('Gohar Avetisyan', 25, 'Female', 'gohar.avetisyan@gmail.com', '0943762589', 1),
('Artur Harutyunyan', 26, 'Male', 'artur.harutyunyan@gmail.com', '0956014920', 2),
('Arman Sargsyan', 22, 'Male', 'arman.sargsyan@gmail.com', '0938145291', 3),
('Ani Hovhannisyan', 30, 'Female', 'ani.hovhannisyan@gmail.com', '0942463573', 3),
('Aram Mkrtchyan', 27, 'Male', 'aram.mkrtchyan@gmail.com', '0915438214', 2),
('Lusine Harutyunyan', 22, 'Female', 'lusine.harutyunyan@gmail.com', '0948650735', 1),
('Suren Grigoryan', 35, 'Male', 'suren.grigoryan@gmail.com', '0957436726', 2),
('Tatev Harutyunyan', 29, 'Female', 'tatev.harutyunyan@gmail.com', '0935261847', 3),
('Gor Hovhannisyan', 32, 'Male', 'gor.hovhannisyan@gmail.com', '0941236598', 1),
('Milena Avetisyan', 24, 'Female', 'milena.avetisyan@gmail.com', '0916329749', 1),
('Vahe Mkrtchyan', 28, 'Male', 'vahe.mkrtchyan@gmail.com', '0939471860', 3),
('Samvel Harutyunyan', 30, 'Male', 'samvel.harutyunyan@gmail.com', '0912843761', 2),
('Ani Danielyan', 26, 'Female', 'ani.danielyan@gmail.com', '0946823952', 2),
('Karen Avetisyan', 29, 'Male', 'karen.avetisyan@gmail.com', '0913654783', 1),
('Mane Sargsyan', 23, 'Female', 'mane.sargsyan@gmail.com', '0957365194', 3),
('Tigran Petrosyan', 31, 'Male', 'tigran.petrosyan@gmail.com', '0914172805', 2),
('Lilit Harutyunyan', 27, 'Female', 'lilit.harutyunyan@gmail.com', '0946849206', 1),
('David Danielyan', 28, 'Male', 'david.danielyan@gmail.com', '0959215637', 3),
('Sona Grigoryan', 25, 'Female', 'sona.grigoryan2@gmail.com', '0912365498', 1),
('Hayk Hovhannisyan', 32, 'Male', 'hayk.hovhannisyan@gmail.com', '0956832139', 2),
('Anahit Mkrtchyan', 24, 'Female', 'anahit.mkrtchyan@gmail.com', '0945847230', 3),
('Gagik Avetisyan', 29, 'Male', 'gagik.avetisyan@gmail.com', '0937468201', 1),
('Mariam Sargsyan', 26, 'Female', 'mariam.sargsyan@gmail.com', '0943285612', 2),
('Armen Harutyunyan', 30, 'Male', 'armen.harutyunyan@gmail.com', '0914758203', 3),
('Nune Danielyan', 22, 'Female', 'nune.danielyan@gmail.com', '0951837424', 1),
('Ruben Ghazaryan', 34, 'Male', 'ruben.ghazaryan@gmail.com', '0916539275', 2);


INSERT INTO Attendance (MemberID, Date, CheckInTime, CheckOutTime) VALUES
(57, '2025-04-25', '06:51:00', '07:35:00'),
(57, '2025-04-25', '09:09:00', '09:51:00'),
(46, '2025-04-25', '16:00:00', '16:40:00'),
(37, '2025-04-25', '14:54:00', '16:10:00'),
(21, '2025-04-25', '19:20:00', '20:06:00'),
(63, '2025-04-25', '11:48:00', '13:14:00'),
(5, '2025-04-25', '08:06:00', '09:21:00'),
(42, '2025-04-25', '17:36:00', '18:32:00'),
(46, '2025-04-25', '15:50:00', '17:13:00'),
(34, '2025-04-25', '06:06:00', '07:32:00'),
(41, '2025-04-25', '16:04:00', '16:45:00'),
(38, '2025-04-25', '16:11:00', '17:22:00'),
(66, '2025-04-25', '18:36:00', '19:25:00'),
(43, '2025-04-26', '20:34:00', '21:14:00'),
(67, '2025-04-26', '19:16:00', '19:59:00'),
(61, '2025-04-26', '18:29:00', '19:54:00'),
(24, '2025-04-26', '15:43:00', '16:53:00'),
(54, '2025-04-26', '07:29:00', '08:51:00'),
(18, '2025-04-26', '10:13:00', '11:21:00'),
(52, '2025-04-26', '15:13:00', '16:23:00'),
(14, '2025-04-26', '09:57:00', '11:17:00'),
(9, '2025-04-26', '16:29:00', '17:06:00'),
(29, '2025-04-26', '18:25:00', '19:13:00'),
(59, '2025-04-26', '09:53:00', '10:53:00'),
(6, '2025-04-26', '14:44:00', '15:23:00'),
(30, '2025-04-26', '09:04:00', '10:26:00'),
(8, '2025-04-27', '20:41:00', '22:00:00'),
(52, '2025-04-27', '14:05:00', '15:23:00'),
(64, '2025-04-27', '08:04:00', '09:03:00'),
(46, '2025-04-27', '11:09:00', '12:33:00'),
(55, '2025-04-27', '06:49:00', '08:00:00'),
(16, '2025-04-27', '09:17:00', '10:30:00'),
(26, '2025-04-27', '16:20:00', '17:48:00'),
(50, '2025-04-27', '16:25:00', '17:38:00'),
(50, '2025-04-27', '17:14:00', '17:48:00'),
(15, '2025-04-27', '11:20:00', '11:52:00'),
(62, '2025-04-27', '13:42:00', '14:15:00'),
(20, '2025-04-27', '09:58:00', '11:21:00'),
(12, '2025-04-27', '17:54:00', '18:33:00'),
(27, '2025-04-28', '13:50:00', '15:15:00'),
(55, '2025-04-28', '15:49:00', '16:36:00'),
(11, '2025-04-28', '12:19:00', '13:48:00'),
(32, '2025-04-28', '10:44:00', '11:16:00'),
(50, '2025-04-28', '07:40:00', '08:13:00'),
(66, '2025-04-28', '16:02:00', '16:59:00'),
(57, '2025-04-28', '15:54:00', '16:52:00'),
(55, '2025-04-28', '13:49:00', '15:18:00'),
(16, '2025-04-28', '20:20:00', '20:59:00'),
(34, '2025-04-28', '08:59:00', '09:59:00'),
(68, '2025-04-28', '08:36:00', '09:39:00'),
(19, '2025-04-29', '08:08:00', '09:09:00'),
(20, '2025-04-29', '08:44:00', '09:57:00'),
(21, '2025-04-29', '17:20:00', '18:09:00'),
(36, '2025-04-29', '15:53:00', '16:58:00'),
(40, '2025-04-29', '15:41:00', '16:51:00'),
(21, '2025-04-29', '16:29:00', '17:35:00'),
(40, '2025-04-29', '20:19:00', '21:38:00'),
(51, '2025-04-29', '08:45:00', '09:42:00'),
(10, '2025-04-29', '11:21:00', '12:49:00'),
(32, '2025-04-29', '19:48:00', '20:21:00'),
(5, '2025-04-29', '18:25:00', '19:33:00'),
(41, '2025-04-29', '17:23:00', '18:40:00'),
(28, '2025-04-29', '11:14:00', '12:14:00'),
(51, '2025-04-30', '14:55:00', '15:52:00'),
(60, '2025-04-30', '15:08:00', '16:23:00'),
(57, '2025-04-30', '17:31:00', '18:36:00'),
(7, '2025-04-30', '12:06:00', '13:27:00'),
(46, '2025-04-30', '11:22:00', '12:32:00'),
(25, '2025-04-30', '18:44:00', '19:31:00'),
(49, '2025-04-30', '17:01:00', '17:42:00'),
(3, '2025-04-30', '20:26:00', '21:06:00'),
(31, '2025-04-30', '14:09:00', '15:11:00'),
(50, '2025-04-30', '15:18:00', '16:05:00'),
(49, '2025-04-30', '17:10:00', '18:40:00'),
(45, '2025-04-30', '07:17:00', '08:46:00'),
(32, '2025-04-30', '14:21:00', '15:02:00'),
(44, '2025-05-01', '09:32:00', '10:07:00'),
(23, '2025-05-01', '18:10:00', '19:07:00'),
(44, '2025-05-01', '18:48:00', '20:17:00'),
(25, '2025-05-01', '10:52:00', '12:17:00'),
(37, '2025-05-01', '10:10:00', '11:11:00'),
(37, '2025-05-01', '09:39:00', '10:24:00'),
(42, '2025-05-01', '14:37:00', '15:32:00'),
(32, '2025-05-01', '08:08:00', '09:02:00'),
(28, '2025-05-01', '15:20:00', '16:10:00'),
(40, '2025-05-01', '12:52:00', '13:41:00'),
(7, '2025-05-01', '07:20:00', '07:59:00');


INSERT INTO Billing (MemberID, Amount, PaymentDate, Method, Status) VALUES
(1, 15000.00, '2025-04-01', 'Cash', 'Paid'),
(2, 40000.00, '2025-04-02', 'Card', 'Paid'),
(3, 75000.00, '2025-04-12', 'Online', 'Pending'),
(4, 40000.00, '2025-04-13', 'Cash', 'Paid'),
(5, 15000.00, '2025-04-05', 'Cash', 'Paid'),
(6, 40000.00, '2025-04-06', 'Card', 'Paid'),
(7, 75000.00, '2025-04-07', 'Online', 'Pending'),
(8, 40000.00, '2025-04-08', 'Cash', 'Paid'),
(9, 15000.00, '2025-04-09', 'Online', 'Paid'),
(10, 40000.00, '2025-04-10', 'Card', 'Pending'),
(11, 75000.00, '2025-04-11', 'Online', 'Paid'),
(12, 40000.00, '2025-04-12', 'Cash', 'Paid'),
(13, 15000.00, '2025-04-13', 'Online', 'Paid');


INSERT INTO WorkoutSchedule (Date, Time, Activity, TrainerID) VALUES
('2025-04-27', '09:00:00', 'Morning Pilates', 4),
('2025-04-27', '18:00:00', 'Weightlifting', 1),
('2025-04-28', '09:00:00', 'Morning Pilates', 4),
('2025-04-28', '17:00:00', 'Boxing Training', 5),
('2025-04-29', '09:00:00', 'Morning Pilates', 4),
('2025-04-29', '18:00:00', 'Weightlifting', 1),
('2025-04-30', '09:00:00', 'Morning Pilates', 4),
('2025-04-30', '17:00:00', 'Boxing Training', 5),
('2025-05-01', '09:00:00', 'Morning Pilates', 4),
('2025-05-01', '18:00:00', 'Weightlifting', 1),
('2025-05-02', '09:00:00', 'Morning Pilates', 4),
('2025-05-02', '18:00:00', 'Weightlifting', 1),
('2025-05-03', '09:00:00', 'Morning Pilates', 4),
('2025-05-03', '18:00:00', 'Boxing Training', 5),
('2025-05-04', '09:00:00', 'Morning Pilates', 4),
('2025-05-04', '18:00:00', 'Weightlifting', 1),
('2025-05-05', '09:00:00', 'Morning Pilates', 4),
('2025-05-05', '18:00:00', 'Boxing Training', 5),
('2025-05-06', '09:00:00', 'Morning Pilates', 4),
('2025-05-06', '18:00:00', 'Weightlifting', 1);


INSERT INTO FitnessClass (ClassName, ScheduleTime, MaxParticipants, TrainerID) VALUES
('Morning Pilates', '2025-04-27 09:00:00', 20, 4),
('Weightlifting', '2025-04-27 18:00:00', 18, 1),
('Morning Pilates', '2025-04-28 09:00:00', 20, 4),
('Boxing Training', '2025-04-28 17:00:00', 18, 5),
('Morning Pilates', '2025-04-29 09:00:00', 20, 4),
('Weightlifting', '2025-04-29 18:00:00', 18, 1),
('Morning Pilates', '2025-04-30 09:00:00', 20, 4),
('Boxing Training', '2025-04-30 17:00:00', 18, 5),
('Morning Pilates', '2025-05-01 09:00:00', 20, 4),
('Weightlifting', '2025-05-01 18:00:00', 18, 1),
('Advanced Pilates', '2025-05-02 09:00:00', 20, 4),
('Cardio Workout', '2025-05-02 18:00:00', 18, 1),
('Strength Training', '2025-05-03 09:00:00', 20, 4),
('Boxing Sparring', '2025-05-03 18:00:00', 18, 5),
('Yoga Session', '2025-05-04 09:00:00', 20, 4),
('Strength Circuit', '2025-05-04 18:00:00', 18, 1),
('Pilates Reformer', '2025-05-05 09:00:00', 20, 4),
('Boxing Training', '2025-05-05 18:00:00', 18, 5),
('Strength Class', '2025-05-06 18:00:00', 18, 1);


INSERT INTO ClassEnrollment (MemberID, ClassID, EnrollmentDate, Status) VALUES
(2, 1, '2025-04-20', 'Finished'),
(5, 1, '2025-04-21', 'Finished'),
(7, 2, '2025-04-22', 'Active'),
(8, 1, '2025-04-23', 'Active'),
(9, 2, '2025-04-23', 'Finished'),
(10, 1, '2025-04-23', 'Active'),
(11, 1, '2025-04-23', 'Active'),
(12, 2, '2025-04-24', 'Active'),
(13, 2, '2025-04-24', 'Active'),
(1, 1, '2025-04-24', 'Active'),
(4, 2, '2025-04-24', 'Active'),
(6, 1, '2025-04-24', 'Active'),
(3, 2, '2025-04-25', 'Finished'),
(4, 3, '2025-04-26', 'Active'),
(5, 4, '2025-04-26', 'Finished'),
(6, 5, '2025-04-27', 'Active'),
(7, 6, '2025-04-27', 'Active'),
(8, 7, '2025-04-28', 'Active'),
(9, 8, '2025-04-28', 'Finished'),
(10, 9, '2025-04-29', 'Active'),
(11, 10, '2025-04-29', 'Finished');


INSERT INTO FacilityMaintenance (EquipmentID, ReportedDate, Issue, Status, AdminID) VALUES
(5, '2025-04-24', 'Loose bolt', 'Pending', 1),
(2, '2025-04-24', 'Screen issue', 'In Progress', 2),
(5, '2025-04-26', 'Broken dumbbell handle', 'In Progress', 3);