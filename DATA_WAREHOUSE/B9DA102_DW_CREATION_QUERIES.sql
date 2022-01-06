--CREATE DATABASE B9DA102_UNIVERSITY_DW

USE [B9DA102_UNIVERSITY_DW]

CREATE TABLE Student_Dim (
	student_key INT NOT NULL IDENTITY,
	student_id INT,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	gender VARCHAR(50),
	PRIMARY KEY (student_key),
);

GO


CREATE TABLE Course_Dim (
	course_key INT NOT NULL IDENTITY,
	course_id VARCHAR (6),
	course_name VARCHAR(61),
	cost DECIMAL(6,1),
	PRIMARY KEY (course_key),
);

GO


CREATE TABLE Department_Dim (
	department_key INT NOT NULL IDENTITY,
	department_id INT,
	department_name VARCHAR(100),
	PRIMARY KEY (department_key),
);

GO


CREATE TABLE Module_Dim (
	module_key INT NOT NULL IDENTITY,
	module_id VARCHAR (5),
	module_name VARCHAR(79),
	PRIMARY KEY (module_key),
);

GO


CREATE TABLE Enrollment_Dim (
	enrollment_key INT NOT NULL IDENTITY,
	enrollment_id INT,
	enrollment_status VARCHAR(9),
	PRIMARY KEY (enrollment_key),
);

GO

CREATE TABLE Grade_Dim (
	grade_key INT NOT NULL IDENTITY,
	grade_id INT,
	score INT,
	grade CHAR (1),
	PRIMARY KEY (grade_key),
);

GO


CREATE TABLE Date_Dim (
	date_key INT NOT NULL IDENTITY,
	full_date DATE,
	day_of_week CHAR (15),
	day_type CHAR (20),
	day_of_month INT,
	Month_ CHAR (10),
	Quarter_ CHAR (2),
	Year_ INT,
	PRIMARY KEY (date_key),
);

GO



CREATE TABLE Grade_Fact (
	student_key INT,
	module_key INT,
	grade_key INT,
	course_key INT,
	grade INT,
	PRIMARY KEY (grade_key),
	FOREIGN KEY (student_key) REFERENCES Student_Dim (student_key),
	FOREIGN KEY (module_key) REFERENCES Module_Dim (module_key),
	FOREIGN KEY (grade_key) REFERENCES Grade_Dim (grade_key),
	FOREIGN KEY (course_key) REFERENCES Course_Dim (course_key),
);

GO


CREATE TABLE Revenue_Fact (
	date_key INT,
	student_key INT,
	course_key INT,
	department_key INT,
	enrollment_key INT,
	amount DECIMAL (6, 1),
	PRIMARY KEY (enrollment_key),
	FOREIGN KEY (date_key) REFERENCES Date_Dim (date_key),
	FOREIGN KEY (student_key) REFERENCES Student_Dim (student_key),
	FOREIGN KEY (department_key) REFERENCES Department_Dim (department_key),
	FOREIGN KEY (enrollment_key) REFERENCES Enrollment_Dim (enrollment_key),
	FOREIGN KEY (course_key) REFERENCES Course_Dim (course_key),
);
GO