--Declare scalar variable for storing FirstName values
-- Assign value ‘Antonio’ to the FirstName variable
-- Find all Students having FirstName same as the variable
DECLARE @FirstName NVARCHAR(50)
SET @FirstName = 'Antonio'

SELECT *
FROM dbo.Student
WHERE FirstName = @FirstName

--Declare table variable that will contain StudentId, StudentName and DateOfBirth
--Fill the table variable with all Female students
DECLARE @StudentNew TABLE
(StudentId INT ,StudentName NVARCHAR(50) ,DateOfBirth DATE)

INSERT INTO @StudentNew
SELECT ID,FirstName,DateOfBirth
FROM dbo.Student
WHERE Gender = 'F'

SELECT *
FROM @StudentNew

--Declare temp table that will contain LastName and EnrolledDate columns
--Fill the temp table with all Male students having First Name starting with ‘A’
--Retrieve the students from the table which last name is with 7 characters
CREATE TABLE #TempTable
(LastName NVARCHAR(50), EnrolledDate date)

INSERT INTO #TempTable
SELECT LastName,EnrolledDate
FROM dbo.Student
WHERE FirstName like 'A%' 

SELECT *
FROM #TempTable
WHERE LEN(LastName) = 7

--Find all teachers whose FirstName length is less than 5 and the first 3 characters of their FirstName and LastName are the same
SELECT FirstName,LastName
FROM DBO.Teacher
WHERE SUBSTRING(FirstName,1,3) = SUBSTRING(LastName,1,3) and LEN(FirstName) < 5


 