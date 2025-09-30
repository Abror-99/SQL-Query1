
CREATE DATABASE University;
USE University;

CREATE TABLE Students (
    student_id INT PRIMARY KEY IDENTITY(1,1),
    first_name NVARCHAR(50) NOT NULL,
    last_name NVARCHAR(50) NOT NULL,
    age INT CHECK (age > 0 AND age < 120),
    email NVARCHAR(100) UNIQUE,
    phone NVARCHAR(20)
);

 


INSERT INTO Students ( first_name, last_name, age, email, phone)
VALUES 
    ('Akmal', 'Karimov', 20, 'akmal.karimov@email.com', '+998901234567'),
    ('Dilnoza', 'Abdullayeva', 19, 'dilnoza.abdullayeva@email.com', '+998901234568'),
    ('Bobur', 'Saidov', 21, 'bobur.saidov@email.com', '+998901234569'),
    ('Malika', 'Tosheva', 18, 'malika.tosheva@email.com', '+998901234570'),
    ('Javohir', 'Rahmonov', 22, 'javohir.rahmonov@email.com', '+998901234571'),
    ('Kamila', 'Nazarova', 20, 'kamila.nazarova@email.com', '+998901234572'),
    ('Sardor', 'Umarov', 19, 'sardor.umarov@email.com', '+998901234573'),
    ('Nigora', 'Mirzayeva', 21, 'nigora.mirzayeva@email.com', '+998901234574'),
    ('Aziz', 'Hasanov', 20, 'aziz.hasanov@email.com', '+998901234575'),
    ('Gulnoza', 'Yusupova', 18, 'gulnoza.yusupova@email.com', '+998901234576');

	select* from Students

	SELECT 
    first_name 
    age 
FROM Students
WHERE age > 20 

UPDATE Students 
SET phone = '+998901111111'
WHERE first_name = 'Dilnoza' AND last_name = 'Abdullayeva';

 

 DELETE FROM Students 
WHERE first_name = 'Sardor' AND last_name = 'Umarov';
 select* from Students


 CREATE TABLE Courses (
    course_id INT PRIMARY KEY IDENTITY(1,1),
    course_name NVARCHAR(100),
    course_code NVARCHAR(10) 
);

INSERT INTO Courses (course_name, course_code)
VALUES 
    ('Dasturlash asoslari', 'CS101'),
    ('Matematik analiz', 'MATH201'),
    ('Fizika I', 'PHYS101'),
    ('Umumiy kimyo', 'CHEM101'),
    ('Ingliz tili', 'ENG101'),
    ('Ma''lumotlar bazasi','CS301'),
    ('Statistika', 'MATH301');


CREATE TABLE StudentCourses (
    student_course_id INT PRIMARY KEY IDENTITY(1,1),
    student_id INT,
    course_id INT,
    CONSTRAINT FK_Student FOREIGN KEY (student_id) REFERENCES Students(student_id),
    CONSTRAINT FK_Course FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO StudentCourses (student_id, course_id)
VALUES
    (1, 1), 
    (1, 2), 
    (2, 1), 
    (3, 3), 
    (4, 5), 
    (5, 1), 
    (5, 6), 
    (6, 7);

	SELECT 
    s.first_name,
    s.last_name,
    c.course_name,
    c.course_code
FROM 
    StudentCourses sc
INNER JOIN 
    Students s ON sc.student_id = s.student_id
INNER JOIN 
    Courses c ON sc.course_id = c.course_id
ORDER BY 
    s.last_name, c.course_name;


