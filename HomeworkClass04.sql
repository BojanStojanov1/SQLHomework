--Declare scalar variable for storing FirstName values
DECLARE @FirstName NVARCHAR(100)
--Assign value ‘Antonio’ to the FirstName variable
SET @FirstName = 'Antonio'
--Find all Students having FirstName same as the variable
SELECT @FirstName
WHERE @FirstName = 'Antonio'
--Declare table variable that will contain StudentId, StudentName and DateOfBirth
--Fill the table variable with all Female students
DECLARE @FemaleStudentList TABLE (StudentId INT NOT NUll, StudentName NVARCHAR(100) NOT NUll, DateOfBirth DATETIME NOT NULL)

INSERT INTO @FemaleStudentList(StudentId, StudentName, DateOfBirth)
VALUES 
        (1, 'Ana', '1999-04-22'),
        (2, 'Martina', '2000-07-23')
SELECT * FROM @FemaleStudentList
--Declare temp table that will contain LastName and EnrolledDate columns
CREATE TABLE #MaleStudentList(LastName NVARCHAR(100) NOT NULL, EnrolledDate DATETIME)
--Fill the temp table with all Male students having Last Name starting with ‘A'
INSERT INTO #MaleStudentList
VALUES
    ('Angelov', '2024-08-01'),
    ('Aleksov', '2020-03-20')
SELECT * FROM #MaleStudentList

--Retrieve the students from the table which last name is with 7 characters
SELECT * FROM #MaleStudentList
WHERE LEN(LastName) = 7

--Find all teachers whose FirstName length is less than 5 and the first 3 characters of their FirstName and LastName are the same
SELECT * FROM Teacher
WHERE LEN(FirstName)<5 AND LEFT(FirstName, 3) = LEFT(LastName, 3)
GO

--BONUS PART WORKSHOP 01
/*
• Declare scalar variable for storing FirstName values
• Assign value ‘Aleksandar’ to the FirstName variable
• Find all Employees having FirstName same as the variable
• Declare table variable that will contain EmployeeId and DateOfBirth
• Fill the table variable with all Female employees
• Declare temp table that will contain LastName and HireDate
columns
• Fill the temp table with all Male employees having First Name
starting with ‘A’
• Retrieve the employees from the table which last name is with 7
characters
*/

DECLARE @FirstNameValue NVARCHAR(100)
SET @FirstNameValue = 'Aleksandar'
SELECT * FROM dbo.Employee
WHERE FirstName = @FirstNameValue

DECLARE @EmployeeList TABLE (EmployeeId NVARCHAR (100)NOT NULL, DateOfBirth DATETIME)
INSERT INTO @EmployeeList
VALUES
    (1, '1999-01-30'),
    (2,'1995-01-30')


CREATE TABLE #LastNameTable (LastName NVARCHAR(100)NOT NULL, HireDate DATETIME)
INSERT INTO #LastNameTable
VALUES
    ('Anakiev', '2009-03-01'),
    ('Atanasov', '2018-05-13')
SELECT * FROM #LastNameTable
WHERE LEN(LastName)=7
GO

--BONUS HOMEWORK WORKSHOP 02
/*
Declare scalar function (fn_FormatProductName) for retrieving the
Product description for specific ProductId in the following format: Second and Third character from the Code
Last three characters from the Name Product Price
*/

CREATE FUNCTION fn_FormatProductName (@ProductId INT)
RETURNS NVARCHAR(200)
AS
BEGIN
    DECLARE @Result NVARCHAR(200)
    
    SELECT @Result = 
        SUBSTRING(Code, 2, 2) +                          -- 2nd and 3rd character of Code
        RIGHT(Name, 3) +                                 -- Last 3 characters of Name
        CAST(Price AS NVARCHAR)                          -- Convert Price to string
    FROM dbo.Product
    WHERE Id = @ProductId

    RETURN @Result
END
GO
 SELECT dbo.fn_FormatProductName(1)
