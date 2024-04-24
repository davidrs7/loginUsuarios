	DROP DATABASE IF EXISTS login_tiindux;
CREATE DATABASE login_tiindux;
USE login_tiindux;

CREATE TABLE IF NOT EXISTS Empresas (
    EmpresaID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Estado BOOLEAN NOT NULL DEFAULT 1
);
 
CREATE TABLE IF NOT EXISTS Roles (
    RolID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(255),
     EmpresaID INT, 
    Estado BOOLEAN NOT NULL DEFAULT 1,
    FOREIGN KEY (EmpresaID) REFERENCES Empresas(EmpresaID)
);
 
CREATE TABLE IF NOT EXISTS Cargos (
    CargoID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(255),    
    EmpresaID INT, 
    Estado BOOLEAN NOT NULL DEFAULT 1,
	FOREIGN KEY (EmpresaID) REFERENCES Empresas(EmpresaID)
);

CREATE TABLE IF NOT EXISTS TiposDocumento (
	TipoDocumento INT PRIMARY KEY auto_increment,
    Descripcion VARCHAR(100) NOT NULL,
    Estado BOOLEAN NOT NULL DEFAULT 1
);

 
CREATE TABLE IF NOT EXISTS Sexo (
	SexoId INT PRIMARY KEY auto_increment,
    Descripcion VARCHAR(100) NOT NULL,
    Estado BOOLEAN NOT NULL DEFAULT 1
);

CREATE TABLE IF NOT EXISTS Usuarios (
    UsuarioID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    TipoDocumento INT NOT NULL,
    NumDocumento varchar(50) NOT NULL,
    CorreoElectronico VARCHAR(100) NOT NULL,
    Contraseña VARCHAR(255) NOT NULL,
    Telefono varchar(20) NOT NULL,
    Direccion varchar(100) NOT NULL,
    FechaNacimiento datetime NOT NULL,
    FechaCreacion datetime NOT NULL,
    SexoId INT,
    JefeId INT,
    RolID INT,
    CargoID INT,
    EmpresaID INT, 
    UsuarioIdOpcional INT,
    Estado BOOLEAN NOT NULL DEFAULT 1,
    FOREIGN KEY (RolID) REFERENCES Roles(RolID),
    FOREIGN KEY (CargoID) REFERENCES Cargos(CargoID),
    FOREIGN KEY (EmpresaID) REFERENCES Empresas(EmpresaID),
    FOREIGN KEY (JefeID) REFERENCES Usuarios(UsuarioID),
    FOREIGN KEY (SexoId) REFERENCES Sexo(SexoId),
	FOREIGN KEY (TipoDocumento) REFERENCES TiposDocumento(TipoDocumento)
);

CREATE TABLE IF NOT EXISTS Permisos (
    PermisoID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(255),
    RutaAngular VARCHAR(255),
    Estado BOOLEAN NOT NULL DEFAULT 1
);

CREATE TABLE IF NOT EXISTS RolesPermisos (
	rolPermisoId INT PRIMARY KEY AUTO_INCREMENT,
    RolID INT,
    PermisoID INT, 
    FOREIGN KEY (RolID) REFERENCES Roles(RolID),
    FOREIGN KEY (PermisoID) REFERENCES Permisos(PermisoID)
);

CREATE TABLE IF NOT EXISTS UsuariosPermisos (
    UsuarioID INT,
    PermisoID INT,
    PRIMARY KEY (UsuarioID, PermisoID),
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID) ON DELETE CASCADE,
    FOREIGN KEY (PermisoID) REFERENCES Permisos(PermisoID)
);

CREATE TABLE IF NOT EXISTS login_tiindux.Sesiones (
    SesionID INT PRIMARY KEY AUTO_INCREMENT,
    UsuarioID INT,
    Token VARCHAR(10000) NOT NULL,
    FechaInicio DATETIME NOT NULL,
    FechaFin DATETIME,
    Estado BOOLEAN NOT NULL DEFAULT 1,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Jerarquias (
    JerarquiaID INT PRIMARY KEY AUTO_INCREMENT,
    JefeID INT,
    SubordinadoID INT,
    FOREIGN KEY (JefeID) REFERENCES Usuarios(UsuarioID),
    FOREIGN KEY (SubordinadoID) REFERENCES Usuarios(UsuarioID)
); 