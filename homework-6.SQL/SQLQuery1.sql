--Create new procedure called CreateGrade
-- Procedure should create only Grade header info (not Grade Details)
-- Procedure should return the total number of grades in the system for the Student on input (from the CreateGrade)
-- Procedure should return second resultset with the MAX Grade of all grades for the Student and Teacher on input (regardless the Course)

GO
ALTER PROCEDURE dbo.CreateGrade (@StudentID INT,@CourseID INT ,@TeacherID INT ,@Grade TINYINT,@Comment NVARCHAR(MAX) ,@CreatedDate DATETIME)
AS
BEGIN
INSERT INTO dbo.Grade(StudentID,CourseID,TeacherID,Grade,Comment,CreatedDate)
VALUES (@StudentID,@CourseID,@TeacherID,@Grade,@Comment,@CreatedDate)

SELECT COUNT(*) AS TotalGrades
FROM dbo.Grade 
WHERE StudentID = @StudentID

SELECT MAX(Grade) AS MaxGrade
FROM dbo.Grade
WHERE StudentID = @StudentID AND TeacherID = @TeacherID

END

EXEC dbo.CreateGrade 
@StudentID = 15,
@CourseID = 13,
@TeacherID = 13,
@Grade = 8,
@Comment = 'Vreden',
@CreatedDate = '2005-03-01'


select *
from dbo.Grade
order by ID desc



--Create new procedure called CreateGradeDetail
-- Procedure should add details for specific Grade (new record for new AchievementTypeID,
--Points, MaxPoints, Date for specific Grade)
--Output from this procedure should be resultset with SUM of GradePoints calculated with
--formula AchievementPoints/AchievementMaxPoints*ParticipationRate for specific Grade
go
ALTER PROCEDURE dbo.CreateGradeDetail(@GradeID INT,@AchievementTypeID INT, @Points SMALLINT, @MaxPoints SMALLINT,@DATE DATE)
AS
BEGIN
	INSERT INTO dbo.GradeDetails(GradeID,AchievementTypeID,AchievementPoints,AchievementMaxPoints,AchievementDate)
	VALUES(@GradeID,@AchievementTypeID,@Points,@MaxPoints,@DATE)
	
	SELECT SUM(AchievementPoints / AchievementMaxPoints* ParticipationRate)
	FROM dbo.GradeDetails G
	INNER JOIN DBO.AchievementType A ON A.ID = G.AchievementTypeID
END

EXEC dbo.CreateGradeDetail 
@GradeID =10,
@AchievementTypeID = 2,
@Points =71 ,
@MaxPoints = 100,
@DATE = '1999-06-25'

select *
from dbo.GradeDetails
order by ID desc

