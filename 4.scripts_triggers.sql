-- TRIGGER 1: Desactiva anuncio con 3 o más reportes únicos
DELIMITER //
CREATE TRIGGER tDesactivarAnuncioReportado
AFTER INSERT ON Reportes
FOR EACH ROW
BEGIN
    DECLARE numReportes INT;
    IF NEW.anuncioReportadoId IS NOT NULL THEN
        SELECT COUNT(DISTINCT usuarioReportadorId) INTO numReportes
        FROM Reportes
        WHERE anuncioReportadoId = NEW.anuncioReportadoId;
        IF numReportes >= 3 THEN
            UPDATE Anuncios
            SET estado = 'inactivo'
            WHERE anuncioId = NEW.anuncioReportadoId AND estado = 'activo';
        END IF;
    END IF;
END//
DELIMITER ;

-- TRIGGER 2: Limita a 3 reportes por usuario sobre el mismo anuncio
DELIMITER //
CREATE TRIGGER tLimiteReportesPorUsuario
BEFORE INSERT ON Reportes
FOR EACH ROW
BEGIN
    DECLARE numReportesPrevios INT;
    IF NEW.anuncioReportadoId IS NOT NULL THEN
        SELECT COUNT(*) INTO numReportesPrevios
        FROM Reportes
        WHERE usuarioReportadorId = NEW.usuarioReportadorId
          AND anuncioReportadoId = NEW.anuncioReportadoId;
        IF numReportesPrevios >= 3 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'No puedes reportar el mismo anuncio más de 3 veces';
        END IF;
    END IF;
END//
DELIMITER ;

-- TRIGGER 3: Confirmación bilateral antes de completar una transacción
DELIMITER //
CREATE TRIGGER tConfirmacionBilateralTransaccion
BEFORE UPDATE ON Transacciones
FOR EACH ROW
BEGIN
    IF NEW.estado = 'completada' AND OLD.estado != 'completada' THEN
        IF OLD.estado NOT IN ('confirmada_comprador', 'confirmada_vendedor') THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Transacción debe ser confirmada por comprador y vendedor antes de completarse';
        END IF;
        UPDATE Anuncios
        SET estado = 'vendido'
        WHERE anuncioId = NEW.anuncioId;
        SET NEW.fechaFinalizacion = NOW();
    END IF;
END//
DELIMITER ;

-- TRIGGER 4: Valida límites de caracteres en anuncios (título y descripción)
DELIMITER //
CREATE TRIGGER tValidarLimitesAnuncio
BEFORE INSERT ON Anuncios
FOR EACH ROW
BEGIN
    IF LENGTH(NEW.titulo) < 10 OR LENGTH(NEW.titulo) > 100 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El título debe tener entre 10 y 100 caracteres';
    END IF;
    IF LENGTH(NEW.descripcion) < 20 OR LENGTH(NEW.descripcion) > 1000 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La descripción debe tener entre 20 y 1000 caracteres';
    END IF;
    IF NEW.precio IS NOT NULL AND NEW.precio >= 500 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El precio debe ser menor a 500 euros';
    END IF;
END//
DELIMITER ;

-- TRIGGER 5: Actualiza valoración media tras nueva valoración
DELIMITER //
CREATE TRIGGER tActualizarValoracionMedia
AFTER INSERT ON Valoraciones
FOR EACH ROW
BEGIN
    DECLARE nuevaValoracionMedia DECIMAL(3,2);
    SELECT AVG(puntuacion) INTO nuevaValoracionMedia
    FROM Valoraciones
    WHERE usuarioReceptorId = NEW.usuarioReceptorId;
    UPDATE Usuarios
    SET valoracionMedia = nuevaValoracionMedia
    WHERE usuarioId = NEW.usuarioReceptorId;
    UPDATE Usuarios
    SET numeroTransaccionesCompletadas = numeroTransaccionesCompletadas + 1
    WHERE usuarioId = NEW.usuarioReceptorId;
END//
DELIMITER ;
