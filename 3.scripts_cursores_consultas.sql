-- CONSULTAS SOBRE TRANSACCIONES Y REPORTES (R.I.07 y R.I.08)

-- 1. Total de transacciones completadas por vendedor
SELECT usuarioVendedorId, COUNT(*) AS totalTransaccionesCompletadas
FROM Transacciones
WHERE estado = 'completada'
GROUP BY usuarioVendedorId
ORDER BY totalTransaccionesCompletadas DESC;

-- 2. Suma del dinero gastado por cada comprador en el último año
SELECT usuarioCompradorId, SUM(precioFinalAcordado) AS gastoTotal
FROM Transacciones
WHERE estado = 'completada'
  AND fechaFinalizacion >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY usuarioCompradorId
ORDER BY gastoTotal DESC;   

-- 3. Precio promedio de las transacciones según el estado
SELECT estado, AVG(precioFinalAcordado) AS precioPromedio
FROM Transacciones
WHERE precioFinalAcordado IS NOT NULL
GROUP BY estado
ORDER BY precioPromedio DESC;

-- 4. Transacciones agrupadas por método de entrega
SELECT metodoEntrega, COUNT(*) AS totalTransacciones, SUM(precioFinalAcordado) AS totalIngresos
FROM Transacciones
WHERE estado = 'completada'
GROUP BY metodoEntrega
ORDER BY totalIngresos DESC;

-- 5. Vendedores con más de 5 transacciones completadas en el último mes
SELECT usuarioVendedorId, COUNT(*) AS completadasMes
FROM Transacciones
WHERE estado = 'completada'
  AND fechaFinalizacion >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY usuarioVendedorId
HAVING completadasMes > 5
ORDER BY completadasMes DESC;

-- 6. Total de reportes recibidos por usuario
SELECT usuarioReportadoId, COUNT(*) AS totalReportes
FROM Reportes
WHERE usuarioReportadoId IS NOT NULL
GROUP BY usuarioReportadoId
ORDER BY totalReportes DESC;

-- 7. Número de reportes por tipo y estado
SELECT tipoReporte, estado, COUNT(*) AS cantidad
FROM Reportes
GROUP BY tipoReporte, estado
ORDER BY tipoReporte, cantidad DESC;

-- 8. Anuncios reportados por más de 2 usuarios distintos
SELECT anuncioReportadoId, COUNT(DISTINCT usuarioReportadorId) AS vecesReportado
FROM Reportes
WHERE anuncioReportadoId IS NOT NULL
GROUP BY anuncioReportadoId
HAVING vecesReportado > 2
ORDER BY vecesReportado DESC;

-- 9. Administradores que han gestionado más reportes
SELECT administradorGestionId, COUNT(*) AS reportesGestionados
FROM Reportes
WHERE administradorGestionId IS NOT NULL
GROUP BY administradorGestionId
ORDER BY reportesGestionados DESC;

-- 10. Número de reportes presentados en cada mes del último trimestre
SELECT YEAR(fechaReporte) AS anyo, MONTH(fechaReporte) AS mes, COUNT(*) AS totalReportes
FROM Reportes
WHERE fechaReporte >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
GROUP BY anyo, mes
ORDER BY anyo DESC, mes DESC;
