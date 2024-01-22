 
INSERT INTO Preguntas (pregunta, estado, fecha_inicio, fecha_fin) VALUES
    ('¿Cómo calificarías tu habilidad en X?', true, '2024-01-01', '2024-02-01'),
    ('¿Qué tan cómodo te sientes con Y?', true, '2024-01-15', '2024-02-15');
 commit;
INSERT INTO Opciones_Respuesta (id_pregunta, descripcion, estado, peso) VALUES
    (1, 'Muy mal', true, 1),
    (1, 'Mal', true, 2),
    (1, 'Neutral', true, 3),
    (1, 'Bien', true, 4),
    (1, 'Muy bien', true, 5),
    (2, 'No cómodo en absoluto', true, 1),
    (2, 'Poco cómodo', true, 2),
    (2, 'Neutral', true, 3),
    (2, 'Cómodo', true, 4),
    (2, 'Muy cómodo', true, 5);
  commit;
INSERT INTO Respuestas_Usuario (id_pregunta, id_respuesta, comentarios, fecha_accion) VALUES
    (1, 3, 'Comentario para pregunta 1, opción 3', NOW()),
    (2, 7, 'Comentario para pregunta 2, opción 7', NOW());
 commit;