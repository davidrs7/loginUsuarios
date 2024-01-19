 
INSERT INTO EstadosAcciones (Estado)
VALUES
    ('Aprobado'),
    ('Aprobado Masivamente'),
    ('En Revision'),
    ('Rechazado');
 
INSERT INTO Objetivos (Titulo, Descripcion, Peso, FechaInicio, FechaFin, Estado)
VALUES
    ('Objetivo 1', 'Descripción del Objetivo 1', 0.5, '2024-01-01', '2024-02-01', true),
    ('Objetivo 2', 'Descripción del Objetivo 2', 0.8, '2024-03-01', '2024-04-01', true),
    ('Objetivo 3', 'Descripción del Objetivo 3', 0.6, '2024-05-01', '2024-06-01', true); 
    
INSERT INTO AccionesObjetivos (IdObjetivo, IdUsuario, Descripcion, Calificacion, Evidencia, IdEstado, Comentarios, FechaAccion)
VALUES
    (1, 1, 'Acción 1 para Objetivo 1', 4, 'evidencia_accion_1.jpg', 1, 'Comentario para Acción 1', '2024-01-15'),
    (1, 2, 'Acción 2 para Objetivo 1', 3, 'evidencia_accion_2.pdf', 3, 'Comentario para Acción 2', '2024-01-20');
 
INSERT INTO AccionesObjetivos (IdObjetivo, IdUsuario, Descripcion, Calificacion, Evidencia, IdEstado, Comentarios, FechaAccion)
VALUES
    (2, 2, 'Acción 1 para Objetivo 2', 5, 'evidencia_accion_3.doc', 1, 'Comentario para Acción 1', '2024-03-10'),
    (2, 3, 'Acción 2 para Objetivo 2', 2, 'evidencia_accion_4.pdf', 4, 'Comentario para Acción 2', '2024-03-15');
 
INSERT INTO AccionesObjetivos (IdObjetivo, IdUsuario, Descripcion, Calificacion, Evidencia, IdEstado, Comentarios, FechaAccion)
VALUES
    (3, 1, 'Acción 1 para Objetivo 3', 4, 'evidencia_accion_5.jpg', 2, 'Comentario para Acción 1', '2024-05-05'),
    (3, 3, 'Acción 2 para Objetivo 3', 3, 'evidencia_accion_6.pdf', 1, 'Comentario para Acción 2', '2024-05-10');