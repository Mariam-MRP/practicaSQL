CREATE TABLE Bootcamps (
    bootcamp_id SERIAL PRIMARY KEY,         
    name VARCHAR(200) NOT NULL,   
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    price FLOAT NOT NULL   
);

CREATE TABLE Students (
    student_id SERIAL PRIMARY KEY,         
    name VARCHAR(50) NOT NULL,       
    surname VARCHAR(50) NOT NULL,        
    email VARCHAR(100) NOT NULL UNIQUE, 
    bootcamp_id INT NOT NULL,
    FOREIGN KEY (bootcamp_id  ) REFERENCES Bootcamps (bootcamp_id)        
);

CREATE TABLE Teachers (
    teacher_id SERIAL PRIMARY KEY,         
    name VARCHAR(50) NOT NULL,       
    surname VARCHAR(50) NOT NULL,        
    email VARCHAR(100) NOT NULL UNIQUE, 
    phone VARCHAR(50) NOT NULL       
);

CREATE TABLE Modules (
    module_id SERIAL PRIMARY KEY,         
    name VARCHAR(200) NOT NULL,   
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    teacher_id INT NOT NULL,
    FOREIGN KEY(teacher_id) REFERENCES Teachers(teacher_id) 
);


CREATE TABLE Bootcamp_Modules (
    bootcamp_module_id SERIAL PRIMARY KEY,         
    module_id  INT NOT NULL,
    bootcamp_id INT NOT NULL,
    FOREIGN KEY(module_id) REFERENCES Modules(module_id) ,
    FOREIGN KEY(bootcamp_id) REFERENCES Bootcamps(bootcamp_id) 
    
);





INSERT INTO Bootcamps (name, start_date, end_date, price) VALUES
('Full Stack Web Development', '2024-01-15', '2024-06-15', 5000.00),
('Big Data', '2024-02-01', '2024-07-01', 5500.00),
('Cybersecurity', '2024-03-01', '2024-08-01', 6000.00);



INSERT INTO Students (name, surname, email, bootcamp_id) VALUES
('Carlos', 'García', 'carlos.garcia@example.com', 1),
('María', 'Martínez', 'maria.martinez@example.com', 1),
('Laura', 'Fernández', 'laura.fernandez@example.com', 1),
('Antonio', 'López', 'antonio.lopez@example.com', 2),
('Lucía', 'Sánchez', 'lucia.sanchez@example.com', 2),
('Javier', 'Pérez', 'javier.perez@example.com', 2),
('Marta', 'González', 'marta.gonzalez@example.com', 3),
('Sergio', 'Rodríguez', 'sergio.rodriguez@example.com', 3),
('Paula', 'Hernández', 'paula.hernandez@example.com', 3),
('David', 'Ruiz', 'david.ruiz@example.com', 3);


INSERT INTO Teachers (name, surname, email, phone) VALUES
('Álvaro', 'Romero', 'alvaro.romero@example.com', '+34678901234'),
('Elena', 'Molina', 'elena.molina@example.com', '+34987654321'),
('Pedro', 'Navarro', 'pedro.navarro@example.com', '+34123456789'),
('Isabel', 'Vargas', 'isabel.vargas@example.com', '+34987612345'),
('Roberto', 'Ortega', 'roberto.ortega@example.com', '+34654321098');



INSERT INTO Modules (name, start_date, end_date, teacher_id) VALUES
('Frontend Development', '2024-01-20', '2024-03-15', 1),
('Backend Development', '2024-03-16', '2024-05-15', 1),
('Machine Learning', '2024-02-05', '2024-04-30', 2),
('Network Security', '2024-03-10', '2024-05-10', 3),
('Cloud Security', '2024-05-11', '2024-07-01', 4);


INSERT INTO Bootcamp_Modules (module_id, bootcamp_id) VALUES
(1, 1), 
(2, 1),  
(3, 2),  
(4, 3),  
(5, 3)


-- Para ver que estudiantes están estudiante que Bootcamp:



SELECT 
    Bootcamps.name AS bootcamp,
    Students.name,
    Students.surname
FROM 
    Students
JOIN 
    Bootcamps ON Students.bootcamp_id = Bootcamps.bootcamp_id;
