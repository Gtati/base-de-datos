create database db_universidad;
use db_universidad;
create table departamento(
id_departamento int (10) primary key not null,
nombre varchar(50) not null
);
create table profesor(
id_profesor int (10) primary key not null,
nit varchar (9) not null,
nombre varchar(25) not null,
apellido1 varchar(50) not null,
apellido2 varchar(50) not null,
ciudad varchar (2) not null,
direccion varchar (50) not null,
telefono varchar(9) not null,
fecha_nacimiento date not null,
sexo enum ('H', 'M'),
id_departamento int(10) not null,
foreign key (id_departamento) references departamento(id_departamento)
);
create table grado(
id_grado int(10) primary key not null,
nombre varchar(100) not null
);
create table asignatura(
id_asignatura int(10) primary key not null,
nombre varchar(100),
creditos float not null,
tipo enum('básica', 'obligatoria', 'optativa') not null,
curso tinyint(3),
cuatrimestre tinyint(3),
id_profesor int(10) not null,
id_grado int(10) not null,
foreign key (id_profesor) references profesor(id_profesor),
foreign key (id_grado) references grado(id_grado)
);
create table alumno(
id_alumno int(10) primary key not null,
nit varchar(9) not null,
nombre varchar(25) not null,
apellido1 varchar(50) not null,
apellido2 varchar(50) not null,
ciudad varchar (2) not null,
direccion varchar (50) not null,
telefono varchar(9) not null,
fecha_nacimiento date not null,
sexo enum ('H', 'M')
);
create table curso_escolar(
id_curso_escolar int(10) primary key not null,
anyo_inicio YEAR (4),
anyo_fin YEAR (4)
);
create table alumno_se_matricula_asignatura(
id_alumno int (10) not null,
id_asignatura int (10) not null,
id_curso_escolar int(10) not null,
primary key (id_alumno, id_asignatura, id_curso_escolar),
foreign key (id_alumno) references alumno (id_alumno),
foreign key (id_asignatura) references asignatura (id_asignatura),
foreign key (id_curso_escolar) references curso_escolar (id_curso_escolar)
);

#insetar datos alumno
insert into alumno(id_alumno, nit, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento,sexo) values 
    (11, '23456732T', 'Melissa', 'Gomez', 'Salazar', 'Armenia', 'Calle 23', '7453623', '2002-03-15', 'M'),
    (12, '12345543A', 'Hernan', 'Gomez', 'Gomez ', 'Medellin', 'Carrera 15', '7654893', '1959-02-27', 'H'),
    (13, '56000132T', 'Andrea', 'Martínez', 'Ramirez', 'Cartagena', 'Carrera 789', '7234512', '2005-05-17', 'M'),
    (14, '34560123I', 'Juan', 'Jimenez', 'Rodriguez', 'Bogotá', 'Calle 45', '7239087', '1999-10-23', 'H'),
    (15, '2901245S', 'Laura', 'Nuñez', 'Mendez', 'Cali', 'Carrera 15', '7433331', '2003-06-17', 'M');
    
    select * from alumno;
    
#insertar datos alumno_se_matricula_asignatura
insert into alumno_se_matricula_asignatura(id_alumno, id_asignatura, id_curso_escolar) values 
(11,1,16),
(12,2,17),
(13,3,18),
(14,4,19),
(15,5,20);
select * from alumno_se_matricula_asignatura;

#insertar datos grado
insert into grado (id_grado, nombre) values
    (6, 'Ingenieria de Sistemas'),
    (7, 'Topografia'),
    (8, 'Arte'),
    (9, 'Licenciatura en lenguas modernas'),
    (10, 'Ingenieria de software');
    select * from grado;
    
#insertar datos asignatura
insert into asignatura(id_asignatura, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) values
    (1, 'Matemáticas ', 4.5, 'obligatoria', 1, 1, 1, 6),
    (2, 'Sociales', 3.8, 'basica', 2, 2, 2, 7),
    (3, 'Danza', 4.0, 'optativa', 3, 3, 3, 8),
    (4, 'Lengua Extranjera', 2.5, 'obligatoria', 4, 4, 4, 9),
    (5, 'Calculo diferencial', 3.8, 'obligatoria', 5, 5, 5, 10);
    select * from asignatura;
    
#insertar datos curso_escolar
insert into curso_escolar (id_curso_escolar, anyo_inicio, anyo_fin) values
    (16, 2020, 2025),
    (17, 1999, 2005),
    (18, 2012, 2017),
    (19, 2019, 2024),
    (20, 2018, 2023);
    select * from curso_escolar;
    
    #insertar datos profesor
    insert into profesor(id_profesor, nit, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento,sexo, id_departamento) values 
    (1, '23456731T', 'Marcela', 'Ramirez', 'Velez', 'Armenia', 'Calle 22', '7454623', '1974-05-18', 'M',1),
    (2, '12345542A', 'Francisco', 'Gonzales', 'Orozco ', 'Medellin', 'Carrera 111', '7654593', '1959-02-20', 'H',2),
    (3, '56000133T', 'Martina', 'Fernandez', 'Castaño', 'Cartagena', 'Carrera 79', '7234112', '1998-05-12', 'M',3),
    (4, '34560124I', 'Cristian', 'Lopez', 'Mora', 'Bogotá', 'Carrera 45', '7239047', '1999-11-13', 'H',4),
    (5, '290124e3', 'Lizeth', 'Naranjo', 'Ospina', 'Cali', 'Calle 15', '7423331', '1995-02-02', 'M',5);
    select * from profesor;
    
    #insertar datos departamento
insert into departamento (id_departamento, nombre) values
    (1, 'Quindio'),
    (2, 'Antioquia'),
    (3, 'Bolivar'),
    (4, 'Cundimarca'),
    (5, 'Valle del Cauca');
    select * from departamento;
    