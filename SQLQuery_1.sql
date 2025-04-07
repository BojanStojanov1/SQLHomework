CREATE TABLE [Student]
(
    [ID][int]Not NULL,
    [FirstName][nvarchar](100)Not Null,
    [LastName][nvarchar](100)Not Null,
    [DateOfBirth][date]Not NULL,
    [EnrolledDate][date]Not Null,
    [Gender][nchar]Not Null,
    [NacionalIDNumber][int]Not Null,
    [StudentCardNumber][int]Null
)

CREATE TABLE [Teacher]
(
  [ID][int]Not NULL, 
  [FirstName][nvarchar](100)Not Null, 
  [LastName][nvarchar](100)Not Null,
  [DateOfBirth][date]Not NULL,
  [AcademicRank][nvarchar](100)Null,
  [HireDate][date]Not NULL,
)

CREATE TABLE [Grade]
(
    [ID][int]Not NULL,
    [StudentID][int]Not NULL,
    [CourseID][int]Not NULL,
    [TeacherID][int]Not NULL,
    [Grade][int]Not NULL,
    [Comment][nvarchar](100)Null,
    [CreatedDate][date]Null
)

CREATE TABLE [Course]
(
    [ID][int]Not NULL,
    [Name][nvarchar](100)Not NULL,
    [Credit][int]Null,
    [AcademicYear][date]Null,
    [Semestar][int]Null
)

CREATE TABLE [GradeDetails]
(
    [ID][int]Not NULL,
    [GradeID][int]Not NULL,
    [AchievementTypeID][int]Not NULL,
    [AchievementPoints][int]Not NULL,
    [AchievementMaxPoints][int]Not NULL,
    [AchievementDate][date]Not NULL
)

CREATE TABLE [AchievementType]
(
    [ID][int]Not NULL,
    [Name][nvarchar](100)Not NULL,
    [Description][nvarchar](1000)Not NULL,
    [ParticipationRate][int] NULL
)
