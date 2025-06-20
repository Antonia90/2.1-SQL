
--CONSULTAS TIENDA--

-- 1.
SELECT nombre FROM producto;

-- 2.
SELECT nombre, precio FROM producto;

--3.
SELECT * FROM producto;

-- 4.
SELECT nombre, precio, ROUND(precio * 1.08, 2) AS USD FROM producto;

-- 5.
SELECT nombre AS 'Nombre de producto', precio AS EUROS, ROUND(precio * 1.08, 2) AS 'Dólares estadounidenses' FROM producto;

-- 6.
SELECT UPPER(nombre) AS 'Nombre de producto', precio FROM producto;

-- 7.
SELECT LOWER(nombre) AS 'Nombre de producto', precio FROM producto;

-- 8.
SELECT nombre, UPPER(LEFT(nombre, 2)) AS iniciales FROM fabricante;

-- 9.
SELECT nombre, ROUND(precio) AS 'Precio redondeado' FROM producto;

-- 10.
SELECT nombre,  TRUNCATE(precio, 0) AS 'Precio sin decimales' FROM producto;

-- 11.
SELECT fabricante.codigo FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante;

-- 12.
SELECT DISTINCT fabricante.codigo FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante;

-- 13.
SELECT nombre FROM fabricante ORDER BY nombre ASC;

-- 14.
SELECT nombre FROM fabricante ORDER BY nombre DESC;

-- 15. 
SELECT nombre FROM producto ORDER BY nombre ASC, precio DESC;

-- 16.
SELECT * FROM fabricante LIMIT 5;

-- 17.
SELECT * FROM fabricante LIMIT 3, 2;

-- 18.
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

-- 19.
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

-- 20.
SELECT nombre FROM producto WHERE codigo_fabricante = 2;

-- 21.
SELECT producto.nombre AS producto, producto.precio, fabricante.nombre AS fabricante FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;

-- 22.
SELECT producto.nombre AS producto, producto.precio, fabricante.nombre AS fabricante FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY fabricante.nombre ASC;

-- 23.
SELECT producto.codigo AS 'Código del producto', producto.nombre AS producto, fabricante.codigo AS 'Código del fabricante', fabricante.nombre AS fabricante FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;

-- 24.
SELECT producto.nombre AS producto, producto.precio, fabricante.nombre AS fabricante FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY precio ASC LIMIT 1;

-- 25.
SELECT producto.nombre AS producto, producto.precio, fabricante.nombre AS fabricante FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY precio DESC LIMIT 1;

-- 26.
SELECT producto.* FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Lenovo';

-- 27.
SELECT producto.* FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE producto.precio > 200 AND fabricante.nombre = 'Crucial';

-- 28.
SELECT producto.* FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Asus'OR fabricante.nombre = 'Hewlett-Packard' OR fabricante.nombre = 'Seagate';

-- 29.
SELECT producto.* FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

-- 30.
SELECT producto.nombre, producto.precio FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE '%e';

-- 31.
SELECT producto.nombre, producto.precio FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE '%w%';

-- 32.
SELECT producto.nombre AS producto, producto.precio, fabricante.nombre AS fabricante FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE producto.precio >= 180 ORDER BY producto.precio DESC, producto.nombre ASC;

-- 33.
SELECT fabricante.codigo, fabricante.nombre AS fabricante FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante;

-- 34.
SELECT fabricante.*, producto.* FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante;

-- 35.
SELECT fabricante.* FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE producto.codigo_fabricante IS NULL;

-- 36.
SELECT * FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo');

-- 37.
SELECT * FROM producto WHERE precio  = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));

-- 38.
SELECT nombre FROM producto WHERE precio  = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));

-- 39.
SELECT nombre FROM producto WHERE precio  = (SELECT MIN(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Hewlett-Packard'));

-- 40.
SELECT * FROM producto WHERE precio  >= (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));

-- 41.
SELECT * FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus') AND precio > (SELECT AVG(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus'));



--CONSULTAS UNIVERSIDAD--

-- 1.
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;

-- 2.
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND (telefono = '' OR telefono IS NULL);

-- 3.
SELECT * FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;

-- 4.
SELECT * FROM persona WHERE tipo = 'profesor' AND (telefono = '' OR telefono IS NULL) AND RIGHT(nif,1) = 'K';

-- 5.
SELECT * FROM asignatura WHERE curso = 3 AND cuatrimestre = 1 AND id_grado = 7;

-- 6.
SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre AS departamento FROM profesor INNER JOIN persona ON profesor.id_profesor = persona.id INNER JOIN departamento ON profesor.id_departamento = departamento.id;

-- 7.
SELECT asignatura.nombre AS asignatura, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM asignatura INNER JOIN alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id INNER JOIN curso_escolar ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar INNER JOIN persona ON persona.id = alumno_se_matricula_asignatura.id_alumno WHERE persona.nif = '26902806M';

-- 8.
SELECT DISTINCT departamento.nombre AS departamento FROM departamento INNER JOIN profesor ON departamento.id = profesor.id_departamento INNER JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor INNER JOIN grado ON asignatura.id_grado = grado.id WHERE grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

-- 9.
SELECT nombre, apellido1, apellido2 FROM persona INNER JOIN alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura.id_alumno = persona.id INNER JOIN curso_escolar ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar WHERE anyo_inicio = 2018 AND anyo_fin = 2019 GROUP BY persona.id;


-- CONSULTAS CON LEFT JOIN / RIGHT JOIN --

-- 1.
SELECT departamento.nombre AS departamento, apellido1, apellido2, persona.nombre FROM persona LEFT JOIN profesor ON profesor.id_profesor = persona.id LEFT JOIN departamento ON profesor.id_departamento = departamento.id WHERE tipo = 'profesor' ORDER BY departamento.nombre ASC, apellido1 ASC, apellido2 ASC, persona.nombre ASC;

-- 2.
SELECT apellido1, apellido2, persona.nombre FROM persona RIGHT JOIN profesor ON profesor.id_profesor = persona.id WHERE profesor.id_departamento IS NULL;

-- 3.
SELECT departamento.nombre AS departamento FROM departamento LEFT JOIN profesor ON profesor.id_departamento = departamento.id WHERE profesor.id_profesor IS NULL;

-- 4.
SELECT apellido1, apellido2, persona.nombre FROM persona LEFT JOIN profesor ON profesor.id_profesor = persona.id LEFT JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor WHERE persona.tipo = 'profesor' AND asignatura.id IS NULL;

-- 5.
SELECT asignatura.id, asignatura.nombre FROM asignatura LEFT JOIN profesor ON asignatura.id_profesor = profesor.id_profesor WHERE asignatura.id_profesor IS NULL;

-- 6.
SELECT DISTINCT departamento.id, departamento.nombre FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor LEFT JOIN alumno_se_matricula_asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura WHERE alumno_se_matricula_asignatura.id_asignatura IS NULL;


-- CONSULTAS RESUMEN --

-- 1.
SELECT COUNT(*) AS total FROM persona WHERE tipo = 'alumno';

-- 2.
SELECT COUNT(*) AS total FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;

-- 3.
SELECT departamento.nombre AS departamento, COUNT(*) AS cantidad_profesores FROM departamento INNER JOIN profesor ON profesor.id_departamento = departamento.id GROUP BY departamento.nombre ORDER BY cantidad_profesores DESC;

-- 4.
SELECT departamento.nombre AS departamento, COUNT(profesor.id_profesor) AS numero_profesores FROM departamento LEFT JOIN profesor ON profesor.id_departamento = departamento.id GROUP BY departamento.id;

-- 5.
SELECT grado.nombre, COUNT(asignatura.id) AS cantidad_asignaturas FROM grado LEFT JOIN asignatura ON asignatura.id_grado = grado.id GROUP BY grado.id ORDER BY cantidad_asignaturas DESC; 

-- 6.
SELECT grado.nombre, COUNT(asignatura.id) AS cantidad_asignaturas FROM grado INNER JOIN asignatura ON asignatura.id_grado = grado.id GROUP BY grado.id HAVING COUNT(*) > 40;

-- 7.
SELECT grado.nombre, asignatura.tipo AS asignatura_tipo, SUM(creditos) AS creditos FROM grado INNER JOIN asignatura ON asignatura.id_grado = grado.id GROUP BY grado.id, asignatura.tipo;

-- 8.
SELECT curso_escolar.anyo_inicio AS inicio_curso, COUNT(*) AS total_alumnos FROM alumno_se_matricula_asignatura INNER JOIN curso_escolar ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar GROUP BY curso_escolar.anyo_inicio;

-- 9.
SELECT persona.apellido1, persona.apellido2, persona.nombre, COUNT(asignatura.id) AS cantidad_asignaturas FROM persona LEFT JOIN asignatura ON persona.id = asignatura.id_profesor WHERE persona.tipo = 'profesor' GROUP BY persona.apellido1, persona.apellido2, persona.nombre;

-- 10.
SELECT * FROM persona WHERE persona.fecha_nacimiento =(SELECT MAX(fecha_nacimiento) FROM persona WHERE tipo = 'alumno'); 

-- 11.
SELECT persona.apellido1, persona.apellido2, persona.nombre FROM profesor INNER JOIN persona ON profesor.id_profesor = persona.id INNER JOIN departamento ON departamento.id = profesor.id_departamento LEFT JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor WHERE asignatura.id IS NULL;



