-- Insertar usuarios (3 estudiantes + 1 administrador)
INSERT INTO Usuarios(nombre, correoInstitucional, contraseaCifrada, facultad, curso, fechaRegistro, estadoCuenta, rolUsuario) VALUES
('Alberto Ramos Torres', 'albramtor@alum.us.es', SHA2('password123', 256), 'Ingeniería Informática', '3º Grado', NOW(), 'activa', 'estudiante'),
('Gonzalo López-Cano Liviano', 'gonlopliv@alum.us.es', SHA2('password456', 256), 'Ingeniería Informática', '3º Grado', NOW(), 'activa', 'estudiante'),
('María García López', 'margarlop@alum.us.es', SHA2('password789', 256), 'Ciencias', '2º Grado', NOW(), 'activa', 'estudiante'),
('Juan Pérez Admin', 'juanpergon@alum.us.es', SHA2('admin1234', 256), 'Administración', 'Máster', NOW(), 'activa', 'administrador'),
('Sofia Martínez Ruiz', 'sofmarrui@alum.us.es', SHA2('pass2024', 256), 'Humanidades', '1º Grado', NOW(), 'activa', 'estudiante');

-- Insertar categorías
INSERT INTO Categorias(nombre, descripcion, estadoCategoria) VALUES
('Libros y Apuntes', 'Libros de texto, apuntes y material académico', 'activa'),
('Tecnología', 'Ordenadores, tablets, accesorios electrónicos', 'activa'),
('Muebles y Hogar', 'Muebles, lámparas, decoración', 'activa'),
('Ropa y Complementos', 'Ropa, zapatos, bolsas', 'activa'),
('Deportes', 'Equipos deportivos, ropa deportiva', 'activa'),
('Electrónica', 'Aparatos electrónicos y gadgets', 'activa'),
('Servicios', 'Clases particulares, trabajos puntuales', 'activa');

-- Insertar anuncios (algunos de Alberto, algunos de Gonzalo)
INSERT INTO Anuncios(titulo, descripcion, precio, estadoProducto, categoriaId, usuarioPropietarioId, fechaPublicacion, estadoAnuncio, ubicacionEntrega) VALUES
('Fundamentos de Programación - Libro Oficial', 'Libro de la asignatura, prácticamente nuevo, con apuntes incluidos', 25.00, 'como nuevo', 1, 1, NOW(), 'activo', 'Facultad de Ingeniería - Planta Baja'),
('Lámpara LED de escritorio', 'Lámpara con luz ajustable, perfecta para estudiar. Está en buen estado.', 15.00, 'buen estado', 3, 1, NOW(), 'activo', 'Residencia Universitaria'),
('Cable HDMI 2 metros', 'Cable HDMI de buena calidad, nunca usado', 8.50, 'nuevo', 2, 2, NOW(), 'activo', 'Facultad de Ingeniería'),
('Sudadera deportiva Talla M', 'Sudadera gris sin usar, perfecta para deporte', 20.00, 'nuevo', 4, 2, NOW(), 'activo', 'Campus principal'),
('Altavoz Bluetooth portátil', 'Altavoz en buen estado, batería funcional', 30.00, 'buen estado', 6, 3, NOW(), 'activo', 'Biblioteca Universitaria'),
('Mochila de 40L para excursiones', 'Mochila roja, para senderismo. Está nueva', 35.00, 'nuevo', 5, 1, SUBDATE(NOW(), INTERVAL 95 DAY), 'activo', 'Campus'),
('Diccionario Inglés-Español', 'Diccionario de bolsillo, útil para las asignaturas', 5.00, 'estado aceptable', 1, 2, NOW(), 'borrador', 'A convenir');

-- Insertar fotografías
INSERT INTO Fotografias(anuncioId, urlFoto, ordenVisualizacion, tamanoMB) VALUES
(1, 'https://ejemplo.com/libro1.jpg', 1, 2.5),
(1, 'https://ejemplo.com/libro1_detalle.jpg', 2, 1.8),
(2, 'https://ejemplo.com/lampara.jpg', 1, 3.2),
(3, 'https://ejemplo.com/cable.jpg', 1, 1.2),
(4, 'https://ejemplo.com/sudadera.jpg', 1, 4.1),
(5, 'https://ejemplo.com/altavoz.jpg', 1, 3.5),
(6, 'https://ejemplo.com/mochila.jpg', 1, 4.5),
(7, 'https://ejemplo.com/diccionario.jpg', 1, 2.0);

-- Insertar favoritos
INSERT INTO CategoriasFavoritas(usuarioId, anuncioId, fechaGuardado) VALUES
(2, 1, NOW()),
(3, 2, NOW()),
(2, 5, NOW());

-- Insertar transacciones
INSERT INTO Transacciones(anuncioId, usuarioCompradorId, usuarioVendedorId, fechaInicio, estado, precioFinalAcordado, metodoEntrega) VALUES
(1, 2, 1, SUBDATE(NOW(), INTERVAL 5 DAY), 'completada', 25.00, 'en persona campus'),
(2, 3, 1, SUBDATE(NOW(), INTERVAL 3 DAY), 'en negociacion', 15.00, 'en persona campus'),
(4, 3, 2, SUBDATE(NOW(), INTERVAL 2 DAY), 'confirmada comprador', 20.00, 'en persona campus');

-- Actualizar fechas de finalización para transacción completada
UPDATE Transacciones SET fechaFinalizacion = SUBDATE(NOW(), INTERVAL 4 DAY) WHERE transaccionId = 1;

-- Insertar mensajes
INSERT INTO Mensajes(transaccionId, usuarioEmisorId, usuarioReceptorId, contenidoMensaje, fechaEnvio, estadoMensaje) VALUES
(1, 2, 1, '¿El libro tiene todas las páginas?', SUBDATE(NOW(), INTERVAL 5 DAY), 'leido'),
(1, 1, 2, 'Sí, está completo y en perfecto estado', SUBDATE(NOW(), INTERVAL 4 DAY), 'leido'),
(2, 3, 1, '¿Puedo ver más fotos de la lámpara?', SUBDATE(NOW(), INTERVAL 2 DAY), 'leido'),
(3, 3, 2, 'Hola, ¿a qué hora podríamos vernos?', SUBDATE(NOW(), INTERVAL 1 DAY), 'leido'),
(3, 2, 3, 'Mañana a las 4pm en el campus?', NOW(), 'leido');

-- Insertar valoraciones
INSERT INTO Valoraciones(usuarioEmisorId, usuarioReceptorId, anuncioId, puntuacion, comentario, fechaValoracion, tipoValoracion) VALUES
(2, 1, 1, 5, 'Vendedor muy responsable, producto en perfecto estado', NOW(), 'como comprador'),
(1, 2, 1, 5, 'Comprador puntual y amable', NOW(), 'como vendedor');

-- Insertar reportes
INSERT INTO Reportes(usuarioReportadorId, tipoReporte, usuarioReportadoId, descripcionMotivo, fechaReporte, estado) VALUES
(3, 'comportamiento inadecuado', 4, 'Usuario fue maleducado en el chat', SUBDATE(NOW(), INTERVAL 10 DAY), 'resuelto');
