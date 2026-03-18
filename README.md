# Administración de Bases de Datos (DBA)
![SQL Server](https://img.shields.io/badge/SQL%20Server-Database-orange?logo=microsoftsqlserver)
![Status](https://img.shields.io/badge/status-en%20desarrollo-orange)
![Architecture](https://img.shields.io/badge/architecture-modular-blue)

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
    [SQL with Docker](<info/md/Install DB motor with Docker.md>)


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

La estructura del proyecto está diseñada para **facilitar el aprendizaje progresivo** y mantener un **trabajo ordenado con SQL**, con responsabilidades claramente separadas.  

- **database/**
    Contiene los scripts SQL organizados por tipo de operación:

    
    **DDL (Data Definition Language)**
    Scripts para definir y modificar la estructura de la base de datos:
    - `00_create database/` → creación de la base y objetos iniciales.
    - `01_truncate table.sql` → limpieza de tablas.
    - `02_alter table.sql` → alteración de estructuras existentes.
    - `03_drop database.sql` → eliminación completa de la base.

    **DML (Data Manipulation Language)**
    Scripts para manipulación de datos:
    - `00_insert table/` → inserción de registros.
    - `01_update table.sql` → actualización de datos.
    - `02_delete table.sql` → eliminación de registros.
        
    **DQL (Data Query Language)**
    Scripts de consulta y análisis de datos:
    - `00_selection/` → consultas básicas de selección.
    - `01_relationships/` → joins y relaciones entre tablas.
    - `02_filters/` → filtrado de datos y condiciones.
    - `03_grouping/` → agrupaciones y agregaciones.

<br>
    
- **info/**
    Material de apoyo y documentación complementaria:

    - `img/` → imágenes y diagramas.
    - `md/` → información adicional en texto.
    - `pdfs/` → guías, apuntes y referencias en PDF.

<br>

``` bash
    SQL-PRACTICES-LLCEJAS/
    ├── database/
    │   ├── DML (Data Definition Language) /
    │   │   ├── 00_create database/
    │   │   │    └── objects/
    │   │   ├── 01_truncate table.sql
    │   │   ├── 02_alter table.sql
    │   │   └── 03_drop database.sql    
    │   │    
    │   ├── DML (Data Manipulation Language)/
    │   │   ├── 00_insert table/
    │   │   ├── 01_update table.sql
    │   │   └── 02_delete table.sql
    │   │
    │   └── DQL (Data Query Language)/
    │       ├── 00_selection/
    │       ├── 01_relationships/
    │       ├── 02_filters/
    │       └── 03_grouping/
    ├── info/
    │   ├── img/
    │   ├── info/
    │   └── pdfs/
    └── README.md
``` 

<br>

# 🧮 Construcción de una base de datos
En esta sección comenzamos con la parte práctica: la creación de nuestra base de datos de logística marítima. Aquí es donde la teoría se convierte en acción. Siguiendo un enfoque paso a paso, aprenderás a diseñar, construir y poblar tu base de datos, de manera que quede lista para consultas, análisis y prácticas avanzadas de SQL. El proceso se organiza en cuatro etapas fundamentales:

> **0. Crear la base de datos:**
    Definimos el nombre y las características iniciales del sistema. 
[CREATE DATABASE](<database/DDL (Data Definition Language)/00_create database/00_create database.sql>)


> **1. Diseñar y crear las tablas:**
    Se estructuran las entidades, columnas, tipos de datos, y las relaciones entre ellas mediante claves primarias y foráneas.
[CREATE TABLES](<database/DDL (Data Definition Language)/00_create database>)

> **2. Insertar los datos iniciales:**
    Se cargan registros de ejemplo para poder realizar consultas y prácticas de forma inmediata.
[INSERT INTO](<database/DML (Data Manipulation Language)/00_insert table/>) 

> **3. Realizar consultas y ejercicios prácticos:**
    Una vez cargados los datos, es momento de explorar, analizar y manipular la información mediante queries, reforzando los conceptos aprendidos en la teoría.
[THEORY](<info/md/Basic theory about SQL.md>) | [EXERCISES](<info/md/Practice of consultation exercises.md>)

Con esta metodología, no solo construyes una base de datos funcional, sino que también consolidás una forma de trabajar ordenada y profesional, aplicable a cualquier proyecto SQL.

<br>

# 🔜 Conclusión y Próximos Pasos
Este repositorio constituye una base sólida de conocimientos en SQL y administración de bases de datos, recopilando principios y conceptos esenciales de sistemas relacionales. 

Se continuará ampliando con temas avanzados como optimización de consultas, indexación, seguridad y buenas prácticas, buscando convertirlo en una referencia práctica y en constante evolución.