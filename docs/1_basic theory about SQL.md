# 🌐 Structured Query Language *(SQL)*
Es un lenguaje de programación diseñado para gestionar y manipular bases de datos relacionales. Se utiliza ampliamente en sistemas de gestión de bases de datos ***DBMS*** como PostgreSQL, MySQL, Oracle Database, SQL Server y SQLite, entre otros. 

No solo sirve para consultar información, sino que también permite definir, manipular, controlar y asegurar los datos y los objetos que los almacenan. Para ello, SQL se divide en cuatro sublenguajes principales, cada uno con un propósito específico:

###  1. Data Definition Language *(DDL)*
Se usa para **definir o modificar la estructura** de los objetos de la base de datos: tablas, columnas, vistas, índices, etc.

| Comando    | Descripción 
|------------|-----------------------------------------------------------------
| `CREATE`   | Crea objetos nuevos (tabla, vista, base de datos, etc.) 
| `ALTER`    | Modifica la estructura de un objeto existente 
| `DROP`     | Elimina un objeto (tabla, vista, etc.) 
| `TRUNCATE` | Borra todos los datos de una tabla, pero mantiene su estructura 
<br>


### 2. Data Manipulation Language *(DML)*
Se usa para **trabajar con los datos** dentro de las tablas: insertar, consultar, modificar o eliminar registros.
Esto es lo que normalmente haces día a día con la información.

| Comando    | Descripción 
|------------|----------------------------
| `INSERT`   | Inserta nuevos registros 
| `SELECT`   | Consulta datos 
| `UPDATE`   | Actualiza datos existentes 
| `DELETE`   | Elimina datos 
<br>


### 3. Data Control Language *(DCL)*
Se usa para **gestionar los permisos y accesos** de los usuarios dentro de la base de datos.

| Comando   | Descripción 
|-----------|------------------------------------
| `GRANT`   | Concede permisos a un usuario
| `REVOKE`  | Revoca (quita) permisos a un usuario
<br>


### 4. Transaction Control Language *(TCL)*
Se usa para **manejar transacciones**, es decir, grupos de operaciones que deben ejecutarse todas o revertirse si ocurre un error.

| Comando	    | Descripción 
|---------------|----------------------------------------------------
| `COMMIT`	    | Guarda los cambios definitivamente
| `ROLLBACK`	| Revierte los cambios si hay un error
| `SAVEPOINT`	| Crea un punto de guardado dentro de una transacción
<br>



# 🗄️ Estructura de una Query en SQL Server
Las consultas SQL deben seguir un orden específico porque el motor de base de datos interpreta y ejecuta cada cláusula en una secuencia lógica. Esto asegura que cada parte de la consulta tenga los datos necesarios generados por la anterior.

### 🔗 Esquema de una consulta (Orden Sintáctico)  
 El orden que debes seguir al escribir una consulta SQL sera la siguiente.

```sql
    SELECT 
        DISTINCT
        AS ('alias')
        COUNT(), SUM(), AVG(), MAX(), MIN()
    FROM 
        'TableName'
    JOIN 
        INNER JOIN
        LEFT JOIN
        RIGHT JOIN
        FULL JOIN
        ON ('Condition')
    WHERE 
        =  
        > 
        < 
        >= 
        <=
        <> 
        IN
        LIKE
        BETWEEN
        AND / OR / NOT
        IS NULL / IS NOT NULL
    GROUP BY 
        'Columns'
    HAVING 
        'Condition on aggregations' (e.g., HAVING COUNT(*) > 5)
    ORDER BY 
        'Columns'
        ASC
        DESC
    LIMIT 
        'Number of rows to return'
    OFFSET 
        'Number of rows to skip'
```

### 🔩 Ejecución interna de una consulta (Orden Lógico)
El motor SQL procesa las cláusulas en un orden diferente al que se escriben. Aunque SELECT aparece primero en el código, no es lo primero que se ejecuta; está al inicio solo por la gramática del lenguaje.

- **FROM / JOIN** → Se seleccionan las tablas y se combinan los datos.

-  **WHERE** → Se filtran filas antes de agrupar.

- **GROUP BY** → Se agrupan las filas según columnas.

- **HAVING** → Se filtran los grupos resultantes.

- **SELECT** → Se eligen las columnas o agregaciones a mostrar.

- **DISTINCT** → Se eliminan duplicados si se solicita.

- **ORDER BY** → Se ordenan los resultados.

- **LIMIT / OFFSET** → Se limita la cantidad de filas mostradas.

Cada cláusula necesita que la anterior ya haya generado algo sobre lo que trabajar. Por eso no puedes, por ejemplo, usar un alias definido en SELECT dentro del WHERE, ya que el WHERE se ejecuta antes del SELECT.

<br>