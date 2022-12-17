-- INSERT INTO professor (ssn, name, street, city, state, zipcode, area_code, phone, sex, title, salary, degrees)
-- VALUES
-- ('123456789', 'Jane Doe', '123 Main St', 'New York', 'NY', '10001', '212', '1234567', 'F', 'Professor of Biology', 60000, 'Ph.D. in Biology'),
-- ('234567890', 'John Smith', '456 Park Ave', 'Boston', 'MA', '02111', '617', '9876543', 'M', 'Professor of Mathematics', 65000, 'Ph.D. in Mathematics'),
-- ('345678901', 'Samantha Jones', '789 Ocean Dr', 'Miami', 'FL', '33101', '305', '1236547', 'F', 'Professor of Computer Science', 75000, 'Ph.D. in Computer Science')

-- CREATE TABLE student (
--     cwid INT PRIMARY KEY,
--     first_name VARCHAR(255) NOT NULL,
--     last_name VARCHAR(255) NOT NULL,
--     street VARCHAR(255) NOT NULL,
--     city VARCHAR(255) NOT NULL,
--     state VARCHAR(255) NOT NULL,
--     zipcode VARCHAR(10) NOT NULL,
--     area_code VARCHAR(3) NOT NULL,
--     phone VARCHAR(8) NOT NULL,
--     major VARCHAR(255) NOT NULL,
--     minor VARCHAR(255)
-- );

-- INSERT INTO student (cwid, first_name, last_name, street, city, state, zipcode, area_code, phone, major, minor)
-- VALUES
-- (123456789, 'Sue', 'Silly', '999 Elm St', 'Miami', 'FL', '33101', '305', '9876543', 'Mathematics', 'Computer Science'),
-- (234567890, 'George', 'Goofy', '777 Oak Ave', 'Boston', 'MA', '02111', '617', '1236547', 'Biology', 'Chemistry'),
-- (345678901, 'Beth', 'Bubbles', '555 Maple St', 'New York', 'NY', '10001', '212', '4567890', 'Computer Science', 'Mathematics'),
-- (456789012, 'Pete', 'Peanut', '333 Cedar Ave', 'Seattle', 'WA', '98101', '206', '5678901', 'Physics', 'Mathematics'),
-- (567890123, 'Carol', 'Crazy', '111 Pine St', 'San Francisco', 'CA', '94102', '415', '1234567', 'Chemistry', 'Biology'),
-- (678901234, 'Frank', 'Fuzzy', '222 Willow Ave', 'Los Angeles', 'CA', '90210', '310', '2345678', 'Mathematics', 'Computer Science'),
-- (789012345, 'Tina', 'Tippy', '444 Birch St', 'Chicago', 'IL', '60601', '312', '3456789', 'Biology', 'Chemistry'),
-- (890123456, 'Karen', 'Kooky', '111 Cedar Ave', 'New Orleans', 'LA', '70112', '504', '4567891', 'Computer Science', 'Mathematics');

-- CREATE TABLE department (
--     number INT PRIMARY KEY,
--     name VARCHAR(255) NOT NULL,
--     telephone VARCHAR(8) NOT NULL,
--     location VARCHAR(255) NOT NULL,
--     chairperson VARCHAR(255) NOT NULL,
--     FOREIGN KEY (chairperson) REFERENCES professor(ssn)
-- );

-- INSERT INTO department (number, name, telephone, location, chairperson)
-- VALUES
-- (1, 'Mathematics', '12345678', 'MATH-101', '123456789'),
-- (2, 'Computer Science', '23456789', 'CS-202', '345678901')

-- CREATE TABLE degree (
--     professor VARCHAR(255) NOT NULL,
--     degree VARCHAR(255) NOT NULL,
--     FOREIGN KEY (professor) REFERENCES professor(ssn)
-- );

-- INSERT INTO degree (professor, degree)
-- VALUES
-- ('123456789', 'Ph.D. in Biology'),
-- ('234567890', 'Ph.D. in Mathematics'),
-- ('345678901', 'Ph.D. in Computer Science'),
-- ('345678901', 'B.A. in Cinema');

-- ALTER TABLE professor
-- DROP COLUMN degrees;

-- CREATE TABLE minor (
--     cwid INT NOT NULL,
--     department INT NOT NULL,
--     FOREIGN KEY (cwid) REFERENCES student(cwid),
--     FOREIGN KEY (department) REFERENCES department(number)
-- );

-- INSERT INTO minor (cwid, department)
-- VALUES
-- (123456789, 1),
-- (234567890, 2),
-- (345678901, 1),
-- (456789012, 2),
-- (567890123, 1);


-- CREATE TABLE course (
--     number INT PRIMARY KEY,
--     title VARCHAR(255) NOT NULL,
--     textbook VARCHAR(255),
--     units INT NOT NULL CHECK (units BETWEEN 1 AND 4),
--     department_number INT NOT NULL,
--     FOREIGN KEY (department_number) REFERENCES department(number)
-- );

-- INSERT INTO course (number, title, textbook, units, department_number)
-- VALUES
-- (1, 'Calculus I', 'Calculus I Ed. 4', 3, 1),
-- (2, 'Calculus II', 'Calculus II Ed. 6', 3, 1),
-- (3, 'Calculus III', 'Calculus III Ed. 3', 3, 1),
-- (4, 'Linear Algebra', 'Linear Algebra Ed. 9', 3, 1),
-- (5, 'Discrete Mathematics', 'Discrete Mathematics Ed. 4', 3, 1),
-- (6, 'Introduction to Computer Science', 'Introduction to Computer Science Ed. 2', 3, 2),
-- (7, 'Data Structures', 'Data Structures Ed. 4', 3, 2),
-- (8, 'Algorithms', 'Algorithms Ed. 5', 3, 2),
-- (9, 'Operating Systems', 'Operating Systems Ed. 1', 3, 2),
-- (10, 'Computer Architecture', 'Computer Architecture Ed. 8', 3, 2);

-- CREATE TABLE section (
--     course_number INT NOT NULL,
--     section_number INT NOT NULL,
--     classroom VARCHAR(255) NOT NULL,
--     seats INT NOT NULL CHECK (seats > 0),
--     meeting_days VARCHAR(255) NOT NULL,
--     begin_time TIME NOT NULL,
--     end_time TIME NOT NULL CHECK (end_time > begin_time),
--     professor VARCHAR(255) NOT NULL,
--     FOREIGN KEY (course_number) REFERENCES course(number),
--     FOREIGN KEY (professor) REFERENCES professor(ssn),
--     PRIMARY KEY (course_number, section_number)
-- );

-- INSERT INTO section (course_number, section_number, classroom, seats, meeting_days, begin_time, end_time, professor)
-- VALUES
-- (1, 1001, 'MATH-105', 30, 'MW', '09:00:00', '09:50:00', '123456789'),
-- (1, 1002, 'MATH-105', 40, 'TH', '10:00:00', '10:50:00', '123456789'),
-- (1, 1003, 'CS-205', 25, 'MW', '11:00:00', '11:50:00', '123456789'),
-- (2, 1001, 'CS-208', 30, 'MW', '09:00:00', '09:50:00', '234567890'),
-- (2, 1002, 'CS-406', 30, 'MWF', '10:00:00', '10:50:00', '345678901'),
-- (2, 1003, 'CS-104', 65, 'TH', '10:00:00', '10:50:00', '234567890'),
-- (3, 1001, 'CS-104', 30, 'MW', '10:00:00', '10:50:00', '234567890'),
-- (3, 1002, 'MGT-309', 40, 'TH', '10:00:00', '10:50:00', '234567890'),
-- (3, 1003, 'FIN-409', 25, 'MWF', '10:00:00', '10:50:00', '234567890'),
-- (4, 1001, 'MGT-309', 30, 'TH', '10:00:00', '10:50:00', '345678901'),
-- (4, 1002, 'BIOL-201', 30, 'TH', '10:00:00', '10:50:00', '234567890'),
-- (4, 1003, 'FIN-409', 65, 'MWF', '10:00:00', '10:50:00', '234567890'),
-- (5, 1001, 'CS-104', 30, 'TH', '10:00:00', '10:50:00', '345678901'),
-- (5, 1002, 'MGT-309', 40, 'MW', '10:00:00', '10:50:00', '234567890'),
-- (5, 1003, 'BIOL-201', 30, 'MWF', '10:00:00', '10:50:00', '234567890'),
-- (6, 1001, 'FIN-409', 25, 'TH', '10:00:00', '10:50:00', '234567890'),
-- (6, 1002, 'CS-104', 30, 'TH', '10:00:00', '10:50:00', '234567890'),
-- (6, 1003, 'MGT-309', 30, 'MW', '10:00:00', '10:50:00', '234567890'),
-- (7, 1001, 'CS-104', 65, 'MWF', '10:00:00', '10:50:00', '345678901'),
-- (7, 1002, 'CS-104', 30, 'TH', '10:00:00', '10:50:00', '234567890'),
-- (7, 1003, 'CS-104', 40, 'MW', '10:00:00', '10:50:00', '345678901'),
-- (8, 1001, 'MGT-309', 30, 'TH', '10:00:00', '10:50:00', '234567890'),
-- (8, 1002, 'CS-104', 65, 'TH', '10:00:00', '10:50:00', '234567890'),
-- (8, 1003, 'FIN-409', 30, 'MWF', '10:00:00', '10:50:00', '234567890'),
-- (9, 1001, 'CS-104', 25, 'TH', '10:00:00', '10:50:00', '234567890'),
-- (9, 1002, 'MGT-309', 40, 'MW', '10:00:00', '10:50:00', '234567890'),
-- (9, 1003, 'CS-104', 30, 'TH', '10:00:00', '10:50:00', '345678901'),
-- (10, 1001, 'CS-104', 25, 'MWF', '10:00:00', '10:50:00', '234567890'),
-- (10, 1002, 'MGT-309', 65, 'MW', '10:00:00', '10:50:00', '234567890'),
-- (10, 1003, 'BIOL-201', 30, 'TH', '10:00:00', '10:50:00', '345678901');

-- CREATE TABLE prerequisite (
--     course_number INT NOT NULL,
--     prerequisite_number INT NOT NULL,
--     FOREIGN KEY (course_number) REFERENCES course(number),
--     FOREIGN KEY (prerequisite_number) REFERENCES course(number),
--     PRIMARY KEY (course_number, prerequisite_number)
-- );

-- INSERT INTO prerequisite (course_number, prerequisite_number)
-- VALUES
-- (2, 1),
-- (3, 2),
-- (4, 3),
-- (7, 6);

-- CREATE TABLE enrollment (
--     student_cwid INT NOT NULL,
--     course_number INT NOT NULL,
--     section_number INT NOT NULL,
--     grade VARCHAR(2),
--     FOREIGN KEY (student_cwid) REFERENCES student(cwid),
--     FOREIGN KEY (course_number, section_number) REFERENCES section(course_number, section_number),
--     PRIMARY KEY (student_cwid, course_number, section_number)
-- );

INSERT INTO enrollment (student_cwid, course_number, section_number, grade)
VALUES
(123456789, 1, 1001, 'A+'),
(123456789, 10, 1001, 'B'),
(123456789, 3, 1002, 'A'),
(123456789, 5, 1003, 'C'),
(789012345, 6, 1002, 'B'),
(234567890, 1, 1003, 'B+'),
(234567890, 2, 1002, 'A-'),
(234567890, 5, 1001, 'C+'),
(234567890, 7, 1001, 'A'),
(789012345, 2, 1002, 'B-'),
(345678901, 8, 1001, 'C+'),
(345678901, 9, 1002, 'A'),
(345678901, 10, 1003, 'B+'),
(789012345, 9, 1003, 'A'),
(345678901, 4, 1001, 'B'),
(456789012, 7, 1002, 'B+'),
(456789012, 9, 1001, 'A-'),
(456789012, 6, 1003, 'A'),
(456789012, 5, 1002, 'F'),
(456789012, 10, 1003, 'B')
