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

## 4. Catálogo de requisitos

### 4.1. Requisitos funcionales

#### R.F.01. Título requisito funcional

Como [tipo de usuario]
quiero [servicio]
para [razón]

**Prueba de aceptación**
- Descripción de la primera comprobación a realizar
- Descripción de la segunda comprobación a realizar
- Se debe aplicar la regla de negocio R.N.XX.
- ...

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
- Épica 1: Gestión de cuenta y perfil
    - Registro con correo institucional
    - Verificación de correo electrónico
    - Inicio de sesión
    - Edición de perfil personal
    - Consultar valoraciones recibidas
    - Consultar historial de transacciones (R.F.09)

- Épica 2: Publicación y gestión de anuncios
    - Publicar anuncio (R.F.01)
    - Modificar o eliminar anuncio propio (R.F.06)
    - Activar/desactivar anuncio
    - Subir fotografías del producto
    - Renovar anuncio próximo a caducar

- Épica 3: Búsqueda y exploración
    - Buscar productos con filtros avanzados (R.F.02)
    - Consultar listado de anuncios activos (R.F.08)
    - Visualizar detalle completo de anuncio
    - Guardar anuncios en favoritos (R.F.04)

- Épica 4: Comunicación y transacciones
    - Contactar con vendedor mediante chat (R.F.03)
    - Marcar transacción como completada
    - Valorar transacción (R.F.05)

- Épica 5: Moderación y seguridad
    - Reportar anuncio o usuario (R.F.07)
    - Bloquear usuario
    - Administrar categorías del sistema (R.F.10)
    - Revisar reportes pendientes
    - Suspender o eliminar usuarios infractores

### 4.3. Requisitos no funcionales (opcional)

**R.N.F. 01. Título requisito no funcional**
Como [tipo de usuario]
quiero [servicio]
para [razón]

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


