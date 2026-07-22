/* ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^part 1 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^6*/
USE trainingCenterDB;
GO


CREATE TABLE instructors(
	instructorID INT PRIMARY KEY IDENTITY(1,1),
	instructorName VARCHAR(100) NOT NULL
);

/* in this table i applied 1NF to store all skills for each instructor without storing more than one value in the same cell i solved the problem by creating a new table and i named it skills and linked it using foreign key referenced to instructors table */
CREATE TABLE skills(
	skillID INT PRIMARY KEY IDENTITY(1,1),
	skillName VARCHAR(50) NOT NULL UNIQUE, /* unique so every skill has to be unique (no redunduncy)*/
	instructorID INT,
	FOREIGN KEY (instructorID) REFERENCES instructors(instructorID)
);

/* the relation between instructors table and courses table is 1-m so i linked them using foreign key referenced to instructors table */
CREATE TABLE courses(
	courseID INT PRIMARY KEY IDENTITY(1,1),
	courseName VARCHAR(100) NOT NULL UNIQUE,
	instructorID INT ,
	FOREIGN KEY (instructorID) REFERENCES instructors(instructorID)
);

CREATE TABLE city(
	cityID INT PRIMARY KEY IDENTITY(1,1),
	cityName VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE students(
	studentID INT PRIMARY KEY IDENTITY(1,1),
	studentName VARCHAR(100) NOT NULL,
	cityID INT,
	FOREIGN KEY (cityID) REFERENCES city(cityID)
);

/* the relation between students table and courses table is many to many so i created a new table to link them together in organized way and to avoid data redunduncy */
CREATE TABLE enrollment(
	enrollmentID INT PRIMARY KEY IDENTITY(1,1),
	courseID INT,
	studentID INT,
	enrollmentDate DATETIME NOT NULL,
	finalGrade DECIMAL(5,1) NOT NULL,
	courseCompletionStatus VARCHAR(15) CHECK (courseCompletionStatus IN ('Completed', 'In Progress', 'Dropped')),
	FOREIGN KEY (courseID) REFERENCES courses(courseID),
	FOREIGN KEY (studentID) REFERENCES students(studentID)
);

/* ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^part 2 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^6*/
INSERT INTO instructors (instructorName) VALUES 
('Rami Al-Ahmad'),
('Huda Salem'),
('Omar Khaled'),
('Tariq Ziad'),
('Muna Ali'),
('Faisal Hassan'),
('Reem Saeed'),
('Amer Majali');

INSERT INTO skills (skillName, instructorID) VALUES 
('SQL', 1),
('React.js', 2),
('Data Analysis', 3),
('UI/UX Figma Design', 4),
('Cyber Security', 5),
('DevOps', 6),
('Machine Learning', 7),
('ASP.NET Core', 8);

INSERT INTO courses (courseName, instructorID) VALUES 
('Database Systems & SQL', 1),
('Frontend Web Dev', 2),
('Data Science Fundamentals', 3),
('UI/UX Product Design', 4),
('Ethical Hacking', 5),
('Cloud Computing', 6),
('AI & Machine Learning', 7),
('Backend C# Mastery', 8);

INSERT INTO city (cityName) VALUES 
('Amman'),
('Zarqa'),
('Irbid'),
('Aqaba'),
('Salt'),
('Mafraq'),
('Jerash'),
('Madaba');

INSERT INTO students (studentName, cityID) VALUES 
('Ahmad Yaseen', 1),
('Sarah Mahmoud', 2),
('Ali Al-Omari', 3),
('Lina Hamdan', 1),
('Kareem Nabil', 4),
('Zainab Mustafa', 5),
('Youssef Bader', 6),
('Nour Al-Huda', 7);

INSERT INTO enrollment (courseID, studentID, enrollmentDate, finalGrade, courseCompletionStatus) VALUES 
(1, 1, '2026-01-10 09:00:00', 88.5, 'Completed'),
(1, 2, '2026-01-15 10:30:00', 75.0, 'Completed'),
(2, 3, '2026-02-01 11:00:00', 92.0, 'Completed'),
(3, 4, '2026-02-10 14:00:00', 65.5, 'In Progress'),
(4, 5, '2026-03-01 08:30:00', 84.0, 'Completed'),
(5, 6, '2026-03-05 13:15:00', 45.0, 'Dropped'),
(6, 7, '2026-04-12 15:45:00', 78.5, 'In Progress'),
(7, 8, '2026-05-01 10:00:00', 95.0, 'Completed');
GO


/* ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^part 3 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^6*/

SELECT * FROM students;
SELECT * FROM instructors;
SELECT * FROM courses;

SELECT * FROM enrollment WHERE courseCompletionStatus='Completed';