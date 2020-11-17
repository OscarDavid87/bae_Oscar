CREATE DATABASE bd_centro; /* creamos la base de datos centro*/
CHARACTER SET utf8 COLLATE utf8_spnish_ci; /* usamos los comandos CHARACTER SET y COLLATE*/
USE bd_centro;

/* Creamos la tabla Profesores
    Utilizaremos el dni como primary key, y no podra dejar en blanco los campos
    nombre, apellido1 y salario.
    */
CREATE TABLE PROFESORES(
  dni varchar (9) primary key,
  nombre varchar(10) not null unique,
  apellido1 varchar (15) not null,
  apellido2 varchar (15),
  direccion varchar (30),
  salario decimal(6,2) not null
);

/*creamos la tabla CURSOS, en esta tabla tenemos;
  como primary key un codigo incremental y como FOREIGN key el dni de los PROFESORES
  al tratarse de un curso todo los campos deben estar rellenados*/
CREATE TABLE CURSOS(
  nombre varchar (10) not null unique,
  codigo int (5) auto_increment primary key,
  dni_profesor varchar (9), FOREIGN KEY (dni) references PROFESORES(dni),
  maximo_alumnos int (3) not null,
  fecha_inicio DATE check (fecha_inicio<fecha_fin) not null,
  fecha_fin DATE not null,
  horas int (3) not null
);

/* creamos la tabla ALUMNOS de la cual;
  dni es primary key y cursos foreing key
  dado que necesitamos tener todos los datos del alumno no pueden quedar campos en blanco
  */
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

/* creamos la entidad PROFESORES y la entidad alumnos, y les damos una clave de acceso */
CREATE user Profesores IDENTIFIED BY ClaveAcceso;
CREATE USER Alumnos IDENTIFIED by ClaveAccesoAlumno;
