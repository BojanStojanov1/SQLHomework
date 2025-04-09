--Calculate the count of all grades per Teacher in the system
SELECT * FROM Teacher
SELECT * FROM Grade

SELECT t.FirstName, SUM(Grade) as TotalSumOfGradesPerTeacher
FROM dbo.Grade g 
JOIN dbo.Teacher t on g.TeacherID = t.ID
GROUP BY t.FirstName
GO

--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)

SELECT t.FirstName, SUM(Grade) as GradesPerTeacher
FROM dbo.Grade g 
JOIN dbo.Teacher t on g.TeacherID = t.ID
WHERE StudentID < 100
GROUP BY t.FirstName
GO

--Find the Maximal Grade, and the Average Grade per Student on all grades in the system

SELECT * FROM Student

SELECT s.FirstName, MAX(Grade) as MaximalGrade, AVG(Grade) as AverageGrade
FROM dbo.Grade g 
JOIN dbo.Student s on s.ID = g.StudentID
GROUP BY s.FirstName
GO 

--Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200

SELECT t.FirstName as TeachersName, SUM(Grade) as SumOfAllTheGrades 
FROM Grade g 
JOIN dbo.Teacher t on g.TeacherID = t.ID
GROUP BY t.FirstName
HAVING SUM(Grade) > 200
GO

--Find the Grade Count, Maximal Grade, and the Average Grade per Student on
--all grades in the system. Filter only records where Maximal Grade is equal to
--Average Grade

SELECT s.FirstName as StudentsName, SUM (Grade) as GradeCountPerStudent, MAX(Grade) as MaximalGradePerStudent, AVG(Grade) as AverageGradePerStudent
FROM Grade g 
JOIN dbo.Student s on s.ID = g.StudentID
GROUP BY s.FirstName
HAVING MAX(Grade) = AVG(Grade)
GO

--List Student First Name and Last Name next to the other details from previous query

SELECT 
  s.FirstName + N' ' + s.LastName AS StudentFullName, 
  SUM(Grade) AS GradeCount, 
  MAX(Grade) AS MaximalGrade, 
  AVG(Grade) AS AverageGrade
FROM dbo.Grade g 
JOIN dbo.Student s ON s.ID = g.StudentID
GROUP BY s.FirstName, s.LastName
GO

--Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student
DROP VIEW IF EXISTS vv_StudentsGrades
GO
CREATE VIEW vv_StudentsGrades
AS 
SELECT s.ID, SUM(Grade) as SumOfGrades
FROM dbo.Grade g
INNER JOIN dbo.Student s on g.StudentID = s.ID
GROUP BY s.ID
GO

SELECT * FROM vv_StudentsGrades

--Change the view to show Student First and Last Names instead of StudentID

ALTER VIEW vv_StudentsGrades
AS
SELECT s.FirstName + ' ' + s.LastName as StudentsFullName, SUM(Grade) as SumOfGrades
FROM dbo.Grade g
INNER JOIN dbo.Student s on g.StudentID = s.ID
GROUP BY s.FirstName, s.LastName
GO

SELECT * FROM vv_StudentsGrades

--List all rows from view ordered by biggest Grade Count

SELECT * FROM vv_StudentsGrades
ORDER BY SumOfGrades DESC
GO
