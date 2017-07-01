--新建Myschool数据库
use master
go
IF EXISTS(SELECT * FROM sysdatabases WHERE name = 'Myschool')
DROP database Myschool
GO
CREATE DATABASE Myschool
ON
(
NAME = 'Myschool_data',
FILENAME = 'D:\SQL server\Unit2\Myschool.mdf',
SIZE = 5MB,
FILEGROWTH = 15%
)
LOG ON
(
NAME = 'Myschool_log',
FILENAME = 'D:\SQL server\Unit2\Myschool.ldf',
SIZE = 5MB,
FILEGROWTH = 15%
)

--新建表格

USE Myschool 
GO
--创建Grade表
IF EXISTS(SELECT * FROM sysobjects WHERE name = 'Grade')
DROP TABLE Grade 
GO
CREATE TABLE Grade
(
	GradeID INT NOT NULL CONSTRAINT PK_GradeId PRIMARY KEY(GradeId),
	GradeName NVARCHAR(9) NOT NULL
)

--新建Student表
IF EXISTS(SELECT * FROM sysobjects WHERE name = 'Student')
DROP TABLE Student 
GO
CREATE TABLE Student
(
StudentNO int IDENTITY(1,1) NOT NULL CONSTRAINT PK_StudentNo PRIMARY KEY(StudentNo),
LoginPwd nvarchar(50) NOT NULL CONSTRAINT CK_LoginPwd CHECK(LEN(LoginPwd)>=6),
StudentName nvarchar(50) NOT NULL,
Sex char(2) NOT NULL,
GradeId int NOT NULL,
Phone nvarchar(255),
Address nvarchar(255) CONSTRAINT DF_Address DEFAULT('地址不详'),
BornDate datetime NOT NULL CONSTRAINT CK_BornDate CHECK(BornDate>1980-1-1),
Email nvarchar(50) ,
IdentityCard varchar(18)
)



--新建Subject表
IF EXISTS(SELECT * FROM sysobjects WHERE name = 'Subject')
DROP TABLE Subject 
GO

CREATE TABLE Subject
(
SubjectNo int NOT NULL CONSTRAINT PK_SubjectNo PRIMARY KEY(SubjectNo),
SubjectName nvarchar(255) NOT NULL CONSTRAINT CK_SubjectName CHECK(SubjectName IS NOT NULL),
ClassHour int CONSTRAINT CK_ClassHour CHECK(ClassHour>=0),
GradeId int, 
)

--新建Result表
IF EXISTS(SELECT * FROM sysobjects WHERE name = 'Result')
DROP TABLE Result 
GO

CREATE TABLE Result
(
StudentNo int NOT NULL,
SubjectNO int NOT NULL,
ExamDate datetime NOT NULL,
StudentResult int NOT NULL,
)

--插入数据
INSERT INTO Student(LoginPwd ,StudentName ,Sex ,GradeId ,Phone ,BornDate )
VALUES('123456','张三','男','3','15755111353','1994-08-05')
INSERT INTO Student(LoginPwd ,StudentName ,Sex ,GradeId ,Phone ,BornDate )
VALUES('123456','张三','男','3','15755111353','1994-08-05')

INSERT INTO Grade (GradeID ,GradeName )
VALUES (3,'S1')
INSERT INTO Grade (GradeID ,GradeName )
VALUES (4,'S2')
INSERT INTO Grade (GradeID ,GradeName )
VALUES (5,'S3')

INSERT INTO Result (StudentNo ,SubjectNO ,ExamDate ,StudentResult)
VALUES ('123321','223','2017-05-12','78')
INSERT INTO Result (StudentNo ,SubjectNO ,ExamDate ,StudentResult)
VALUES ('123323','223','2017-05-12','82')
INSERT INTO Result (StudentNo ,SubjectNO ,ExamDate ,StudentResult)
VALUES ('123326','223','2017-05-12','98')

INSERT INTO Subject (SubjectNo ,SubjectName ,ClassHour ,GradeId )
VALUES('1233','C#','20','1')