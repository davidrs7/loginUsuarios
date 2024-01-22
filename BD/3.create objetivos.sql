 
USE `login_tiindux`;



drop table AccionesObjetivos; commit;
drop table Objetivos; commit;
drop table EstadosAcciones; commit;

CREATE TABLE IF NOT EXISTS EstadosAcciones (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Estado VARCHAR(50) 
);

CREATE TABLE IF NOT EXISTS Objetivos (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Titulo VARCHAR(255) NOT NULL,
    Descripcion TEXT,
    Peso DOUBLE,
    FechaInicio DATETIME,
    FechaFin DATETIME,
    Estado bool
);
 
CREATE TABLE IF NOT EXISTS AccionesObjetivos (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    IdObjetivo INT,
    IdUsuario INT,
    Descripcion TEXT,
    Calificacion INT,
    Evidencia VARCHAR(255), -- Aquí asumimos que el nombre del archivo es suficiente para identificar la evidencia
    IdEstado INT,
    Comentarios TEXT,
    FechaAccion DATETIME,
    FOREIGN KEY (IdObjetivo) REFERENCES Objetivos(Id),
    FOREIGN KEY (IdUsuario) REFERENCES Usuarios(UsuarioID), -- Asegúrate de tener una tabla de usuarios con una columna Id
    FOREIGN KEY (IdEstado) REFERENCES EstadosAcciones(Id)
);
 

