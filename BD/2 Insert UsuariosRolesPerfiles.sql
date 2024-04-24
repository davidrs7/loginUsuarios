-- Insertar datos de ejemplo en Empresas
INSERT INTO Empresas (Nombre, Estado) VALUES
    ('trasminlenio', 1),
    ('Empresa B', 1),
    ('Empresa C', 1);

-- Insertar datos de ejemplo en Roles
INSERT INTO Roles (Nombre, Descripcion, EmpresaID, Estado) VALUES
    ('Admin', 'Administrador del sistema', 1, 1);
    ('Empleado', 'Empleado estándar', 1, 1),
    ('Gerente', 'Responsable de un área', 2, 1),
    ('Analista', 'Analista de datos', 3, 1);

-- Insertar datos de ejemplo en Cargos
INSERT INTO Cargos (Nombre, Descripcion, EmpresaID, Estado) VALUES     ('Administrador del sistema', 'administrador sistema', 1, 1);
    ('Gerente de Ventas', 'Gerente de Ventas de la Empresa B', 2, 1),
    ('Analista de Datos', 'Analista de Datos de la Empresa C', 3, 1);

-- Insertar datos de ejemplo en TiposDocumento
INSERT INTO TiposDocumento (Descripcion, Estado) VALUES
    ('Cédula de Ciudadanía', 1),
    ('Tarjeta de Identidad', 1),
    ('Pasaporte', 1);

-- Insertar datos de ejemplo en Sexo
INSERT INTO Sexo (Descripcion, Estado) VALUES 
    ('Masculino', 1),
    ('Femenino', 1),
    ('Otro', 1); 
-- Insertar datos de ejemplo en Usuarios
INSERT INTO Usuarios (Nombre, TipoDocumento, NumDocumento, CorreoElectronico, Contraseña, Telefono, Direccion, FechaNacimiento, FechaCreacion, SexoId, JefeId, RolID, CargoID, EmpresaID, UsuarioIdOpcional, Estado) VALUES
    ('Admin Usuario', 1, '123456789', 'admin@trasmi.com', '$2a$11$JIPxPk4FevNNeOnaaP/dB.zSP1Pqg/UOwC3FptuqpI4YpG3cS1.cC', '1234567890', '', '1990-01-01', NOW(), 2, NULL, 2, NULL, 1, NULL, 1);
    ('Usuario1', 1, '987654321', 'user1@example.com', 'pass123', '9876543210', 'Calle Secundaria 456', '1995-05-15', NOW(), 2, 1, 2, 1, 1, NULL, 1),
    ('Usuario2', 1, '456789012', 'user2@example.com', 'pass456', '4567890123', 'Calle Terciaria 789', '1998-11-20', NOW(), 1, 1, 3, 2, 2, NULL, 1),
    ('Gerente1', 1, '111111111', 'gerente1@example.com', 'gerente123', '1111111111', 'Calle Gerente 123', '1985-08-10', NOW(), 2, NULL, 4, 3, 3, NULL, 1),
    ('Analista1', 1, '222222222', 'analista1@example.com', 'analista123', '2222222222', 'Calle Analista 456', '1992-04-25', NOW(), 1, 4, 4, 3, 3, 2, 1);

-- Insertar datos de ejemplo en Permisos
INSERT INTO Permisos (Nombre, Descripcion, RutaAngular, Estado) VALUES
    ('VerDashboard', 'Acceso al dashboard', '/dashboard', 1),
    ('VerReportes', 'Acceso a los reportes', '/reportes', 1),
    ('RRHH', 'Acceso a recursos humanos', '/RRHH', 1),
    ('Administracion', 'Acceso administrar el sistema', '/administrar', 1),
    ('encuestas', 'Acceso a encuestas', '/encuestas', 1);

 
-- Asignar Permisos a Roles
INSERT INTO RolesPermisos (RolID, PermisoID) VALUES     (1, 1),   (1, 2);
    (2, 1),
    (3, 2),
    (4, 1),
    (1, 3),(1, 4),(3, 4);
 