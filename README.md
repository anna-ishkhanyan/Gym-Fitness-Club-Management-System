#!/bin/bash

# Create a new README file

cat <<EOL > README.md
# Gym & Fitness Club Management System

### Team #8

**Team Members:**
- Anna Ishkhanyan
- Yevgine Mnatsakanyan
- Gevorg Gevorgyan

---

## 📋 Project Overview
The **Gym & Fitness Club Management System** is developed to effectively manage the operations of a fitness center. It ensures smooth handling of member profiles, membership plans, attendance tracking, workout scheduling, trainer management, fitness classes, equipment inventory, and billing processes.  
The system emphasizes automation, reduces data redundancy, and provides reliable reporting through a well-organized SQL-based database.

---

## 🎯 Project Goals
- Automate daily operations within the gym
- Manage memberships, attendance, and scheduling efficiently
- Enable workout and class bookings for members
- Assign trainers to members and maintain staff records
- Track gym equipment usage and maintenance
- Process billing and payments securely
- Ensure database consistency and integrity

---

## 🛠️ Basic Database Management Operations
The system supports several essential operations:

##### Membership Management
- Store user profiles
- Track membership status and expiration dates

##### Attendance Tracking
- Record gym check-ins and fitness class participation

##### Workout and Class Scheduling
- Allow members to reserve training sessions and fitness classes

##### Trainer and Staff Management
- Assign trainers to clients
- Maintain and update qualification information

##### Equipment Inventory Management
- Track equipment availability
- Report maintenance needs

##### Billing and Payments
- Process transactions securely
- Issue invoices and manage membership fees

---

## 👥 Main End-Users
##### Gym Members
- Purchase memberships
- Register for classes
- Track attendance and personal progress
- Make payments and receive billing notifications

##### Trainers and Staff
- View assigned members
- Manage class schedules
- Update client progress logs
- Report equipment issues

##### Administrators
- Manage memberships, transactions, and class schedules
- Monitor facility maintenance
- Generate reports and ensure data consistency

---

## 🧩 Specific User Operations
##### Gym Members
- Register, select a membership plan, and check membership status
- Register for fitness sessions
- Track attendance and personal progress
- Make payments and receive billing notifications

##### Trainers and Staff
- View assigned clients
- Update client progress records
- Manage training session and class schedules
- Track equipment usage and report facility issues

##### Administrators
- Access and manage member registrations, renewals, and cancellations
- Generate reports on attendance, class participation, and financial operations
- Monitor database consistency (expired memberships lose access)

---

## 🛡️ Database Consistency Measures
- **Automatic Data Updates:** Member cancellation triggers automatic removal of class bookings and stops billing.
- **Equipment Maintenance Logs:** Maintenance updates are reflected in equipment availability.
- **Secure Financial Tracking:** Prevents duplicate charges and securely stores membership payments.

EOL
