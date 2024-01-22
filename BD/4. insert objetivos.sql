-- Insertar datos en la tabla EstadosAcciones
INSERT INTO EstadosAcciones (Estado) VALUES 
('aprobado'),
('rechazado'),
('calificado'),
('Registrado');

-- Insertar datos en la tabla Objetivos
INSERT INTO Objetivos (Titulo, Descripcion, Peso, FechaInicio, FechaFin, Estado) VALUES
('Objetivo 1', 'Descripción del objetivo 1', 0.8, '2022-01-01 08:00:00', '2022-01-15 17:00:00', true),
('Objetivo 2', 'Descripción del objetivo 2', 0.6, '2022-02-01 10:00:00', '2022-02-28 18:00:00', false),
('Objetivo 3', 'Descripción del objetivo 3', 0.9, '2022-03-01 09:00:00', '2022-03-31 16:00:00', true);

-- Insertar datos en la tabla AccionesObjetivos
INSERT INTO AccionesObjetivos (IdObjetivo, IdUsuario, Descripcion, Calificacion, Evidencia, IdEstado, Comentarios, FechaAccion) VALUES
(1, 1, 'Acción 1 para Objetivo 1', 90, 'evidencia_accion_1.pdf', 1, 'Comentarios de la acción 1', '2022-01-10 14:30:00'),
(1, 1, 'Acción 2 para Objetivo 1', 95, 'evidencia_accion_2.pdf', 2, 'Comentarios de la acción 2', '2022-01-12 12:45:00'),
(2, 2, 'Acción 1 para Objetivo 2', 80, 'evidencia_accion_3.pdf', 1, 'Comentarios de la acción 3', '2022-02-15 09:15:00'),
(3, 3, 'Acción 1 para Objetivo 3', 92, 'evidencia_accion_4.pdf', 1, 'Comentarios de la acción 4', '2022-03-05 11:00:00');
