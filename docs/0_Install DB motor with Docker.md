# 🐋 💻 SQL Server en Docker  
Una guía completa para instalar, ejecutar y administrar SQL Server mediante contenedores. Docker permite ejecutar aplicaciones dentro de **entornos aislados, portables y fáciles de gestionar**, lo que lo convierte en una herramienta ideal para desarrolladores, testers y administradores de bases de datos. 
Con este flujo, puedes levantar entornos de desarrollo rápidamente, sin instalaciones pesadas y con total control sobre la base de datos.


## 📥 1. Descargar la imagen oficial de SQL Server
SQL Server para Linux está disponible como imagen oficial en Microsoft Container Registry. Una **imagen** es una plantilla preconfigurada que Docker utiliza para crear contenedores. Ejecuta:

```bash
docker pull mcr.microsoft.com/mssql/server:2022-latest
```
Con esto ya tendrás la versión más reciente de SQL Server 2022 lista para usarse.


## 📦 2. Crear un contenedor de SQL Server
Una vez descargada la imagen, es momento de crear un contenedor. Cada parámetro del comando tiene un propósito importante:

- **ACCEPT_EULA=Y** → Acepta los términos de licencia.  

- **SA_PASSWORD=TuPassword123!** → Contraseña del usuario administrador `SA`.  

- **-p 1433:1433** → Expone el puerto que usa SQL Server para conexiones externas.  

- **--name sqlserver** → Nombre del contenedor.  

- **-d** → Ejecuta en segundo plano.

Ejecuta:

```bash
docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=TuPassword123!" -p 1433:1433 --name sqlserver -d mcr.microsoft.com/mssql/server:2022-latest
```


## ✅ 3. Verificar que el contenedor esté corriendo

Comprueba el estado del contenedor con:

```bash
docker ps
```

Salida esperada:

```bash
CONTAINER ID   IMAGE                                         STATUS        PORTS                     NAMES
abcd1234       mcr.microsoft.com/mssql/server:2022-latest    Up 5 minutes  0.0.0.0:1433->1433/tcp    sqlserver
```
Si aparece como **Up**, SQL Server está funcionando correctamente.

<br>

## 🖥️ 4. Conectarse desde Visual Studio Code
Para administrar SQL Server desde VS Code necesitas instalar la **extensión oficial de SQL Server**. Esta te permitirá:

- Conectarte al contenedor  

- Explorar bases de datos  

- Crear y ejecutar consultas  

- Administrar usuarios y tablas


### 📌 Extensión SQL Server para VS Code  

![SQL Server Extension](<img/SQL Server Extension.png>)

Una vez instalada, VS Code solicitará los datos de conexión al motor SQL levantado en Docker.

### 📌 Formulario de conexión  

![SQL Server Functionality](<img/SQL Server Functionality.png>)

### Datos necesarios:
- **Servidor:** localhost,1433  
- **Usuario:** SA  
- **Contraseña:** *TuPassword123!*  
- **Base de datos (opcional):** master

### 📌 Conexión final en VS Code  
Una vez que VS Code se conecte correctamente, podrás interactuar con la base de datos desde tu proyecto o desde el panel SQL:

![SQL Server Functionality](<img/SQL Server in VS Code.png>)

### ⚠️ Qué hacer si `localhost` no funciona
Algunas configuraciones de redes en Docker pueden impedir que VS Code resuelva `localhost`.  
En ese caso, obtén la IP interna del contenedor:

```bash
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' sqlserver
```

Luego conéctate utilizando:

```bash
<IP_DEL_CONTENEDOR>,1433
```
<br>


## 💾 5. Persistencia de datos (Opcional pero recomendado)

Los contenedores Docker son **temporales** por diseño.  
Si eliminas el contenedor, también borrarás la base de datos… *a menos que uses un volumen*.

Un volumen permite almacenar datos fuera del contenedor.

Ejecuta:

```bash
docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=TuPassword123!"  -p 1433:1433 --name sqlserver -v sqlserverdata:/var/opt/mssql -d mcr.microsoft.com/mssql/server:2022-latest
```

### ¿Qué hace este volumen?
- **sqlserverdata** → Carpeta persistente creada por Docker.  
- **/var/opt/mssql** → Directorio interno donde SQL Server guarda todas las bases.  

Así, incluso si eliminas y recreas el contenedor, la información seguirá intacta.