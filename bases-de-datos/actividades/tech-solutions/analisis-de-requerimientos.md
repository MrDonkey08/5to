# Tech Solutions

## Análisis de Requerimientos

### Tipos de Usuarios

   - Administradores
   - Empleados
   - Clientes

### Responsabilidades y Privilegios

1. *Administradores:*
   - Responsabilidades:
     - Gestión de usuarios y privilegios.
     - Configuración del sistema y mantenimiento de la base de datos.
   - Privilegios:
     - Acceso completo a todos los datos de la empresa.
     - Capacidad para modificar la estructura de la base de datos.

2. *Empleados:*
   - Responsabilidades:
     - Acceso y actualización de datos específicos relacionados con su función.
     - Generación de informes y análisis de datos relevantes para su área de trabajo.
   - Privilegios:
     - Acceso limitado a datos relacionados con su función específica.
     - Capacidad para ingresar y actualizar información en áreas designadas.

3. *Clientes:*
   - Responsabilidades:
     - Acceso a información sobre los servicios contratados.
     - Visualización de facturas, detalles de contratos y seguimiento de proyectos.
   - Privilegios:
     - Acceso limitado a datos relacionados con sus servicios contratados.
     - Capacidad para ver y descargar documentos relevantes para su relación con la empresa.

#### Afinación de Privilegios

4. *Aplicación del principio de menor privilegio:*
   - Asignar solo los privilegios mínimos necesarios para cada tipo de usuario, según sus funciones y responsabilidades.

5. *Documentación de roles y privilegios:*
   - Registrar en una tabla los roles identificados junto con sus descripciones y los privilegios asociados.

6. *Revisión y ajustes:*
   - Revisar en equipo los roles y privilegios identificados para asegurarse de su completitud y precisión.
   - Realizar ajustes según sea necesario para garantizar que reflejen con precisión las necesidades del negocio y los requisitos de seguridad.

### Roles

1. Administradores:
   - Responsables de la gestión de usuarios y privilegios.
   - Configuración del sistema y mantenimiento de la base de datos.
   - Acceso completo a todos los datos de la empresa.

2. Empleados:
   - Acceso y actualización de datos específicos relacionados con su función.
   - Generación de informes y análisis de datos relevantes para su área de trabajo.

3. Clientes:
   - Acceso a información sobre los servicios contratados.
   - Visualización de facturas, detalles de contratos y seguimiento de proyectos.

### Politicas de Seguridad

1. Control de Acceso:
   - Implementación de un sistema de control de acceso basado en roles.
   - Limitación del acceso a información sensible para reducir riesgos de fugas de datos.

2. Gestión de Contraseñas:
   - Política de contraseñas robusta con requisitos de complejidad y cambio periódico.
   - Protección de cuentas y datos sensibles contra accesos no autorizados.

3. Protección de Datos:
   - Cifrado de extremo a extremo para todos los datos sensibles almacenados y en tránsito.
   - Mayor seguridad y cumplimiento normativo para reducir el riesgo de exposición de datos.

4. Respuesta ante Incidentes:
   - Desarrollo y prueba de un plan de respuesta ante incidentes con roles y procedimientos claros.
   - Minimización del tiempo de inactividad y protección de la reputación de la empresa.