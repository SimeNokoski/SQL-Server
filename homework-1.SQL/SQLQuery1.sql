--CREATE DATABASE SEDCACADEMYDB

CREATE TABLE dbo.Student(
Id INT IDENTITY(1,1) NOT NULL,
FirstName NVARCHAR(20) NOT NULL,
LastName NVARCHAR(50) NOT NULL,
DateOfBirth DATE  NULL,
EnrolledDate DATE  NULL,
Gender NCHAR(1) NULL,
NationalIdNumber INT NULL,
StudentCardNumber INT  NULL,
CONSTRAINT PK_Student PRIMARY KEY CLUSTERED (Id)
)

CREATE TABLE dbo.Teacher(
Id INT IDENTITY(1,1) NOT NULL,
FirstName NVARCHAR(20) NOT NULL,
LastName NVARCHAR(50) NOT NULL,
DateOfBirth DATE  NULL,
AcademicRank NVARCHAR(50)  NULL,
HireDate DATE  NULL,
CONSTRAINT PK_Teacher PRIMARY KEY CLUSTERED (Id)
)

CREATE TABLE dbo.Grade(
Id INT IDENTITY(1,1) NOT NULL,
StudentId INT NULL,
CourseId INT NULL,
TeacherId INT NULL,
Grade FLOAT NULL,
Comment NVARCHAR(MAX) NULL,
CreatedDate DATE NULL,
CONSTRAINT PK_Grade PRIMARY KEY CLUSTERED (Id)
)


CREATE TABLE dbo.Course(
Id INT IDENTITY(1,1) NOT NULL,
Name NVARCHAR(20)  NOT NULL,
Credit INT NULL,
AcademicYear DATE NULL,
Semester INT NULL,
CONSTRAINT PK_Course PRIMARY KEY CLUSTERED (Id)
)

CREATE TABLE dbo.GradeDetails(
Id INT IDENTITY(1,1) NOT NULL,
GradeId INT NULL,
AchievementTypeId INT NULL,
AchievementPoints INT NULL,
AchievementMaxPoints INT NULL,
AchievementDate DATE NULL,
CONSTRAINT PK_GradeDetails PRIMARY KEY CLUSTERED (Id)
)

CREATE TABLE dbo.AchievementType(
Id INT IDENTITY(1,1) NOT NULL,
Name NVARCHAR(20)  NOT NULL,
Description NVARCHAR(MAX)  NULL,
ParticipationRate DECIMAL(7,7) NULL,
CONSTRAINT PK_AchievementType PRIMARY KEY CLUSTERED (Id)
)

