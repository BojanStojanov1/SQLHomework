SELECT * FROM Student

--Find all Students with FirstName = Antonio
SELECT * FROM Student 
Where FirstName = 'Antonio'
GO

--Find all Students with DateOfBirth greater than ‘01.01.1999’
SELECT * FROM Student
WHERE DateOfBirth = '1999.01.01'
GO

--Find all Students with LastName starting With ‘J’ enrolled in January/1998

SELECT * FROM Student
WHERE LastName like 'J%' AND EnrolledDate >= '1998.01.01' AND EnrolledDate <= '1998.01.31'
GO

--List all Students ordered by FirstName
SELECT * FROM Student
ORDER BY FirstName ASC
GO

--List all Teacher Last Names and Student Last Names in single result set.
--Remove duplicates
SELECT * FROM Student
SELECT * FROM Teacher

SELECT LastName FROM Teacher
UNION
SELECT LastName FROM Student
GO

--Create Foreign key constraints from diagram or with script

ALTER TABLE [dbo].[AchievementType] ADD CONSTRAINT [FK_Name] FOREIGN KEY ([Name]) REFERENCES [dbo].[Student]([FirstName]);
ALTER TABLE [dbo].[GradeDetails] ADD CONSTRAINT [FK_Grade] FOREIGN KEY ([TeacherID]) REFERENCES [dbo].[Teacher]([ID]);
GO
--List all possible combinations of Courses names and AchievementType names that can be passed by student
select * from Course
select * from AchievementType

SELECT c.Name as CourseName, a.Name as AchievementTypeName
from Course c
cross join AchievementType a


--List all Teachers without exam Grade
SELECT * FROM Teacher
SELECT * FROM Grade

SELECT t.FirstName
FROM Teacher t
LEFT JOIN Grade g ON t.ID = g.TeacherID
WHERE g.Grade IS NULL;

/*
Find all Students with FirstName = Antonio
Find all Students with DateOfBirth greater than ‘01.01.1999’
Find all Male students
Find all Students with LastName starting With ‘T’
Find all Students Enrolled in January/1998
Find all Students with LastName starting With ‘J’ enrolled in January/1998
*/

SELECT * FROM Student
WHERE FirstName = 'Antonio'
GO

SELECT * FROM Student
WHERE DateOfBirth > '1999.01.01'
GO

SELECT * FROM Student
WHERE Gender = 'M'
GO

SELECT * FROM Student
WHERE LastName like 'T%'
GO

SELECT * FROM Student
WHERE EnrolledDate >= '1998.01.01' AND EnrolledDate <= '1998.01.31'
GO

SELECT * FROM Student
WHERE LastName like 'J%' AND EnrolledDate >= '1998.01.01' AND EnrolledDate <= '1998.01.31'
GO

/*
Find all Students with FirstName = Antonio ordered by Last Name
List all Students ordered by FirstName
Find all Male students ordered by EnrolledDate, starting from the last enrolled
*/

SELECT * FROM Student
WHERE FirstName = 'Antonio'
ORDER BY LastName 
GO

SELECT * FROM Student
ORDER BY FirstName
GO
 
SELECT * FROM Student
WHERE Gender = 'M'
ORDER BY EnrolledDate DESC
GO

/*
List all Teacher First Names and Student First Names in single result set with duplicates
List all Teacher Last Names and Student Last Names in single result set. Remove duplicates
List all common First Names for Teachers and Students
*/

SELECT FirstName FROM Teacher
UNION ALL 
SELECT FirstName FROM Student
GO

SELECT LastName FROM Teacher
UNION
SELECT LastName FROM Student
GO

SELECT FirstName FROM Teacher
INTERSECT
SELECT FirstName FROM Student
GO

/*
Change GradeDetails table always to insert value 100 in AchievementMaxPoints column if no value is provided on insert
Change GradeDetails table to prevent inserting AchievementPoints that will more than AchievementMaxPoints
Change AchievementType table to guarantee unique names across the Achievement types
*/

ALTER TABLE GradeDetails
ADD CONSTRAINT DF_GradeDetails_AchievementMaxPoints
DEFAULT 100 FOR AchievementMaxPoints;
GO

ALTER TABLE GradeDetails
ADD CONSTRAINT CHK_AchievementPoints_Limit
CHECK (AchievementPoints <= AchievementMaxPoints);
GO

ALTER TABLE AchievementType
ADD CONSTRAINT UQ_AchievementType_Name
UNIQUE (Name);
GO

/*
List all possible combinations of Courses names and AchievementType names that can be passed by student
List all Teachers that has any exam Grade
List all Teachers without exam Grade
List all Students without exam Grade (using Right Join)
*/
SELECT * FROM Course
SELECT * FROM AchievementType
SELECT c.Name, a.Name AS AchievementTypeName
FROM Course c
CROSS JOIN AchievementType a;
GO

SELECT * FROM Teacher
SELECT * FROM Grade
SELECT DISTINCT t.FirstName  
FROM Teacher t
JOIN Grade g ON t.ID = g.TeacherID;

SELECT t.FirstName
FROM Teacher t
LEFT JOIN Grade g ON t.ID = g.TeacherID
WHERE g.Grade IS NULL;

SELECT * FROM Student
SELECT g.Grade
FROM Grade g
RIGHT JOIN Student s ON g.StudentID = s.ID
WHERE g.Grade IS NULL;




