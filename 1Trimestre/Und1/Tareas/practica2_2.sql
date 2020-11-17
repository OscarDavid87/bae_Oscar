alter table ALUMNOS
  ADD edad Smallint(2);

alter table ALUMNOS
  check (edad Between 14 and 65 );

alter table CURSOS
  check (maximo_alumnos>15),
  check (horas IN(30, 40, 60));

alter table ALUMNOS
  drop constraint sexo;

alter table PROFESORES
  drop COLUMN direccion,
  drop primary key,
  add primary key (nombre, apellido1),
  RENAME TUTORES;
drop table ALUMNOS;

Create user Oscar_David_Flores_Perez@localhost IDENTIFIED by BD02;

Grant all privileges on db_centros.CURSOS to Oscar_David_Flores_Perez@localhost;
flush privileges;
  Revoke alter TABLE, update table on bd_centro.CURSOS from Oscar_David_Flores_Perez@localhost;
