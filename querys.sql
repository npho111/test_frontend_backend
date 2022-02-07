CREATE TABLE profesor (
	profesor_ID serial PRIMARY KEY,
	username VARCHAR ( 50 ) UNIQUE NOT NULL,
	apellidos VARCHAR ( 50 ) UNIQUE NOT NULL,
	email VARCHAR ( 255 ) UNIQUE NOT NULL
);

CREATE TABLE alumno (
	alumno_ID serial PRIMARY KEY,
	nombre VARCHAR ( 50 ) UNIQUE NOT NULL,
	apellidos VARCHAR ( 50 ) UNIQUE NOT NULL,
	email VARCHAR ( 255 ) UNIQUE NOT NULL
);

CREATE TABLE curso (
	curso_ID serial PRIMARY KEY,
	nombre_curso VARCHAR ( 50 ) UNIQUE NOT null,
	profesor_ID serial UNIQUE NOT NULL,
	FOREIGN KEY (profesor_ID)
       REFERENCES profesor (profesor_ID)
);

CREATE TABLE curso_alumnos(
   curso_ID serial not NULL,
   alumno_ID serial NOT null,
   primary key (curso_ID, alumno_ID),
   FOREIGN KEY (curso_ID)
       REFERENCES curso (curso_ID),
   FOREIGN KEY (alumno_ID)
       REFERENCES alumno (alumno_ID)
);