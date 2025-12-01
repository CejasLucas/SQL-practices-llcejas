# 🛳️ **Maritime Logistics DB**
Este repositorio reúne prácticas, modelos y scripts de SQL diseñados para aprender, reforzar y aplicar conceptos fundamentales de bases de datos relacionales.
El objetivo es construir una base sólida que abarque desde la teoría básica hasta la implementación práctica en motores de bases de datos como MySQL, PostgreSQL o SQL Server.
Aquí encontrarás:
- Documentación teórica y modelos de análisis.
- Scripts organizados por tipo de operación (DDL, DML, procedimientos, funciones, triggers).
- Ejercicios prácticos para afianzar conocimientos.
Este proyecto está pensado como una guía de estudio y referencia para estudiantes, desarrolladores y profesionales que deseen mejorar sus habilidades en SQL.

##  Antes de comenzar: *¿Qué necesitas para ejecutar SQL?*
Para poder ejecutar consultas SQL y gestionar bases de datos, necesitas configurar correctamente tanto el motor de base de datos (servidor) como la conexión con el cliente. Aquí te detallo los componentes esenciales:

### 1. 🛢️ Motor de base de datos (Servidor)
El motor es el software que gestiona los datos y procesa las instrucciones SQL. Ejemplos: MySQL Server, PostgreSQL, Microsoft SQL Server, Oracle Database, SQLite (versión ligera sin servidor). Debes:

- Instalar el motor en un servidor o equipo local.

- Crear una base de datos.

- Configurar puertos de acceso (por defecto, por ejemplo, el 3306 para MySQL o el 5432 para PostgreSQL).

- Definir usuarios y contraseñas con los permisos adecuados.


### 2. 🖥️ Interfaz o entorno de trabajo (Cliente de conexión)
El cliente es la herramienta que utilizas para enviar consultas al motor. Puede ser:

- Command Line Interface (CLI) como PostgreSQL o MySQL.

- Interfaz gráfica Herramientas (GUI) como DBeaver, MySQL Workbench, pgAdmin, Azure Data Studio, etc.

- Lenguaje de programación a través de librerías o controladores (por ejemplo, mysql-connector para Python o JDBC para Java).

### 3. 📶 Configuración de conexión
Debes establecer una conexión entre el cliente y el servidor especificando:

- Host o dirección IP del servidor.

- Puerto del motor.

- Nombre de usuario y contraseña.

- Nombre de la base de datos.

### 4. 🛡️ Requisitos adicionales

- Tener drivers o controladores instalados si accedes desde un lenguaje de programación.

- Asegurar que el firewall o la red permitan la comunicación entre cliente y servidor.

- Mantener actualizados los parches de seguridad del motor de base de datos.

#### ✅ En resumen:

Para usar SQL necesitas un motor donde se almacenen y gestionen los datos, y un cliente desde el cual puedas ejecutar consultas y administrar la base. Una correcta configuración de red, credenciales y controladores te permitirá trabajar eficientemente con tu base de datos.

## 🐋 Opción alternativa: Ejecutar SQL Server usando Docker
Si no deseas instalar el motor SQL directamente en tu sistema, puedes ejecutarlo dentro de un contenedor Docker. Esta opción es ideal para desarrollo porque:

- Evita instalaciones pesadas del motor SQL en tu sistema.

- Permite probar diferentes versiones rápidamente.

- Mantiene tu PC limpia y sin servicios residuales.

- Ofrece un entorno aislado para practicar SQL.

- Es fácil de crear, borrar y volver a crear cuando lo necesites.

Para interactuar con el motor de base de datos (ya sea instalado localmente o ejecutándose en Docker), utilizaremos Visual Studio Code como cliente SQL, junto con su extensión oficial SQL Server (mssql). Esta herramienta permite conectarse, ejecutar queries, ver tablas, administrar conexiones y trabajar cómodamente sin usar SQL Management Studio.

📌 Guía completa y detallada del proceso:
[SQL with Docker](<docs/0_Install DB motor with Docker.md>)

<br>

# 📦 Clonar el repositorio desde GitHub
Para comenzar a trabajar con este proyecto, necesitas clonar el repositorio en tu entorno local.
Asegúrate de cumplir con los siguientes requisitos previos: Tener instalado Git en tu sistema. Y contar con una cuenta en GitHub, lo que te permitirá mantener tu trabajo sincronizado con el repositorio remoto en la nube. De esta manera podrás descargar el código, realizar modificaciones y subir tus cambios de forma ordenada y segura.


### 🪪 Clonar repositorio y traer los últimos cambios
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

### 🧑🏽‍💻 Subir cambios a la rama correspondiente del repositorio remoto
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


# 🗂️ Estructura del proyecto
La estructura del proyecto permite trabajar con SQL de forma ordenada y progresiva. En docs/ se concentra toda la información previa al desarrollo (teoría, requisitos y modelos), lo que asegura un diseño correcto antes de escribir código. En scripts/ se separan claramente los archivos según su propósito: DDL para crear y modificar la estructura, DML para manipular datos y featured para funciones avanzadas. Esta organización facilita entender cada etapa del proceso y ejecutar los scripts en el orden adecuado, manteniendo el proyecto claro y fácil de mantener.

``` bash
    SQL-PRACTICES-LLCEJAS/
    ├── docs/
    │   ├── img/
    │   ├── pdfs/
    │   ├── 0_Install DB motor with Docker.md
    │   ├── 1_basic theory about SQL.md
    │   ├── 2_practice exercises.md
    │   └── 3_tables model.md
    │
    ├── scripts/
    │   ├── ddl/
    │   │   ├── 0_create/
    │   │   │   ├── 01_create database.sql
    │   │   │   ├── 02_create table.sql
    │   │   │   ├── 03_create index.sql
    │   │   │   └── 04_create view.sql
    │   │   ├── 1_alter table.sql
    │   │   ├── 2_truncate table.sql
    │   │   └── 3_drop database
    │   ├── dml/
    │   │   ├── 0_select/
    │   │   │   ├── 01_select.sql
    │   │   │   ├── 02_distinct.sql
    │   │   │   ├── 03_select as.sql
    │   │   │   ├── 04_count.sql
    │   │   │   ├── 05_sum.sql
    │   │   │   ├── 06_avg.sql
    │   │   │   ├── 07_max.sql
    │   │   │   ├── 08_min.sql
    │   │   │   ├── 09_join.sql
    │   │   │   ├── 10_group by.sql
    │   │   │   ├── 11_where.sql
    │   │   │   ├── 12_having.sql
    │   │   │   ├── 13_order by.sql
    │   │   │   ├── 14_limit.sql
    │   │   │   └── 15_offset.sql
    │   │   ├── 1_insert.sql
    │   │   ├── 2_update.sql
    │   │   └── 3_delete.sql
    │   └── featured/
    │       ├── 1_procedures.sql
    │       ├── 2_functions.sql
    │       └── 3_triggers.sql
    │
    └── README.md
``` 

## 🧩 Paso a paso de la construcción de una base de datos
### 0. Crear la base de datos
Aquí se define el nombre de la base de datos y se selecciona para trabajar. [CREATE DATABASE](scripts/ddl/0_create/01_create%20database.sql)
    
### 1. Crear las tablas correspondientes
Se crean las estructuras que almacenarán la información: columnas, tipos de datos, claves primarias y foráneas. [CREATE TABLE](scripts/ddl/0_create/02_create%20table.sql)

### 2. Insertar los datos necesarios
Se cargan los registros iniciales para luego poder realizar consultas. [INSERT INTO](scripts/dml/1_insert.sql)

### 3. Realizar consultas (queries)
Antes de realizar los ejercicios, leer la teoria. [THEORY](docs/0_basic%20theory%20about%20SQL.md) | [EXERCISES](docs/5_practice%20exercises.md)


<br>

# 🔚 Conclusión y Próximos Pasos

Este repositorio representa el inicio de una base sólida de conocimiento técnico en SQL, fundamental para mi desarrollo profesional en el ámbito de las bases de datos. Aquí recopilo los principios y conceptos esenciales que sustentan el trabajo diario con sistemas relacionales, ofreciendo una guía clara y estructurada para futuras consultas.

Seguiré ampliando este espacio con temas más avanzados: optimización de consultas, análisis de planes de ejecución, estrategias de indexación, seguridad, y mejores prácticas orientadas al rendimiento y la integridad de los datos.
Mi objetivo es convertir este repositorio en una referencia práctica y en evolución constante, útil tanto para proyectos personales como para entornos profesionales.