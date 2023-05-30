
--Calculate the count of all grades per Teacher in the system
SELECT TeacherID,COUNT(Grade) AS Totl
FROM dbo.Grade
GROUP BY TeacherID


--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100
SELECT TeacherID, COUNT(Grade) as TOTAL
FROM dbo.Grade
WHERE StudentID < 100
GROUP BY TeacherID

--Find the Maximal Grade, and the Average Grade per Student on all grades in the system
SELECT StudentID, MAX(Grade) as MaxGrade, AVG(Grade) as AverageGrade
FROM dbo.Grade
GROUP BY StudentID
ORDER BY StudentID

--Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200
SELECT TeacherID,SUM(Grade) as TotalGrade
FROM dbo.Grade
GROUP BY TeacherID
HAVING COUNT(Grade) > 200


--Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. Filter only records where Maximal Grade is equal to Average Grade
SELECT StudentID,COUNT(Grade) as Cgrade,MAX(Grade) as Mgrade,AVG(Grade) as Agrade
FROM dbo.Grade
GROUP BY StudentID
HAVING MAX(Grade) = AVG(Grade)


--List Student First Name and Last Name next to the other details from previous query
SELECT StudentID,s.FirstName,s.LastName, COUNT(Grade) as GradeCount,max(Grade) as MaxGrade,avg(Grade) as AvgGrade
FROM dbo.Grade g
INNER JOIN Student s ON s.ID = g.StudentID
GROUP BY StudentID,s.FirstName,s.LastName
HAVING MAX(Grade) = AVG(Grade)

GO
--Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student
CREATE VIEW vv_StudentGrades
AS
SELECT StudentID,COUNT(GRADE) AS CountGrade
FROM dbo.Grade
GROUP BY StudentID

select *
from dbo.vv_StudentGrades


--Change the view to show Student First and Last Names instead of StudentID
GO
ALTER VIEW vv_StudentGrades
AS
SELECT s.FirstName, s.LastName, COUNT(Grade) AS CountGrade
FROM dbo.Grade g
INNER JOIN Student s ON g.StudentID = s.ID
GROUP BY s.FirstName, s.LastName
GO
--List all rows from view ordered by biggest Grade Count
SELECT *
FROM DBO.vv_StudentGrades
ORDER BY  CountGrade DESC
