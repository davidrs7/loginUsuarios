 USE `login_tiindux`;

drop table if exists  Respuestas_Usuario; commit;
drop table if exists  Opciones_Respuesta; commit;
drop table if exists  Competencias; commit;
drop table if exists  Preguntas; commit;
 
-- Tabla Preguntas
CREATE TABLE IF NOT EXISTS Preguntas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    idcompetencia int,
    pregunta TEXT,
    estado BOOLEAN,
    fecha_inicio DATE,
    fecha_fin DATE
);


CREATE TABLE IF NOT exists Competencias(
	id int primary key auto_increment,
    competencia text,
    estado boolean
);

-- Tabla Opciones_Respuesta
CREATE TABLE IF NOT EXISTS Opciones_Respuesta (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_pregunta INT, 
    descripcion TEXT,
    estado BOOLEAN,
    peso double
);

-- Tabla Respuestas_Usuario
CREATE TABLE IF NOT EXISTS Respuestas_Usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_pregunta INT, 
    id_respuesta INT,
    id_usuario_califica INT,
    id_usuario_calificado INT,
    comentarios TEXT,
    fecha_accion DATETIME
);
