-- FUNCIÓN 1: Obtener valoración media de un usuario
DELIMITER //
CREATE FUNCTION ObtenerValoracionMedia(pUsuarioId INT)
RETURNS DECIMAL(3,2)
READS SQL DATA
BEGIN
    DECLARE vValoracionMedia DECIMAL(3,2);
    SELECT AVG(puntuacion) INTO vValoracionMedia
    FROM Valoraciones
    WHERE usuarioReceptorId = pUsuarioId;
    RETURN IFNULL(vValoracionMedia, 0);
END//
DELIMITER ;

-- FUNCIÓN 2: Contar reportes de un usuario
DELIMITER //
CREATE FUNCTION ContarReportesUsuario(pUsuarioId INT)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE vTotalReportes INT;
    SELECT COUNT(*) INTO vTotalReportes
    FROM Reportes
    WHERE usuarioReportadoId = pUsuarioId AND estado = 'resuelto';
    RETURN vTotalReportes;
END//
DELIMITER ;

-- FUNCIÓN 3: Verificar si un anuncio tiene todas las fotos necesarias
DELIMITER //
CREATE FUNCTION VerificarFotosAnuncio(pAnuncioId INT)
RETURNS BOOLEAN
READS SQL DATA
BEGIN
    DECLARE vNumFotos INT;
    SELECT COUNT(*) INTO vNumFotos
    FROM Fotografias
    WHERE anuncioId = pAnuncioId;
    RETURN (vNumFotos >= 1 AND vNumFotos <= 5);
END//
DELIMITER ;

-- FUNCIÓN 4: Obtener estado de anuncio más reciente
DELIMITER //
CREATE FUNCTION ObtenerEstadoAnuncio(pAnuncioId INT)
RETURNS VARCHAR(20)
READS SQL DATA
BEGIN
    DECLARE vEstado VARCHAR(20);
    SELECT estadoAnuncio INTO vEstado
    FROM Anuncios
    WHERE anuncioId = pAnuncioId;
    RETURN IFNULL(vEstado, 'inexistente');
END//
DELIMITER ;

-- PROCEDIMIENTO 1: Crear un anuncio completo (usuario, anuncio, foto)
DELIMITER //
CREATE PROCEDURE sp_CrearAnuncioCompleto(
    IN pUsuarioId INT,
    IN pTitulo VARCHAR(100),
    IN pDescripcion VARCHAR(1000),
    IN pPrecio DECIMAL(10,2),
    IN pEstadoProducto VARCHAR(50),
    IN pCategoriaId INT,
    IN pUbicacion VARCHAR(200),
    IN pUrlFoto1 VARCHAR(255),
    OUT pAnuncioIdCreado INT,
    OUT pMensaje VARCHAR(255)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SET pAnuncioIdCreado = 0;
        SET pMensaje = 'Error al crear anuncio';
        ROLLBACK;
    END;
    
    START TRANSACTION;
    
    INSERT INTO Anuncios(titulo, descripcion, precio, estadoProducto, categoriaId, usuarioPropietarioId, ubicacionEntrega, estadoAnuncio)
    VALUES(pTitulo, pDescripcion, pPrecio, pEstadoProducto, pCategoriaId, pUsuarioId, pUbicacion, 'borrador');
    
    SET pAnuncioIdCreado = LAST_INSERT_ID();
    
    IF pUrlFoto1 IS NOT NULL THEN
        INSERT INTO Fotografias(anuncioId, urlFoto, ordenVisualizacion)
        VALUES(pAnuncioIdCreado, pUrlFoto1, 1);
    END IF;
    
    SET pMensaje = 'Anuncio creado exitosamente en borrador';
    
    COMMIT;
END//
DELIMITER ;

-- PROCEDIMIENTO 2: Activar anuncio (pasar de borrador a activo)
DELIMITER //
CREATE PROCEDURE sp_ActivarAnuncio(
    IN pAnuncioId INT,
    IN pUsuarioId INT,
    OUT pResultado VARCHAR(255)
)
BEGIN
    DECLARE vEstado VARCHAR(20);
    DECLARE vPropietario INT;
    DECLARE vNumFotos INT;
    
    SELECT estadoAnuncio, usuarioPropietarioId INTO vEstado, vPropietario
    FROM Anuncios
    WHERE anuncioId = pAnuncioId;
    
    IF vPropietario IS NULL THEN
        SET pResultado = 'Anuncio no existe';
    ELSEIF vPropietario != pUsuarioId THEN
        SET pResultado = 'No tienes permiso para activar este anuncio';
    ELSEIF vEstado != 'borrador' THEN
        SET pResultado = 'El anuncio debe estar en borrador para activarse';
    ELSE
        SELECT COUNT(*) INTO vNumFotos FROM Fotografias WHERE anuncioId = pAnuncioId;
        IF vNumFotos < 1 THEN
            SET pResultado = 'El anuncio debe tener al menos una fotografía';
        ELSE
            UPDATE Anuncios
            SET estadoAnuncio = 'activo', fechaPublicacion = NOW()
            WHERE anuncioId = pAnuncioId;
            SET pResultado = 'Anuncio activado exitosamente';
        END IF;
    END IF;
END//
DELIMITER ;

-- PROCEDIMIENTO 3: Completar transacción (con confirmación bilateral)
DELIMITER //
CREATE PROCEDURE sp_CompletarTransaccion(
    IN pTransaccionId INT,
    IN pUsuarioId INT,
    OUT pResultado VARCHAR(255)
)
BEGIN
    DECLARE vEstado VARCHAR(50);
    DECLARE vComprador INT;
    DECLARE vVendedor INT;
    DECLARE vAnuncioId INT;
    
    SELECT estado, usuarioCompradorId, usuarioVendedorId, anuncioId 
    INTO vEstado, vComprador, vVendedor, vAnuncioId
    FROM Transacciones
    WHERE transaccionId = pTransaccionId;
    
    IF vEstado IS NULL THEN
        SET pResultado = 'Transacción no existe';
    ELSEIF pUsuarioId NOT IN (vComprador, vVendedor) THEN
        SET pResultado = 'No tienes permiso en esta transacción';
    ELSEIF vEstado = 'completada' THEN
        SET pResultado = 'La transacción ya está completada';
    ELSEIF vEstado = 'cancelada' THEN
        SET pResultado = 'La transacción fue cancelada';
    ELSEIF vEstado = 'en negociacion' THEN
        IF pUsuarioId = vComprador THEN
            UPDATE Transacciones SET estado = 'confirmada comprador' WHERE transaccionId = pTransaccionId;
            SET pResultado = 'Confirmada por comprador. En espera de vendedor.';
        ELSE
            UPDATE Transacciones SET estado = 'confirmada vendedor' WHERE transaccionId = pTransaccionId;
            SET pResultado = 'Confirmada por vendedor. En espera de comprador.';
        END IF;
    ELSEIF (vEstado = 'confirmada comprador' AND pUsuarioId = vVendedor) OR 
           (vEstado = 'confirmada vendedor' AND pUsuarioId = vComprador) THEN
        UPDATE Transacciones 
        SET estado = 'completada', fechaFinalizacion = NOW()
        WHERE transaccionId = pTransaccionId;
        
        UPDATE Anuncios SET estadoAnuncio = 'vendido' WHERE anuncioId = vAnuncioId;
        
        SET pResultado = 'Transacción completada exitosamente';
    ELSE
        SET pResultado = 'Estado inválido para completar';
    END IF;
END//
DELIMITER ;

-- PROCEDIMIENTO 4: Suspender usuario por reportes
DELIMITER //
CREATE PROCEDURE sp_SuspenderUsuarioPorReportes(
    IN pUsuarioId INT,
    IN pDiasExpulsion INT,
    OUT pResultado VARCHAR(255)
)
BEGIN
    DECLARE vNumReportesConfirmados INT;
    
    SELECT COUNT(*) INTO vNumReportesConfirmados
    FROM Reportes
    WHERE usuarioReportadoId = pUsuarioId AND estado = 'resuelto' AND accionTomada IS NOT NULL;
    
    IF vNumReportesConfirmados >= 10 THEN
        UPDATE Usuarios SET estadoCuenta = 'eliminada' WHERE usuarioId = pUsuarioId;
        SET pResultado = 'Usuario eliminado permanentemente por múltiples infracciones';
    ELSEIF vNumReportesConfirmados >= 5 THEN
        UPDATE Usuarios SET estadoCuenta = 'suspendida' WHERE usuarioId = pUsuarioId;
        SET pResultado = 'Usuario suspendido por 7 días';
    ELSE
        SET pResultado = 'Usuario con ' || vNumReportesConfirmados || ' reportes confirmados';
    END IF;
END//
DELIMITER ;