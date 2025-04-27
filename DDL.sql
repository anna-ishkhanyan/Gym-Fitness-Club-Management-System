-- Drop existing tables and types
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS FacilityMaintenance CASCADE;
DROP TABLE IF EXISTS ClassEnrollment CASCADE;
DROP TABLE IF EXISTS Attendance CASCADE;
DROP TABLE IF EXISTS Billing CASCADE;
DROP TABLE IF EXISTS WorkoutSchedule CASCADE;
DROP TABLE IF EXISTS FitnessClass CASCADE;
DROP TABLE IF EXISTS Trainer CASCADE;
DROP TABLE IF EXISTS Equipment CASCADE;
DROP TABLE IF EXISTS Admin CASCADE;
DROP TABLE IF EXISTS Member CASCADE;
DROP TABLE IF EXISTS Membership CASCADE;

DROP TYPE IF EXISTS membership_type CASCADE;
DROP TYPE IF EXISTS billing_method CASCADE;
DROP TYPE IF EXISTS maintenance_status CASCADE;
DROP TYPE IF EXISTS equipment_status CASCADE;


-- Create enum types
-- ---------------------------------------------------------------------------
CREATE TYPE membership_type AS ENUM ('Basic', 'Standard', 'Premium');
CREATE TYPE billing_method AS ENUM ('Cash', 'Card', 'Online');
CREATE TYPE maintenance_status AS ENUM ('Pending', 'In Progress', 'Resolved');
CREATE TYPE equipment_status  AS ENUM ('Active', 'In Maintenance', 'Retired');


-- Tables
-- ---------------------------------------------------------------------------
CREATE TABLE Membership (
    MembershipID SERIAL PRIMARY KEY,
    Price DECIMAL(10,2) NOT NULL
			CHECK (Price >= 0),
    Duration INT NOT NULL
        	CHECK (Duration > 0),  -- duration in months
    Type membership_type NOT NULL
);


CREATE TABLE Member (
    MemberID SERIAL PRIMARY KEY,
    Name TEXT NOT NULL,
    Age INT 
			CHECK (Age >= 0),
    Gender TEXT,
    Email TEXT UNIQUE,
    Phone TEXT UNIQUE,
    MembershipID INTEGER 
			REFERENCES Membership(MembershipID) ON DELETE SET NULL
);


CREATE TABLE Equipment (
  EquipmentID SERIAL PRIMARY KEY,
  Name TEXT NOT NULL,
  Type TEXT,
  Status equipment_status NOT NULL
			DEFAULT 'Active'
);


CREATE TABLE Admin (
    AdminID SERIAL PRIMARY KEY,
    Name TEXT NOT NULL,
    Role TEXT,
    Email TEXT UNIQUE,
    Phone TEXT UNIQUE
);


CREATE TABLE Trainer (
    TrainerID SERIAL PRIMARY KEY,
    Name TEXT NOT NULL,
    Phone TEXT UNIQUE,
    Email TEXT UNIQUE,
    Specialization TEXT
);


CREATE TABLE Attendance (
  AttendanceID SERIAL PRIMARY KEY,
  MemberID INTEGER NOT NULL
  			REFERENCES Member(MemberID) ON DELETE CASCADE,
  Date DATE NOT NULL
			DEFAULT CURRENT_DATE,
  CheckInTime TIME NOT NULL
  			DEFAULT LOCALTIME,
  CheckOutTime TIME,
  CONSTRAINT chk_time_order
    		CHECK (
      			CheckOutTime IS NULL
      			OR CheckOutTime >= CheckInTime
   			)
);


CREATE TABLE Billing (
  BillingID SERIAL PRIMARY KEY,
  MemberID INTEGER NOT NULL
  			REFERENCES Member(MemberID) ON DELETE CASCADE,
  Amount DECIMAL(10,2) NOT NULL
			CHECK (Amount >= 0),
  PaymentDate DATE DEFAULT CURRENT_DATE,
  Method billing_method,
  Status TEXT NOT NULL
       		DEFAULT 'Unpaid'
        	CHECK (Status IN ('Paid','Pending')),
  CONSTRAINT chk_no_date_if_unpaid
    		CHECK (Status <> 'Paid' OR PaymentDate IS NOT NULL)
);


CREATE TABLE WorkoutSchedule (
    ScheduleID SERIAL PRIMARY KEY,
    Date DATE NOT NULL,
    Time TIME NOT NULL,
    Activity TEXT,
    TrainerID INTEGER
			REFERENCES Trainer(TrainerID) ON DELETE SET NULL
);


CREATE TABLE FitnessClass (
    ClassID SERIAL PRIMARY KEY,
    ClassName TEXT NOT NULL,
    ScheduleTime TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    MaxParticipants INT
			CHECK (MaxParticipants > 0),
    TrainerID INTEGER  
			REFERENCES Trainer(TrainerID) ON DELETE SET NULL
);


CREATE TABLE ClassEnrollment (
  MemberID INTEGER NOT NULL
			REFERENCES Member(MemberID) ON DELETE CASCADE,
  ClassID INTEGER NOT NULL
			REFERENCES FitnessClass(ClassID) ON DELETE CASCADE,
  EnrollmentDate DATE NOT NULL
			DEFAULT CURRENT_DATE,
  Status TEXT NOT NULL
			DEFAULT 'Enrolled',
  PRIMARY KEY (MemberID, ClassID)
);


CREATE TABLE FacilityMaintenance (
  MaintenanceID SERIAL PRIMARY KEY,
  EquipmentID INTEGER NOT NULL
  			REFERENCES Equipment(EquipmentID) ON DELETE CASCADE,
  ReportedDate DATE NOT NULL
            DEFAULT CURRENT_DATE,
  Issue TEXT,
  Status maintenance_status NOT NULL
            DEFAULT 'Pending',
  AdminID INTEGER     
  			REFERENCES Admin(AdminID) ON DELETE SET NULL,
  			CONSTRAINT chk_reported_not_future
    		CHECK (ReportedDate <= CURRENT_DATE)
);
