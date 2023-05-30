--Find all Students with FirstName = Antonio
SELECT *
FROM dbo.Student
WHERE FirstName = 'Antonio'

--Find all Students with DateOfBirth greater than ‘01.01.1999’
SELECT *
FROM dbo.Student
WHERE DateOfBirth > '01.01.1999'

--Find all Students with LastName starting With ‘J’ enrolled in January/1998
SELECT *
FROM dbo.Student
WHERE LastName like 'J%' AND EnrolledDate like '1998-01%'

--List all Students ordered by FirstName
SELECT *
FROM dbo.Student
ORDER BY FirstName ASC

--List all Teacher Last Names and Student Last Names in single result set. Remove duplicates
SELECT LastName
FROM dbo.Teacher
UNION 
SELECT LastName
FROM dbo.Student

--Create Foreign key constraints from diagram or with script
ALTER TABLE dbo.GradeDetails ADD CONSTRAINT FK_GradeDetails_Grade FOREIGN KEY (GradeID) REFERENCES dbo.Grade(ID)
ALTER TABLE dbo.Grade ADD CONSTRAINT FK_Grade_Student FOREIGN KEY (StudentID) REFERENCES dbo.Student(ID)
ALTER TABLE dbo.Grade ADD CONSTRAINT FK_Grade_Teacher FOREIGN KEY (TeacherID) REFERENCES dbo.Teacher(ID)
ALTER TABLE dbo.Grade ADD CONSTRAINT FK_Grade_Cours FOREIGN KEY (CourseID) REFERENCES dbo.Course(ID)
ALTER TABLE dbo.GradeDetails ADD CONSTRAINT FK_GradeDetails_AchievementType FOREIGN KEY (AchievementTypeID) REFERENCES dbo.AchievementType(ID)

--List all possible combinations of Courses names and AchievementType names that can be passed by student
SELECT A.Name AS CourseName,C.Name as AchievementName
FROM dbo.Course C
CROSS JOIN AchievementType A

--List all Teachers without exam Grade
SELECT T.FirstName
FROM dbo.Teacher T
LEFT JOIN Grade G
ON T.ID = G.TeacherID
WHERE G.TeacherID IS NULL





