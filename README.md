[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/7wG06BM4)
# Título Proyecto

## Miembros del grupo L7-5 

1. Ramos Torres, Alberto
1. López-Cano Liviano, Gonzalo

## 1. Introducción al problema

- En el entorno universitario español, los estudiantes enfrentan necesidades recurrentes de
adquirir materiales académicos (libros de texto, apuntes, calculadoras científicas, material de
laboratorio) y objetos de uso cotidiano (muebles, electrodomésticos, decoración, equipos
deportivos, ropa) a precios asequibles. Muchos estudiantes acumulan artículos
en buen estado que ya no utilizan y desean vender o intercambiar para recuperar parte de su
inversión o liberar espacio en sus residencias

- Clientes y usuarios: Los usuarios principales de shareUS son estudiantes universitarios activos,
verificados mediante correo electrónico institucional (xxxxx@alum.us.es en el caso de sevilla). Este
sistema asegura un entorno exclusivo, seguro y orientado específicamente a las necesidades
estudiantiles.

- Situación actual: Actualmente, los estudiantes recurren principalmente a plataformas
generalistas como Wallapop, Vinted o grupos de Facebook para estas transacciones. Si bien
estas herramientas son funcionales, presentan limitaciones importantes en el contexto
universitario:
    - Alcance geográfico excesivamente amplio: dificulta encontrar productos disponibles en el
    propio campus o ciudad universitaria
    - Ausencia de filtros académicos: no es posible buscar por curso, facultad o necesidades
        académicas específicas
    - Comunicación dispersa: la cordinación y entregas se realizan fuera del campus universitario y dificultan la entrega siendo menos accesible para muchos estudiantes

- Problemas identificados:
    - Inversión económica elevada en materiales que se utilizan durante un solo curso académico
    - Dificultad para localizar compradores/vendedores dentro del mismo entorno universitario
    - Desconfianza en transacciones con desconocidos sin respaldo institucional
    - Impacto ambiental negativo por desecho de objetos en buen estado

- Expectativas del proyecto: shareUS pretende convertirse en el marketplace de referencia para
comunidades universitarias españolas, facilitando:
    - Compraventa segura y verificada entre estudiantes de la misma institución
    - Reducción del gasto estudiantil mediante economía circular
    - Fomento de la sostenibilidad y reutilización de recursos
    - Creación de comunidad e interacción entre estudiantes
    - Sistema de valoraciones que genere confianza entre usuarios
    - Filtrado inteligente por facultad, curso académico y categorías específicas estudiantiles



![alt text](<Imagen de WhatsApp 2025-10-16 a las 12.45.42_6c8c809e.jpg>)

## 2. Glosario de términos

- Anuncio: Publicación visible en el portal dirigida a otros estudiantes de la Universidad de Sevilla con opción de añadir fotos, descripción, precio y ubicación para facilitar el contacto

- Artículo/Producto: Bien material ofrecido para venta o intercambio en la plataforma (libros,
apuntes, material académico, tecnología, muebles, ropa, etc.).

- Categoría: Clasificación temática de los productos (Libros y Apuntes, Tecnología, Muebles y
Hogar, Ropa y Complementos, Deportes, Electrónica, Servicios).

- Chat interno: Sistema de mensajería integrado en la plataforma que permite la comunicación
privada entre comprador y vendedor.

- Comprador: Usuario registrado que busca adquirir artículos publicados por otros estudiantes.

- Curso académico: Nivel de estudios del estudiante (1º Grado, 2º Grado, Máster, Doctorado)
que puede condicionar la visibilidad de ciertos productos académicos específicos.

- Estado del producto: Clasificación del grado de conservación de un artículo (Nuevo, Como
nuevo, Buen estado, Estado aceptable, Para reparar).

- Facultad/Centro: División organizativa de la universidad que permite segmentar productos por
áreas de conocimiento (Ingeniería, Ciencias, Humanidades, Derecho, etc.).

- Favoritos: Lista personalizada donde los usuarios guardan anuncios de interés para consultarlos
posteriormente.

- Marketplace: Plataforma digital que conecta vendedores y compradores sin gestionar
directamente el inventario ni las transacciones.

- Moderador/Administrador: Usuario con permisos especiales para supervisar contenidos,
validar anuncios, gestionar reportes y administrar la comunidad. Diferencias de permisos entre roles.

- Perfil de usuario: Página personalizada que contiene información del estudiante (nombre,
facultad, curso, valoración media, anuncios activos, historial).

- Publicación: Acción de crear y activar un anuncio para que sea visible públicamente en la
plataforma.

- Reporte: Funcionalidad que permite a los usuarios denunciar anuncios fraudulentos, contenido
inapropiado o comportamientos inadecuados.

- Transacción: Operación completa de compraventa o intercambio entre dos usuarios, desde el
contacto inicial hasta la entrega del producto.

- Usuario verificado: Estudiante que ha completado el proceso de autenticación mediante correo
electrónico asociado, garantizando su pertenencia a la comunidad universitaria. 

- Valoración/Reseña: Sistema de puntuación (1-5 estrellas) y comentarios que permite a
compradores y vendedores evaluar la experiencia de transacción, generando reputación.

- Vendedor: Usuario registrado que publica anuncios ofreciendo artículos propios para venta o
intercambio.

- Visibilidad de anuncio: Parámetro que determina qué usuarios pueden ver una publicación
según filtros de facultad, curso o categoría.

- Bloquear Usuario: Acción para restringir la interacción o visualización de anuncios por parte de otro usuario, generalmente en casos de comportamientos inadecuados.

## 3. Visión general del sistema
- ShareUS es una plataforma web diseñada específicamente para facilitar el intercambio y la
compraventa de artículos entre estudiantes de la Universidad de Sevilla. A diferencia de las
plataformas comerciales generalistas, shareUS se centra en crear un entorno de confianza,
cerrado y verificado, donde los estudiantes puedan realizar transacciones de manera segura y
eficiente dentro del campus universitario.

- El sistema busca optimizar la reutilización de materiales académicos y objetos de uso cotidiano,
reduciendo costes para los estudiantes y fomentando prácticas sostenibles dentro de la
comunidad universitaria.
### 3.1. Requisitos generales

- <Strong>R.G.01. Plataforma web accesible y multiplataforma</Strong> 

    El sistema debe ser accesible desde navegadores modernos (Chrome, Firefox, Safari, Edge) en
    dispositivos de escritorio, tablets y móviles, adaptándose automáticamente al tamaño de
    pantalla para garantizar una experiencia de usuario óptima en cualquier dispositivo.

- <strong>R.G.02. Base de datos relacional MariaDB</strong>  

  Toda la información del sistema (usuarios, anuncios, transacciones, mensajes, valoraciones) debe almacenarse en una base de datos relacional MariaDB, garantizando integridad referencial y la consistencia de datos.

- <strong>R.G.03. Autenticación mediante correo institucional</strong> 

  El acceso a la plataforma requiere registro obligatorio mediante correo electrónico institucional de la Universidad de Sevilla (formato: <em>xxxxx@alum.us.es</em>).  
  El sistema debe enviar un correo de verificación con enlace de activación que caduca en 24 horas, asegurando que solo estudiantes activos puedan utilizar la plataforma.

- <strong>R.G.04. Gestión completa de anuncios</strong>

  Los usuarios deben poder crear, editar, activar, desactivar y eliminar sus propios anuncios.  
  Cada anuncio debe incluir título, descripción, precio, estado del producto, categoría, fotografías y ubicación de entrega dentro del campus.

- <strong>R.G.05. Sistema de búsqueda y filtrado avanzado</strong>  

  La plataforma debe incluir un motor de búsqueda que permita filtrar anuncios por categoría, facultad, curso académico, rango de precios, estado del producto y palabras clave en título o descripción.

- <strong>R.G.06. Sistema de mensajería interna</strong>

  El sistema debe proporcionar un chat privado entre comprador y vendedor, integrado en la plataforma, que permita coordinar detalles de la transacción sin exponer datos personales externos (teléfono o correo personal).

- <strong>R.G.07. Cumplimiento de protección de datos</strong>  

  El tratamiento de información personal debe cumplir con el RGPD y la LOPDGDD, garantizando consentimiento informado, cifrado de contraseñas y los derechos de acceso, rectificación y supresión de datos.

- <strong>R.G.08. Sistema de reputación mediante valoraciones</strong>

  Compradores y vendedores deben poder valorarse mutuamente tras completar una transacción, generando un historial público de reputación que fomente la confianza entre usuarios.

- <strong>R.G.09. Moderación y gestión administrativa</strong>  

  Los administradores deben contar con herramientas para revisar reportes, validar o eliminar anuncios inapropiados, suspender cuentas infractoras y gestionar las categorías del sistema.

- <strong>R.G.10. Seguridad y rendimiento</strong>  

  El sistema debe mantener tiempos de respuesta inferiores  
  a 3 segundos para operaciones habituales (búsquedas,  
  carga de anuncios, envío de mensajes) y garantizar una  
  disponibilidad del 99% durante el horario académico.

### 3.2. Usuarios del sistema
- <strong>Estudiante registrado (Usuario estándar)</strong>

    Estudiante activo de la Universidad de Sevilla que ha completado el proceso de verificación
    mediante correo institucional.

     <strong>Funcionalidades disponibles:</strong>
    - Crear, modificar y eliminar sus propios anuncios
    - Buscar anuncios utilizando filtros avanzados
    - Contactar con vendedores mediante chat interno
    - Guardar anuncios en lista de favoritos
    - Marcar transacciones como completadas
    - Valorar a otros usuarios tras completar transacciones
    - Gestionar su perfil personal (foto, descripción, facultad, curso)
    - Reportar anuncios o usuarios con comportamientos inadecuados
    - Consultar su historial de transacciones
    - Bloquear usuarios para evitar interacciones no deseadas

- <strong>Administrador/Moderador</strong>

     Usuario con permisos elevados responsable de supervisar el correcto funcionamiento de la
    plataforma y garantizar el cumplimiento de las normas de la comunidad.
    <strong>Funcionalidades disponibles:</strong>

    - Todas las funcionalidades del usuario estándar
    - Revisar y gestionar reportes de usuarios
    - Validar, desactivar o eliminar anuncios que incumplan las normas
    - Suspender temporalmente o eliminar cuentas de usuarios infractores
    - Crear, modificar o eliminar categorías del sistema
    - Acceder a estadísticas globales de uso (número de usuarios activos, anuncios publicados,transacciones completadas)
    - Visualizar historial completo de modificaciones de anuncios
    - Eliminar mensajes de chat con contenido inapropiado
- <strong>Usuario no registrado (Visitante)</strong>  

    Usuario con permisos elevados responsable de supervisar el correcto funcionamiento de la
    plataforma y garantizar el cumplimiento de las normas de la comunidad.

    <strong>Funcionalidades disponibles:</strong>
    - Solo puede visualizar la página de inicio informativa del proyecto
    - Acceder al formulario de registro
    - Consultar términos y condiciones de uso
    - <strong>No puede:</strong> ver anuncios, realizar búsquedas, contactar usuarios ni publicar productos
    
## 4. Catálogo de requisitos

### 4.1. Requisitos funcionales

#### R.F.01. Publicar anuncio


Como estudiante vendedor
quiero crear un anuncio con información detallada de un producto
para ofrecerlo a otros estudiantes de mi universidad

**Prueba de aceptación**
- El sistema debe solicitar obligatoriamente: título, descripción, categoría, precio, estado del producto, ubicación de entrega y al menos una fotografía  
- El anuncio debe quedar en estado "borrador" hasta que el usuario lo active manualmente
- El precio debe ser un valor numérico positivo inferior a 500€ (excepto aprobaciones especiales)
- Se debe permitir subir entre 1 y 5 fotografías en formato JPG, PNG o WEBP, máximo 5 MB cada una
- La fecha de publicación se registra automáticamente al activar el anuncio
- Se debe aplicar R.N.01 (usuario verificado), R.N.04 (límites de caracteres) y R.N.06 (fotografía obligatoria)

#### R.F.02 Buscar productos con filtros
Como estudiante comprador
quiero buscar productos aplicando filtros específicos
para encontrar rápidamente artículos que necesito dentro del campus

**Prueba de aceptación**
- El sistema debe permitir filtrar simultáneamente por: categoría, facultad del vendedor, curso
académico, rango de precios y estado del producto
- Debe existir campo de búsqueda de texto libre que consulte en título y descripción
- Los resultados deben ordenarse por relevancia, fecha de publicación (más recientes
primero) o precio (ascendente/descendente)
- Solo se muestran anuncios en estado "activo" y no reportados
- Se debe aplicar R.N.02 (solo usuarios autenticados) y R.N.03 (visibilidad de anuncios
activos)
#### R.F.03. Contactar con vendedor
Como estudiante comprador
quiero enviar mensajes privados al vendedor de un anuncio
para negociar detalles de precio, estado y coordinar entrega en el campus

**Prueba de aceptación**
- El chat debe abrirse desde la ficha detallada del anuncio mediante botón "Contactar"
- Los mensajes se almacenan con marca temporal y aparecen ordenados cronológicamente
- 
#### 4.1.1. Requisitos de información

##### R.I.01. Título requisito de información

Como [tipo de usuario]
quiero [servicio]
para [razón]

**Prueba de aceptación**
- Descripción de la primera comprobación a realizar
- Descripción de la segunda comprobación a realizar
- ...

#### 4.1.2. Reglas de negocio

##### R.N.01. Verificación mediante correo institucional
Solo pueden registrarse estudiantes con correo electrónico oficial de la Universidad (formato: xxxxx@alum.us.es ejemplo de la universidad de Sevilla). El sistema envía correo de confirmación con enlace de activación
que expira en 24 horas. Hasta completar la verificación, el usuario no puede acceder a las
funcionalidades de la plataforma.

##### R.N.02.  Acceso exclusivo a usuarios autenticados
Los anuncios, búsquedas, perfiles y funcionalidades de contacto solo son accesibles para
usuarios registrados con sesión activa. Los visitantes no autenticados únicamente pueden ver
página de inicio y formulario de registro.

##### R.N.03. Visibilidad de anuncios
Solo se muestran en búsquedas y listados los anuncios con estado "activo" que no hayan sido
reportados o estén bajo revisión. Los anuncios en estado "borrador", "vendido", "inactivo" o
"eliminado" no aparecen en resultados públicos.

##### R.N.04. Límites de caracteres
- Título de anuncio: mínimo 10, máximo 100 caracteres
- Descripción de anuncio: mínimo 20, máximo 1000 caracteres
- Comentarios en valoraciones: máximo 500 caracteres
- Descripción personal de perfil: máximo 300 caracteres
Estos límites aseguran calidad informativa y legibilidad.

##### R.N.05.  Caducidad automática de anuncios
Los anuncios que permanezcan en estado "activo" sin modificaciones durante más de 90 días
consecutivos pasan automáticamente a estado "inactivo". El sistema envía notificación al
propietario 7 días antes de la inactivación, quien puede renovar el anuncio editándolo.


##### R.N.06.  Fotografía obligatoria
Todo anuncio debe incluir mínimo 1 fotografía y máximo 5. Las imágenes deben corresponder al
producto ofrecido, estar en formato JPG, PNG o WEBP, y no superar 5 MB por archivo.

##### R.N.07.  Trazabilidad de modificaciones
Cada vez que un usuario modifica un anuncio (título, descripción, precio, estado), el sistema
registra la fecha de última modificación. Esta fecha es visible públicamente. El historial completo
de cambios solo es accesible para administradores.

##### R.N.08.  Moderación de contenido inapropiado
Los mensajes de chat y comentarios en valoraciones que contengan palabras ofensivas,
discriminatorias, datos personales sensibles externos o enlaces externos son marcados
automáticamente para revisión administrativa. Los administradores pueden eliminar contenido
inapropiado sin previo aviso.

##### R.N.09.  Confirmación bilateral de transacciones
Una transacción solo se considera "completada" cuando ambos usuarios (comprador y
vendedor) confirman independientemente que el intercambio se realizó satisfactoriamente. Solo
tras esta confirmación bilateral se habilita el sistema de valoraciones mutuas.

##### R.N.10.   Gestión administrativa de reportes
Los reportes deben ser revisados por un administrador en máximo 72 horas. Si un anuncio
acumula 3 o más reportes de diferentes usuarios, se desactiva automáticamente hasta revisión.
Usuarios con 5 reportes confirmados son suspendidos temporalmente (7 días). Tras 10 reportes
confirmados, la cuenta se elimina permanentemente.

##### R.N.11.  Permisos exclusivos de administración
Solo usuarios con rol "administrador" pueden:
- Crear, modificar o eliminar categorías
- Acceder al panel de gestión de reportes
- Suspender o eliminar cuentas de usuario
- Visualizar estadísticas globales de la plataforma
- Acceder al historial completo de modificaciones de anuncios
- Eliminar mensajes de chat inapropiados
##### R.N.12.  Protección de datos personales
Conforme al RGPD(Reglamento General de Protección de Datos) y LOPDGDD(Ley Orgánica de Protección de Datos Personales y garantía de los derechos digitales), el sistema debe:
- Solicitar consentimiento expreso en el registro para tratamiento de datos
- Permitir ejercer derechos de acceso, rectificación, supresión y portabilidad
- Cifrar contraseñas mediante algoritmos seguros (bcrypt, Argon2)
- No ceder datos personales a terceros sin consentimiento
- Implementar política de privacidad y términos de uso accesibles
- Permitir eliminación completa de cuenta y datos asociados (derecho al olvido)
##### R.N.13.  Precio máximo de productos
Para mantener el espíritu de intercambio estudiantil accesible, los anuncios no pueden superar
un precio de 500€. Para artículos de mayor valor, se debe contactar con administración para
solicitar aprobación excepcional justificada.
##### R.N.14.  Productos prohibidos
Queda prohibida la publicación de anuncios que ofrezcan:
- Sustancias ilegales o controladas
- Armas o réplicas
- Material académico que vulnere derechos de autor (solucionarios oficiales filtrados,
exámenes)
- Trabajos académicos para plagio (TFG, TFM, ensayos por encargo)
- Animales vivos
- Medicamentos sin prescripción
La publicación de estos contenidos resulta en eliminación inmediata del anuncio y suspensión de
cuenta.



### 4.2. Mapa de historias de usuario (opcional)

### 4.3. Requisitos no funcionales (opcional)

**R.N.F. 01. Rendimiento**

**Como** usuario de la plataforma

**quiero** que las operaciones se ejecuten rápidamente

**para** tener una experiencia fluida sin esperas innecesarias

El sistema debe mantener tiempo de respuesta inferior a 3 segundos para consultas habituales
(búsquedas, carga de anuncios, envío de mensajes) bajo carga normal de hasta 100 usuarios
concurrentes.

**R.N.F. 02. Disponibilidad**

**Como** estudiante usuario

**quiero** que la plataforma esté disponible durante horario académico

**para** poder realizar transacciones cuando más lo necesito

La plataforma debe garantizar disponibilidad del 99% durante horario académico (08:00-22:00 horas en días laborables). Los mantenimientos programados deben realizarse fuera de este horario.
**R.N.F. 03. Seguridad**

**Como** usuario de shareUS

**quiero** que mis datos personales estén protegidos

**para** evitar accesos no autorizados o filtraciones de información

- Todas las contraseñas deben almacenarse cifradas con bcrypt o Argon2
- Las sesiones deben expirar tras 60 minutos de inactividad
- Todas las comunicaciones con el servidor deben realizarse mediante HTTPS
- Debe implementarse protección contra inyección SQL, XSS y CSRF


**R.N.F. 04. Usabilidad**

**Como** estudiante con diferentes niveles de competencia digital

**quiero** que la interfaz sea intuitiva y fácil de usar

**para poder** realizar transacciones sin necesidad de 
formación previa

La interfaz debe ser clara, accesible y cumplir con estándares WCAG 2.1 nivel AA. Los
elementos clave (búsqueda, publicar anuncio, chat) deben ser accesibles en máximo 3 clics
desde la página principal.

**R.N.F. 05. Compatibilidad**

**Como** estudiante que accede desde diferentes dispositivos

**quiero** que la plataforma funcione correctamente en todos ellos

**para** poder usarla desde cualquier lugar del campus

La aplicación web debe funcionar correctamente en:
- Navegadores: Chrome 90+, Firefox 88+, Safari 14+, Edge 90+
- Dispositivos: Escritorio (Windows, macOS, Linux), tablets y móviles (iOS 13+, Android 10+)
- Resoluciones: desde 320px (móvil) hasta 1920px (escritorio)


**R.N.F. 06. Escalabilidad**

**Como** administrador del sistema

**quiero** que la plataforma soporte crecimiento futuro

**para** poder expandirla a otras universidades o facultades sin problemas técnicos

El diseño de la base de datos y arquitectura debe permitir crecimiento hasta 10,000 usuarios
activos y 50,000 anuncios sin degradación significativa del rendimiento.
**R.N.F. 07. Mantenibilidad**

**Como** desarrollador del proyecto

**quiero** que el código esté bien documentado y estructurado

**para** facilitar futuras correcciones y actualizaciones

El código fuente debe estar documentado, seguir estándares de programación limpia y
organizado modularmente para facilitar mantenimiento y evolución del sistema.

**R.N.F. 08. Cumplimiento normativo**

**Como** responsable del tratamiento de datos

**quiero** que el sistema cumpla con la legislación vigente

**para** evitar sanciones legales y proteger los derechos de los usuarios

El sistema debe cumplir con:
- RGPD (Reglamento General de Protección de Datos)
- LOPDGDD (Ley Orgánica de Protección de Datos y Garantía de los Derechos Digitales)
- LSSI-CE (Ley de Servicios de la Sociedad de la Información y Comercio Electrónico)

-- fin entregable 1 --

## 5. Modelo conceptual

### 5.1. Diagramas de clases UML

- con restricciones.

### 5.2. Escenarios de prueba

- con descripción textual y diagrama de objetos UML.

## 6. Matrices de trazabilidad

- Matriz de trazabilidad entre los elementos del modelo conceptual y los requisitos.

|       | EntidadX   | AsociaciónX  | RestricciónX  | Entidad2 ...   | 
|:------|:-----------|:-----------|:-----------|:-----------|
| RI-1  | X          | X          | X          | X          |
| RI-2  |            | X          |            | X          |
| RF-1  |            | X          |            | X          |
| RF-2  | X          |            | X          | X          |
| RN-1  |            | X          |            |            |
| RN-2  | X          | X          | X          |            |
| ...   |            |            |            |            |

-- fin entregable 2 --

## 7. Modelo relacional en 3FN

- Relaciones obtenidas al aplicar la transformación del modelo conceptual.

### 7.1.  Justificación de la estrategia de transformación de jerarquías

- si se identificaron jerarquías en el MC.


### 8. Matriz de trazabilidad MC/SQL (opcional):

- Restricciones sobre el MC / Elementos del modelo tecnológico (SQL) (Triggers, checks, etc.)
- Incluir Reglas de negocio — Constraints/Triggers en las matrices de trazabilidad para el entregable 3

|       | EntidadX   | AsociaciónX  | RestricciónX  | Entidad2 ...   | 
|:-------|:-------|:-------|:-------|:-------|
| TABLA-1 |        |        |        |        |
| TABLA-2 |        |        |        |        |
| TABLA-3 |        |        |        |        |
| TABLA-4 |        |        |        |        |
| TRIG-1 |        |        |        |        |
| TRIG-2 | X      | X      |        | X      |
| TRIG-3 |        | X      |        | X      |
| TRIG-4 |        |        | X      |        |
| CONST-1 |        |        |        |        |
| CONST-2 | X      | X      |        | X      |
| CONST-3 |        | X      |        | X      |
| CONST-4 |        |        | X      |        |

Se consideran todo tipo de constraints declarativas (aquellas definidas durante el CREATE TABLE).
-- fin entregable 3 --

## Referencias


