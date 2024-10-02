CREATE TABLE Teachers (
    teacher_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20)
);

CREATE TABLE Students (
    student_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(100) NOT NULL,
    teacher_id INTEGER UNIQUE, -- One-to-One relationship with Teachers
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
);

CREATE TABLE Courses (
    course_id INTEGER PRIMARY KEY AUTOINCREMENT,
    course_name VARCHAR(100) NOT NULL,
    course_description TEXT,
    teacher_id INTEGER, -- One-to-Many relationship with Teachers
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
);

CREATE TABLE Enrollments (
    enrollment_id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER, -- Many-to-One relationship with Students
    course_id INTEGER,  -- Many-to-One relationship with Courses
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Table for Classes
CREATE TABLE Classes (
    class_id INTEGER PRIMARY KEY AUTOINCREMENT,
    course_id INTEGER, -- Many-to-One relationship with Courses
    class_time TIME NOT NULL,
    class_location VARCHAR(100) NOT NULL,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Teachers (first_name, last_name, email, phone) VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890'),
('Jane', 'Smith', 'jane.smith@example.com', '987-654-3210'),
('Mark', 'Taylor', 'mark.taylor@example.com', '555-123-4567'),
('Emma', 'Jones', 'emma.jones@example.com', '444-789-1234'),
('David', 'Brown', 'david.brown@example.com', '333-654-9870');

-- Insert sample data into Students table
INSERT INTO Students (first_name, last_name, date_of_birth, email, teacher_id) VALUES
('Michael', 'Scott', '1995-06-25', 'michael.scott@example.com', 1),
('Pam', 'Beesly', '1996-09-15', 'pam.beesly@example.com', 2),
('Jim', 'Halpert', '1995-03-12', 'jim.halpert@example.com', 3),
('Dwight', 'Schrute', '1994-12-11', 'dwight.schrute@example.com', 4),
('Ryan', 'Howard', '1997-02-27', 'ryan.howard@example.com', 5);

-- Insert sample data into Courses table
INSERT INTO Courses (course_name, course_description, teacher_id) VALUES
('Math 101', 'Introduction to Basic Algebra and Geometry', 1),
('Science 101', 'Basic Principles of Physics and Chemistry', 2),
('History 101', 'Overview of World History', 3),
('English 101', 'Fundamentals of English Literature', 4),
('Art 101', 'Introduction to Visual Arts and Design', 5);

-- Insert sample data into Enrollments table
INSERT INTO Enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2023-01-10'),
(2, 2, '2023-01-12'),
(3, 3, '2023-01-14'),
(4, 4, '2023-01-16'),
(5, 5, '2023-01-18');

-- Insert sample data into Classes table
INSERT INTO Classes (course_id, class_time, class_location) VALUES
(1, '09:00:00', 'Room 101'),
(2, '10:00:00', 'Room 102'),
(3, '11:00:00', 'Room 103'),
(4, '12:00:00', 'Room 104'),
(5, '13:00:00', 'Room 105');
