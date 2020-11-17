CREATE DATABASE bd_centro;
CHARACTER SET utf8 COLLATE utf8_spnish_ci;
USE bd_centro;

CREATE TABLE PROFESORES(
  dni varchar (9) primary key,
  nombre varchar(10) not null unique,
  apellido1 varchar (15) not null,
  apellido2 varchar (15),
  direccion varchar (30),
  salario decimal(6,2) not null
);

CREATE TABLE CURSOS(
  nombre varchar (10) not null unique,
  codigo int (5) auto_increment primary key,
  dni_profesor varchar (9), FOREIGN KEY (dni) references PROFESORES(dni),
  maximo_alumnos int (3) not null,
  fecha_inicio DATE check (fecha_inicio<fecha_fin) not null,
  fecha_fin DATE not null,
  horas int (3) not null
);

CREATE TABLE ALUMNOS (
  dni varchar (9) primary key,
  nombre varchar(10) not null,
  apellido1 varchar(15) not null,
  apellido2 varchar(15) not null,
  direccion varchar(30) not null,
  sexo BOOLEAN check (sexo = 'H' or sexo = 'M'),
  fecha_nacimiento DATE not null,
  curso int (5), FOREIGN KEY (codigo) references CURSOS(codigo)
);

CREATE user Profesores IDENTIFIED BY ClaveAcceso;
CREATE USER Alumnos IDENTIFIED by ClaveAccesoAlumno;
