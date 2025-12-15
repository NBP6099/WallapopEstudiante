-- 1. TABLA USUARIOS
CREATE TABLE Usuarios (
    usuarioId INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correoInstitucional VARCHAR(100) NOT NULL UNIQUE,
    contraseaCifrada VARCHAR(255) NOT NULL,
    facultad VARCHAR(100) NOT NULL,
    curso ENUM('1º Grado', '2º Grado', '3º Grado', '4º Grado', 'Máster', 'Doctorado') NOT NULL,
    fotoPerfil VARCHAR(255),
    descripcionPersonal VARCHAR(300),
    fechaRegistro DATETIME DEFAULT CURRENT_TIMESTAMP,
    estadoCuenta ENUM('activa', 'suspendida', 'eliminada') DEFAULT 'activa',
    valoracionMedia DECIMAL(3,2) DEFAULT 0,
    numeroTransaccionesCompletadas INT DEFAULT 0,
    rolUsuario ENUM('estudiante', 'administrador') DEFAULT 'estudiante',
    CONSTRAINT CHK_correo_formato CHECK (correoInstitucional LIKE '%@alum.us.es'),
    CONSTRAINT CHK_valoracion_rango CHECK (valoracionMedia >= 0 AND valoracionMedia <= 5),
    CONSTRAINT CHK_curso_valido CHECK (curso IN ('1º Grado', '2º Grado', '3º Grado', '4º Grado', 'Máster', 'Doctorado'))
);

-- 2. TABLA CATEGORIAS
CREATE TABLE Categorias (
    categoriaId INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(200),
    icono VARCHAR(255),
    estadoCategoria ENUM('activa', 'inactiva') DEFAULT 'activa'
);

-- 3. TABLA ANUNCIOS
CREATE TABLE Anuncios (
    anuncioId INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    descripcion VARCHAR(1000) NOT NULL,
    precio DECIMAL(10,2),
    esIntercambio BOOLEAN DEFAULT FALSE,
    estadoProducto ENUM('nuevo', 'como nuevo', 'buen estado', 'estado aceptable', 'para reparar') NOT NULL,
    categoriaId INT NOT NULL,
    usuarioPropietarioId INT NOT NULL,
    fechaPublicacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaUltimaModificacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    estadoAnuncio ENUM('borrador', 'activo', 'vendido', 'inactivo', 'eliminado') DEFAULT 'borrador',
    numeroVisualizaciones INT DEFAULT 0,
    ubicacionEntrega VARCHAR(200) NOT NULL,
    CONSTRAINT FK_anuncio_usuario FOREIGN KEY (usuarioPropietarioId) REFERENCES Usuarios(usuarioId) ON DELETE CASCADE,
    CONSTRAINT FK_anuncio_categoria FOREIGN KEY (categoriaId) REFERENCES Categorias(categoriaId) ON DELETE RESTRICT,
    CONSTRAINT CHK_titulo_rango CHECK (LENGTH(titulo) >= 10 AND LENGTH(titulo) <= 100),
    CONSTRAINT CHK_descripcion_rango CHECK (LENGTH(descripcion) >= 20 AND LENGTH(descripcion) <= 1000),
    CONSTRAINT CHK_precio_venta CHECK (precio IS NULL OR (precio > 0 AND precio < 500)),
    CONSTRAINT CHK_precio_intercambio CHECK (NOT (esIntercambio = TRUE AND precio IS NOT NULL)),
    CONSTRAINT CHK_estado_coherente CHECK (
        NOT (estadoAnuncio = 'vendido' AND esIntercambio = TRUE)
    ),
    INDEX idx_estado (estadoAnuncio),
    INDEX idx_categoria (categoriaId),
    INDEX idx_usuario (usuarioPropietarioId)
);

-- 4. TABLA FOTOGRAFIAS
CREATE TABLE Fotografias (
    fotografiaId INT AUTO_INCREMENT PRIMARY KEY,
    anuncioId INT NOT NULL,
    urlFoto VARCHAR(255) NOT NULL,
    ordenVisualizacion INT NOT NULL DEFAULT 1,
    fechaCarga DATETIME DEFAULT CURRENT_TIMESTAMP,
    tamanoMB DECIMAL(4,2),
    CONSTRAINT FK_foto_anuncio FOREIGN KEY (anuncioId) REFERENCES Anuncios(anuncioId) ON DELETE CASCADE,
    CONSTRAINT CHK_foto_cantidad CHECK (ordenVisualizacion BETWEEN 1 AND 5),
    CONSTRAINT CHK_foto_tamanyo CHECK (tamanoMB <= 5),
    CONSTRAINT UK_foto_orden UNIQUE (anuncioId, ordenVisualizacion),
    INDEX idx_anuncio (anuncioId)
);

-- 5. TABLA CATEGORIAS_FAVORITAS
CREATE TABLE CategoriasFavoritas (
    favoritoId INT AUTO_INCREMENT PRIMARY KEY,
    usuarioId INT NOT NULL,
    anuncioId INT NOT NULL,
    fechaGuardado DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT FK_favorito_usuario FOREIGN KEY (usuarioId) REFERENCES Usuarios(usuarioId) ON DELETE CASCADE,
    CONSTRAINT FK_favorito_anuncio FOREIGN KEY (anuncioId) REFERENCES Anuncios(anuncioId) ON DELETE CASCADE,
    CONSTRAINT UK_favorito_unico UNIQUE (usuarioId, anuncioId),
    INDEX idx_usuario (usuarioId)
);

-- 6. TABLA TRANSACCIONES
CREATE TABLE Transacciones (
    transaccionId INT AUTO_INCREMENT PRIMARY KEY,
    anuncioId INT NOT NULL,
    usuarioCompradorId INT NOT NULL,
    usuarioVendedorId INT NOT NULL,
    fechaInicio DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaFinalizacion DATETIME,
    estado ENUM('en negociacion', 'confirmada comprador', 'confirmada vendedor', 'completada', 'cancelada') DEFAULT 'en negociacion',
    precioFinalAcordado DECIMAL(10,2),
    metodoEntrega ENUM('en persona campus', 'intercambio') NOT NULL,
    CONSTRAINT FK_transaccion_anuncio FOREIGN KEY (anuncioId) REFERENCES Anuncios(anuncioId) ON DELETE RESTRICT,
    CONSTRAINT FK_transaccion_comprador FOREIGN KEY (usuarioCompradorId) REFERENCES Usuarios(usuarioId) ON DELETE RESTRICT,
    CONSTRAINT FK_transaccion_vendedor FOREIGN KEY (usuarioVendedorId) REFERENCES Usuarios(usuarioId) ON DELETE RESTRICT,
    CONSTRAINT CHK_usuarios_diferentes CHECK (usuarioCompradorId != usuarioVendedorId),
    CONSTRAINT CHK_precio_positivo CHECK (precioFinalAcordado IS NULL OR precioFinalAcordado > 0),
    INDEX idx_comprador (usuarioCompradorId),
    INDEX idx_vendedor (usuarioVendedorId),
    INDEX idx_estado (estado)
);

-- 7. TABLA MENSAJES
CREATE TABLE Mensajes (
    mensajeId INT AUTO_INCREMENT PRIMARY KEY,
    transaccionId INT NOT NULL,
    usuarioEmisorId INT NOT NULL,
    usuarioReceptorId INT NOT NULL,
    contenidoMensaje VARCHAR(1000) NOT NULL,
    fechaEnvio DATETIME DEFAULT CURRENT_TIMESTAMP,
    estadoMensaje ENUM('enviado', 'leido', 'eliminado') DEFAULT 'enviado',
    CONSTRAINT FK_mensaje_transaccion FOREIGN KEY (transaccionId) REFERENCES Transacciones(transaccionId) ON DELETE CASCADE,
    CONSTRAINT FK_mensaje_emisor FOREIGN KEY (usuarioEmisorId) REFERENCES Usuarios(usuarioId) ON DELETE RESTRICT,
    CONSTRAINT FK_mensaje_receptor FOREIGN KEY (usuarioReceptorId) REFERENCES Usuarios(usuarioId) ON DELETE RESTRICT,
    CONSTRAINT CHK_contenido_rango CHECK (LENGTH(contenidoMensaje) BETWEEN 1 AND 1000),
    INDEX idx_transaccion (transaccionId),
    INDEX idx_fecha (fechaEnvio)
);

-- 8. TABLA VALORACIONES
CREATE TABLE Valoraciones (
    valoracionId INT AUTO_INCREMENT PRIMARY KEY,
    usuarioEmisorId INT NOT NULL,
    usuarioReceptorId INT NOT NULL,
    anuncioId INT NOT NULL,
    puntuacion INT NOT NULL,
    comentario VARCHAR(500),
    fechaValoracion DATETIME DEFAULT CURRENT_TIMESTAMP,
    tipoValoracion ENUM('como comprador', 'como vendedor') NOT NULL,
    CONSTRAINT FK_valoracion_emisor FOREIGN KEY (usuarioEmisorId) REFERENCES Usuarios(usuarioId) ON DELETE RESTRICT,
    CONSTRAINT FK_valoracion_receptor FOREIGN KEY (usuarioReceptorId) REFERENCES Usuarios(usuarioId) ON DELETE RESTRICT,
    CONSTRAINT FK_valoracion_anuncio FOREIGN KEY (anuncioId) REFERENCES Anuncios(anuncioId) ON DELETE RESTRICT,
    CONSTRAINT CHK_puntuacion CHECK (puntuacion BETWEEN 1 AND 5),
    CONSTRAINT CHK_no_autovaloracion CHECK (usuarioEmisorId != usuarioReceptorId),
    CONSTRAINT CHK_comentario_rango CHECK (comentario IS NULL OR LENGTH(comentario) <= 500),
    CONSTRAINT UK_valoracion_unica UNIQUE (usuarioEmisorId, usuarioReceptorId, anuncioId),
    INDEX idx_receptor (usuarioReceptorId),
    INDEX idx_fecha (fechaValoracion)
);

-- 9. TABLA REPORTES
CREATE TABLE Reportes (
    reporteId INT AUTO_INCREMENT PRIMARY KEY,
    usuarioReportadorId INT NOT NULL,
    tipoReporte ENUM('anuncio fraudulento', 'contenido ofensivo', 'spam', 'producto prohibido', 'comportamiento inadecuado') NOT NULL,
    anuncioReportadoId INT,
    usuarioReportadoId INT,
    descripcionMotivo VARCHAR(500) NOT NULL,
    fechaReporte DATETIME DEFAULT CURRENT_TIMESTAMP,
    estado ENUM('pendiente', 'en revision', 'resuelto', 'desestimado') DEFAULT 'pendiente',
    administradorGestionId INT,
    fechaResolucion DATETIME,
    accionTomada ENUM('advertencia', 'eliminacion anuncio', 'suspension temporal', 'expulsion'),
    CONSTRAINT FK_reporte_reportador FOREIGN KEY (usuarioReportadorId) REFERENCES Usuarios(usuarioId) ON DELETE RESTRICT,
    CONSTRAINT FK_reporte_anuncio FOREIGN KEY (anuncioReportadoId) REFERENCES Anuncios(anuncioId) ON DELETE CASCADE,
    CONSTRAINT FK_reporte_usuario FOREIGN KEY (usuarioReportadoId) REFERENCES Usuarios(usuarioId) ON DELETE CASCADE,
    CONSTRAINT FK_reporte_admin FOREIGN KEY (administradorGestionId) REFERENCES Usuarios(usuarioId) ON DELETE SET NULL,
    CONSTRAINT CHK_reporte_objetivo CHECK (
        (anuncioReportadoId IS NOT NULL AND usuarioReportadoId IS NULL) OR
        (anuncioReportadoId IS NULL AND usuarioReportadoId IS NOT NULL)
    ),
    CONSTRAINT CHK_descripcion_rango CHECK (LENGTH(descripcionMotivo) BETWEEN 1 AND 500),
    INDEX idx_estado (estado),
    INDEX idx_fecha (fechaReporte)
);

-- 10. TABLA BLOQUEOS DE USUARIO
CREATE TABLE BloqueoUsuario (
    bloqueoId INT AUTO_INCREMENT PRIMARY KEY,
    usuarioBloqueadorId INT NOT NULL,
    usuarioBloqueadoId INT NOT NULL,
    fechaBloqueo DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT FK_bloqueo_bloqueador FOREIGN KEY (usuarioBloqueadorId) REFERENCES Usuarios(usuarioId) ON DELETE CASCADE,
    CONSTRAINT FK_bloqueo_bloqueado FOREIGN KEY (usuarioBloqueadoId) REFERENCES Usuarios(usuarioId) ON DELETE CASCADE,
    CONSTRAINT CHK_no_auto_bloqueo CHECK (usuarioBloqueadorId != usuarioBloqueadoId),
    CONSTRAINT UK_bloqueo_unico UNIQUE (usuarioBloqueadorId, usuarioBloqueadoId),
    INDEX idx_bloqueado (usuarioBloqueadoId)
);

