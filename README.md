# Administración de Bases de Datos (DBA)
![SQL Server](https://img.shields.io/badge/SQL%20Server-Database-red?logo=microsoftsqlserver)
![Status](https://img.shields.io/badge/status-en%20desarrollo-yellow)


Este repositorio reúne prácticas, modelos y scripts de SQL diseñados para aprender, reforzar y aplicar conceptos fundamentales de bases de datos relacionales.
El objetivo es construir una base sólida que abarque desde la teoría básica hasta la implementación práctica en motores de bases de datos como MySQL, PostgreSQL o SQL Server.
Aquí encontrarás:
- Documentación teórica y modelos de análisis.

- Scripts organizados por tipo de operación (DDL, DML, procedimientos, funciones, triggers).

- Ejercicios prácticos para afianzar conocimientos.

Este proyecto está pensado como una guía de estudio y referencia para estudiantes, desarrolladores y profesionales que deseen mejorar sus habilidades en SQL.

## Antes de comenzar: *¿Qué necesitas para ejecutar SQL?*
Para poder ejecutar consultas SQL y gestionar bases de datos, necesitas configurar correctamente tanto el motor de base de datos (servidor) como la conexión con el cliente. Aquí te detallo los componentes esenciales:

### 🛢️ 1. Motor de base de datos (Servidor)
El motor es el software que gestiona los datos y procesa las instrucciones SQL. Ejemplos: MySQL Server, PostgreSQL, Microsoft SQL Server, Oracle Database, SQLite (versión ligera sin servidor). Debes:

- Instalar el motor en un servidor o equipo local.

- Crear una base de datos.

- Definir usuarios y contraseñas con los permisos adecuados.

- Configurar puertos de acceso (por defecto, por ejemplo, el 3306 para MySQL o el 5432 para PostgreSQL).

- Tambien tenes una opcion alternativa usando Docker 
    > 📌 Guía completa y detallada del proceso:
    [SQL with Docker](<docs/md/Install DB motor with Docker.md>)


### 🖥️ 2. Interfaz o entorno de trabajo (Cliente de conexión)
El cliente es la herramienta que utilizas para enviar consultas al motor. Puede ser:

- Command Line Interface (CLI) como PostgreSQL o MySQL.

- Interfaz gráfica Herramientas (GUI) como DBeaver, MySQL Workbench, pgAdmin, Azure Data Studio, etc.

- Lenguaje de programación a través de librerías o controladores (por ejemplo, mysql-connector para Python o JDBC para Java).

### 🔗 3. Configuración de conexión
Debes establecer una conexión entre el cliente y el servidor especificando:

- Host o dirección IP del servidor.

- Puerto del motor.

- Nombre de usuario y contraseña.

- Nombre de la base de datos.

### 🛡️ 4. Requisitos adicionales

- Tener drivers o controladores instalados si accedes desde un lenguaje de programación.

- Asegurar que el firewall o la red permitan la comunicación entre cliente y servidor.

- Mantener actualizados los parches de seguridad del motor de base de datos.

#### En resumen:

Para usar SQL necesitas un motor donde se almacenen y gestionen los datos, y un cliente desde el cual puedas ejecutar consultas y administrar la base. Una correcta configuración de red, credenciales y controladores te permitirá trabajar eficientemente con tu base de datos.

<br>



# 📦 Clonación del proyecto desde GitHub
Para comenzar a trabajar con este proyecto, necesitas clonar el repositorio en tu entorno local.
Asegúrate de cumplir con los siguientes requisitos previos: Tener instalado Git en tu sistema. Y contar con una cuenta en GitHub, lo que te permitirá mantener tu trabajo sincronizado con el repositorio remoto en la nube. De esta manera podrás descargar el código, realizar modificaciones y subir tus cambios de forma ordenada y segura.


### Obtener el repositorio y sincronizar actualizaciones
``` bash 
    # Clonar repo
    git clone https://github.com/CejasLucas/sql-practices-llcejas.git

    # Entrar al directorio (observa que el nombre es en minúsculas)
    cd sql-practices-llcejas

    # Cambiar a la rama deseada (si ya existe en remoto)
    git checkout branch_name

    # Traer los últimos cambios desde remoto
    git pull origin branch_name

    # [NOTA] Si la rama no existe localmente, puedes crearla y vincularla así
    git checkout -b branch_name origin/branch_name
``` 

### Subir commits a la rama del repositorio remoto
``` bash 
    # Agregar cambios al staging
    git add .

    # Verificar qué se va a commitear
    git status

    # Crear commit
    git commit -m "Mensaje descriptivo de los cambios"

    # Enviar la rama al remoto
    git push origin branch_name

    # Ver último commit realizado
    git log -1
``` 

<br>

# 🗂️ Estructura del proyecto
La estructura del proyecto está diseñada para facilitar el aprendizaje progresivo y el trabajo ordenado con SQL, siguiendo una separación clara de responsabilidades.
El directorio **docs/** centraliza toda la información previa al desarrollo —teoría, requisitos, guías y material de apoyo— lo que permite comprender y planificar correctamente antes de escribir código.

Por su parte, el directorio database/ contiene los scripts SQL organizados según su propósito y tipo de operación:

- **schema/:** incluye scripts de definición y modificación de la estructura de la base de datos (creación, alteración y eliminación de objetos principales).

- **scripts/:** agrupa las operaciones de manipulación de datos, como inserciones, actualizaciones y eliminaciones, utilizadas para poblar y mantener la información.

- **queries/:** contiene consultas orientadas a la lectura, análisis y práctica de SQL, incluyendo filtros, agregaciones, joins y subconsultas.

- **objects/:** concentra los objetos avanzados de base de datos, como índices, triggers, vistas, funciones y procedimientos almacenados, fundamentales para optimización, automatización y lógica de negocio.

Esta organización permite comprender fácilmente cada etapa del ciclo de vida de una base de datos y ejecutar los scripts en el orden adecuado, manteniendo el proyecto claro, escalable y fácil de mantener tanto para estudio como para referencia profesional.

``` bash
    SQL-PRACTICES-LLCEJAS/
    ├── database/
    │   ├── objects/
    │   │   ├── 01_indexes.sql
    │   │   ├── 02_triggers.sql
    │   │   ├── 03_views.sql
    │   │   ├── 04_functions.sql
    │   │   └── 05_procedures.sql
    │   │    
    │   ├── queries/
    │   │   ├── 01_select.sql
    │   │   ├── 02_distinct.sql
    │   │   ├── 03_select as.sql
    │   │   ├── 04_count.sql
    │   │   ├── 05_sum.sql
    │   │   ├── 06_avg.sql
    │   │   ├── 07_max.sql
    │   │   ├── 08_min.sql
    │   │   ├── 09_join.sql
    │   │   ├── 10_group by.sql
    │   │   ├── 11_where.sql
    │   │   ├── 12_having.sql
    │   │   ├── 13_order by.sql
    │   │   ├── 14_limit.sql
    │   │   └── 15_offset.sql
    │   │
    │   ├── schema/
    │   │   ├── create database/
    │   │   ├── alter table.sql
    │   │   ├── drop database.sql
    │   │   └── truncate table.sql
    │   │    
    │   └── scripts/
    │       ├── insert into/
    │       ├── delete.sql
    │       └── update.sql
    │
    ├── docs/
    │   ├── img/
    │   ├── info/
    │   └── pdfs/
    │  
    └── README.md
``` 

<br>

# 🧮 Construcción de una base de datos
En esta sección comenzamos con la parte práctica: la creación de nuestra base de datos de logística marítima. Aquí es donde la teoría se convierte en acción. Siguiendo un enfoque paso a paso, aprenderás a diseñar, construir y poblar tu base de datos, de manera que quede lista para consultas, análisis y prácticas avanzadas de SQL. El proceso se organiza en cuatro etapas fundamentales:

> **0. Crear la base de datos:**
    Definimos el nombre y las características iniciales del sistema. 
[CREATE DATABASE](<database/schema/00_create database/00_create database.sql>)

> **1. Diseñar y crear las tablas:**
    Se estructuran las entidades, columnas, tipos de datos, y las relaciones entre ellas mediante claves primarias y foráneas.
[CREATE TABLES](<database/schema/00_create database>)

> **2. Insertar los datos iniciales:**
    Se cargan registros de ejemplo para poder realizar consultas y prácticas de forma inmediata.
[INSERT INTO](<database/scripts/00_insert table>) 

> **3. Realizar consultas y ejercicios prácticos:**
    Una vez cargados los datos, es momento de explorar, analizar y manipular la información mediante queries, reforzando los conceptos aprendidos en la teoría.
[THEORY](<docs/md/Basic theory about SQL.md>) | [EXERCISES](<docs/md/Practice of consultation exercises.md>)

Con esta metodología, no solo construyes una base de datos funcional, sino que también consolidás una forma de trabajar ordenada y profesional, aplicable a cualquier proyecto SQL.

<br>

# 🔜 Conclusión y Próximos Pasos
Este repositorio constituye una base sólida de conocimientos en SQL y administración de bases de datos, recopilando principios y conceptos esenciales de sistemas relacionales. 

Se continuará ampliando con temas avanzados como optimización de consultas, indexación, seguridad y buenas prácticas, buscando convertirlo en una referencia práctica y en constante evolución.