DROP DATABASE IF EXISTS crud_manager;

CREATE DATABASE IF NOT EXISTS crud_manager;

USE crud_manager;

CREATE TABLE IF NOT EXISTS users(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    sexo ENUM('M', 'F'),
    email VARCHAR(150) NOT NULL,
    password varchar(256) not null
);

CREATE TABLE IF NOT EXISTS posts(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    content TEXT NOT NULL,
    post_date DATE NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY(user_id) 
    REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS companies (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(128) NOT NULL,
	`role` VARCHAR(128) NOT NULL,
	`start` DATE NOT NULL,
	`end` DATE,
	user_id INT NOT NULL,
	FOREIGN KEY(user_id)
	REFERENCES users(id)
);

CREATE TABLE supplier (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100),
  phone VARCHAR(20),
  address TEXT,
  company_id INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (company_id) REFERENCES companies(id)
);

INSERT INTO users VALUES
(DEFAULT, "Emerson Carvalho", "M", "emerson@mail.com", "admin"),
(DEFAULT, "Luiza Carvalho", "F", "lu@mail.com", "admin"),
(DEFAULT, "Elenice Carvalho", "F", "le@mail.com", "admin"),
(DEFAULT, "Noé Carvalho", "M", "noe@mail.com", "admin"),
(DEFAULT, "Rosânia Carvalho", "F", "ro@mail.com", "admin");

INSERT INTO posts VALUES
(DEFAULT, "Olá do Emerson", CURDATE(), 1),
(DEFAULT, "Olá da Luiza", CURDATE(), 2),
(DEFAULT, "Olá da Denise", CURDATE(), 3),
(DEFAULT, "Olá do Noé", CURDATE(), 4),
(DEFAULT, "Olá da Rosânia", CURDATE(), 5),
(DEFAULT, "Olá da Rosânia 1", CURDATE(), 5),
(DEFAULT, "Olá da Rosânia 2", CURDATE(), 5),
(DEFAULT, "Olá da Rosânia 3", CURDATE(), 5);