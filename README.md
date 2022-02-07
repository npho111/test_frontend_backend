
# SQL:

## Modelo de datos

[![modelo.png](https://i.postimg.cc/C1CPrDyM/modelo.png)](https://postimg.cc/R6FLNWV2)








<details> 
  <summary><span style="font-size:larger;"> Respuestas Preguntas SQL </span></summary>


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

    CREATE TABLE notas (
	alumno_ID serial UNIQUE NOT null,
	curso_ID serial UNIQUE NOT null,
	numero_nota INT not null,
	nota DECIMAL(5,2) not null,
	PRIMARY key (curso_ID, alumno_ID),
	FOREIGN KEY (curso_ID)
       REFERENCES curso (curso_ID),
    FOREIGN KEY (alumno_ID)
       REFERENCES alumno (alumno_ID)
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

    

   1) Escriba una Query que entregue la lista de alumnos para el curso "programación"

    SELECT a.nombre, a.apellidos FROM alumnos a
    INNER JOIN curso_alumnos b ON b.`alumno_id` = a.alumno_id
    INNER JOIN cursos b ON b.`cursos_id` = b.id
    WHERE nombre = 'programación'

   2) Escriba una Query que calcule el promedio de notas de un alumno en un curso.

    SELECT a.nombre, a.apellidos, alumno_id,AVG(notas) AS "promedio_notas"
    FROM notas GROUP BY alumno_id
    INNER JOIN alumno a ON n.curso_id = a.curso_id;

   3) Escriba una Query que entregue a los alumnos y el promedio que tiene en cada curso.
 
    SELECT n.id_alumno, a.nombre, a.apellido, c.nombre_curso, AVG(n.nota) AS "promedio_notas"
    FROM nota n
    INNER JOIN alumno a ON n.alumno_id = a.alumno_id
    INNER JOIN curso c ON a.curso_id = c.curso_id

   4) Escriba una Query que lista a todos los alumnos con más de un curso con promedio rojo.
        
    SELECT p.nombre, p. apellido, CAST(
                                            CASE
                                                WHEN AVG(n.nota) < 4
                                                    THEN 1
                                                        ELSE 0
                                        END AS bit) as "mas de 1 promedio rojo", *
        FROM notas
        INNER JOIN alumno a ON n.alumno_id = a.alumno_id

   5) Dejando de lado el problema del cólegio se tiene una tabla con información de jugadores de tenis: PLAYERS(Nombre, Pais, Ranking). Suponga que Ranking es un número de 1 a 100 que es distinto para cada jugador. Si la tabla en un momento dado tiene solo 20 registros, indique cuantos registros tiene la tabla que resulta de la siguiente consulta:

    ```
    SELECT c1.Nombre, c2.Nombre
    FROM PLAYERS c1, PLAYERS c2
    WHERE c1.Ranking > c2.Ranking
    ```
    b) 190

</details>

<br />
<br />

# Backend: https://github.com/npho111/flask_crud_app





































