
INSERT INTO Competencias (competencia,estado) values ('Liderazgo',1),('trabajo en equipo',1),('gestion',1); commit;

INSERT INTO Preguntas (idcompetencia,pregunta, estado, fecha_inicio, fecha_fin) VALUES
    (1,'¿Cómo calificarías tu habilidad en X?', true, '2024-01-01', '2024-02-01'),
    (2,'¿Qué tan cómodo te sientes con Y?', true, '2024-01-15', '2024-02-15'),
    (3,'¿Como es tu desempeño en Z?', true, '2024-01-15', '2024-02-15');
 commit;
INSERT INTO Opciones_Respuesta (id_pregunta, descripcion, estado, peso) VALUES
    (1, 'Supera las expectativas', true, 1),
    (1, 'Cumple con las expectativas', true, 2),
    (1, 'Se limita a cumplir su labor', true, 3),
    (1, 'No cumple con las expectativas', true, 4),
    (1, 'Sin cumplimiento', true, 5);
  commit;
INSERT INTO Respuestas_Usuario (id_pregunta, id_respuesta, comentarios,id_usuario_califica,id_usuario_calificado, fecha_accion) VALUES
    (1, 3, 'Comentario para pregunta 1, opción 3',1,1, NOW()),
    (2, 2, 'Comentario para pregunta 2, opción 7',2,1, NOW());
 commit;