# ⚙️ SQL Server en Docker: Guía práctica y completa
Docker permite ejecutar aplicaciones en entornos aislados, portables y fáciles de gestionar, lo que lo hace ideal para desarrolladores, testers y administradores de bases de datos. Con esta guía aprenderás a instalar Docker, levantar SQL Server en un contenedor y administrarlo, de manera rápida y segura. Esta opción es especialmente útil para desarrollo porque:

- Evita la instalación completa del motor SQL en tu sistema.

- Permite probar diferentes versiones de SQL Server en minutos.

- Mantiene tu equipo limpio, sin servicios o procesos residuales.

- Proporciona un entorno aislado perfecto para practicar SQL.

- Permite crear, eliminar y recrear contenedores fácilmente según tus necesidades.

Para interactuar con SQL Server desde tu computadora, podemos utilizar Visual Studio Code con su extensión oficial de **SQL Server (mssql)**. Esto permite conectarte, ejecutar consultas y administrar bases de datos sin usar SQL Server Management Studio.


## 💻 Principales comandos de Docker
Una vez instalado Docker, estos comandos te serán útiles para empezar a trabajar con contenedores e imágenes:

| Comando                   |	Función 
|---------------------------|---------------------------------------------------------------
|   `docker ps`	            |  Lista los contenedores en ejecución
|   `docker ps -a`	        |  Lista todos los contenedores, incluyendo los detenidos
|   `docker stop <nombre>`	|  Detiene un contenedor en ejecución
|   `docker rm <nombre>`	|  Elimina un contenedor detenido
|   `docker images`	        |  Lista las imágenes descargadas o creadas localmente
|   `docker rmi <imagen>`	|  Elimina una imagen local
|   `docker logs <nombre>`	|  Muestra los logs de un contenedor


<br>

# 🐋 0. Instalar Docker en tu sistema
Docker se puede instalar en Windows, macOS y Linux. La instalación varía según el sistema operativo, pero el objetivo es tener:

- **Docker Engine**: el motor que ejecuta los contenedores.  
- **Docker CLI**: la interfaz de línea de comandos para interactuar con Docker.  
- **Docker Compose**: herramienta para definir y ejecutar aplicaciones multicontenedor.  


## Linux (Ubuntu / Debian)
En Linux, Docker se instala normalmente a través del gestor de paquetes `apt`. Estos son los pasos:

```bash
# Actualiza la lista de paquetes disponibles
sudo apt update

# Instala Docker
sudo apt install -y docker.io

# Inicia el servicio de Docker
sudo systemctl start docker

# Habilita Docker para que se ejecute automáticamente al iniciar el sistema
sudo systemctl enable docker

# Agrega tu usuario al grupo 'docker' para poder ejecutar Docker sin 'sudo'
sudo usermod -aG docker $USER

# Verifica la versión instalada
docker --version

# Muestra información detallada sobre Docker y su estado
docker info
```


## Windows 10 / 11
En Windows, se utiliza Docker Desktop, que incluye Docker Engine, Docker CLI y Docker Compose. Se puede descargar e instalar desde la terminal con curl o manualmente desde el sitio web:

```bash
# Descarga el instalador de Docker Desktop
curl.exe -L -o DockerDesktopInstaller.exe "https://desktop.docker.com/win/stable/Docker%20Desktop%20Installer.exe"

# Ejecuta el instalador
start DockerDesktopInstaller.exe

# Verifica la instalación desde la terminal
docker --version
docker info
```

DockerDesktopInstaller.exe es el instalador gráfico, después de ejecutarlo, sigue los pasos del asistente. Abre Docker Desktop y asegúrate de que el servicio esté corriendo; los comandos de Docker funcionarán solo si Docker Desktop está activo.



## macOS (Intel / Apple Silicon)
Al igual que en Windows, en macOS se usa Docker Desktop. Puedes descargarlo mediante curl o usar Homebrew para instalarlo:

```bash
# Descarga el instalador de Docker Desktop
curl -L -o Docker.dmg "https://desktop.docker.com/mac/stable/Docker.dmg"

# Monta y abre el instalador
open Docker.dmg

# Alternativamente, instala Docker Desktop vía Homebrew
brew install --cask docker

# Abre la aplicación Docker Desktop
open /Applications/Docker.app

# Verifica que Docker está instalado
docker --version
docker info
Nota: Docker Desktop debe estar abierto para que los comandos docker funcionen en la terminal.
```

<br>


# 📥 1. Descargar la imagen de SQL Server

Antes de ejecutar SQL Server en Docker, es importante entender dos conceptos clave: **imagen & contenedor**.

## ¿Qué es una imagen?
Una imagen es como una plantilla o un molde. Contiene todo lo necesario para ejecutar un software: el sistema operativo, las librerías, dependencias y la aplicación en sí. Piensa en una imagen como un archivo .iso o un instalador preconfigurado, pero optimizado para Docker.

Las imágenes son inmutables, es decir, no cambian; cada vez que inicias un contenedor desde esa imagen, Docker crea una copia lista para ejecutarse. En este ejemplo, usamos la imagen oficial de SQL Server 2022 para Linux, que Microsoft publica en el Microsoft Container Registry (MCR):
```bash
docker pull mcr.microsoft.com/mssql/server:2022-latest
```
Esto descarga la plantilla de SQL Server 2022 en tu máquina, pero todavía no está ejecutándose.

## ¿Qué es un contenedor?

Un contenedor es una instancia en ejecución de una imagen. Mientras que la imagen es solo un molde, el contenedor es el objeto real que funciona en tu máquina.

Cada contenedor tiene su propio sistema de archivos, procesos y red, pero compartiendo el kernel del sistema operativo con el host. Puedes crear, iniciar, detener o eliminar contenedores sin afectar la imagen original. Para crear y ejecutar un contenedor de SQL Server, usamos:
```bash
docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=TuPassword123!" -p 1433:1433 --name sqlserver -d mcr.microsoft.com/mssql/server:2022-latest
```

Explicación de cada parámetro:
| Parámetro                   | Propósito
|-----------------------------|---------------------------------
| `ACCEPT_EULA=Y`             | Acepta los términos de licencia de SQL Server.
| `SA_PASSWORD=TuPassword123!`| Define la contraseña del usuario administrador SA.
| `-p 1433:1433`              | Expone el puerto 1433 para conexiones externas.
| `--name sqlserver`          | Asigna un nombre al contenedor.
| `-d`                        | Ejecuta el contenedor en segundo plano (detached mode).


### 🔍 Verificar que SQL Server esté funcionando
Para comprobar que el contenedor está levantado, ejecuta:
```bash
docker ps

# La salida sería la siguiente:

CONTAINER ID   IMAGE                                         STATUS        PORTS                     NAMES
abcd1234       mcr.microsoft.com/mssql/server:2022-latest    Up 5 minutes  0.0.0.0:1433->1433/tcp    sqlserver

# Si el STATUS aparece como Up, significa que SQL Server está funcionando correctamente.
```

<br>

# 🖥️ 2. Conectarse desde Visual Studio Code

Para administrar **SQL Server** desde **Visual Studio Code (VS Code)**, necesitas instalar la **extensión oficial de SQL Server**. Esta extensión te permite:

- Conectarte a un servidor SQL (incluyendo contenedores Docker).
- Ejecutar consultas directamente desde VS Code.
- Navegar y explorar bases de datos, tablas y vistas.
- Administrar usuarios y permisos básicos.

Una vez instalada, VS Code pedirá los datos de conexión al motor SQL que esté corriendo en Docker.


## 🪪 Formulario de conexión
Cuando agregas una nueva conexión, VS Code muestra un formulario con los siguientes campos:

| Campo                | Qué ingresar       | Explicación |                                                     
|----------------------|--------------------|-------------------------------------------------------------------------------------|
| **Servidor**         | `localhost,1433`   | La dirección del servidor SQL. Si está en Docker, `localhost` apunta al contenedor. |
| **Usuario**          | `SA`               | Usuario administrador por defecto en SQL Server.                                    |
| **Contraseña**       | `TuPassword123!`   | Contraseña asignada al usuario SA al levantar el contenedor.                        |
| **Base de datos**    | `master` (opcional)| Base de datos inicial a la que conectarse. No es obligatorio.                       |
---
<br>

![SQL Server Functionality](<img/SQL Server Functionality.png>)

Al completar estos datos y conectarte, Visual Studio Code verificará la conexión y, si todo está correcto. Podrás ejecutar consultas, explorar bases de datos y administrar usuarios directamente desde el panel de SQL de VS Code. **¿Qué hacer si localhost no funciona?**
Algunas configuraciones de red en Docker pueden impedir que VS Code resuelva `localhost`. En este caso:

```bash
# Primero captura la IP interna del contenedor SQL Server
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' sqlserver

# Luego conéctate usando la IP obtenida en lugar de localhost, por ejemplo:
<IP_DEL_CONTENEDOR>,1433
```

<br>

# 💾 3. Persistencia de datos (opcional pero recomendable)

Los contenedores son temporales: si los eliminas, también se borrarán los datos. 

- `sqlserverdata` → Carpeta persistente creada por Docker

- `/var/opt/mssql` → Directorio interno donde SQL Server guarda bases de datos

Para mantenerlos, se usan volúmenes:

```bash
docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=TuPassword123!" \
-p 1433:1433 --name sqlserver -v sqlserverdata:/var/opt/mssql -d \
mcr.microsoft.com/mssql/server:2022-latest

# Así, aunque elimines el contenedor, los datos permanecerán.
```