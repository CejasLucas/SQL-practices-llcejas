# 📋 Práctica de componentes [Query SQL] 

Este documento compila entre 10 y 20 enunciados por cada construcción sintáctica de SQL, destinados a ejercitar operaciones de consulta sobre el modelo de datos provisto.
Para consultar la secuencia lógica, la jerarquía y la estructura formal de una sentencia SQL completa, puede accederse al siguiente recurso: [Estructura de una Query SQL](<Basic theory about SQL.md>)

<br>

## 🟦 SELECT 
1. Obtener los nombres de todos los barcos registrados.  
2. Mostrar el nombre y la nacionalidad de cada tripulante.  
3. Consultar el número de pasaporte y la ciudad natal de cada tripulante.  
4. Listar las regiones de todos los puertos.  
5. Mostrar la descripción de todos los itinerarios.  
6. Obtener los IDs de todos los barcos asignados a itinerarios.  
7. Mostrar el tipo de posición de cada cargo dentro del barco.  
8. Consultar las fechas de inicio de actividad de cada barco.  
9. Mostrar los emails de todos los tripulantes.  
10. Listar los países donde existen puertos registrados.  
11. Mostrar la ciudad de origen y nacionalidad de los barcos.  
12. Obtener los nombres de los puertos de tipo “NIGHT”.  
13. Mostrar los nombres y apellidos de todos los tripulantes.  
14. Consultar las fechas de nacimiento de los tripulantes.  
15. Obtener todos los números de registro de los barcos.  
16. Mostrar todas las ciudades asociadas a puertos.  
17. Listar los idiomas (nacionalidades) presentes en los barcos.  
18. Obtener los IDs de los miembros de la tripulación asignados a barcos.  
19. Mostrar el nombre o apodo de los barcos ordenados alfabéticamente.  
20. Listar todos los itinerarios activos ordenados por fecha de inicio.

<br>

## 🟦 SELECT AS 
1. Mostrar el nombre del barco con el alias `nombre_barco`.  
2. Renombrar la columna `email` como `correo_tripulante`.  
3. Mostrar `position_type` como `rol_en_barco`.  
4. Mostrar el país del puerto como `pais_puerto`.  
5. Renombrar `voyage_start_date` como `inicio_viaje`.  
6. Renombrar `voyage_end_date` como `fin_viaje`.  
7. Mostrar `first_name` como `nombre` y `last_name` como `apellido`.  
8. Renombrar `registration_number` como `matrícula`.  
9. Mostrar `origin_city` como `ciudad_origen_barco`.  
10. Renombrar `nationality` del tripulante como `pais_tripulante`.  
11. Mostrar `assignment_start_date` como `inicio_asignación`.  
12. Renombrar `assignment_end_date` como `fin_asignación`.

<br>

## 🟦 SELECT DISTINCT 
1. Obtener las nacionalidades únicas de los tripulantes.  
2. Listar los países distintos donde existen puertos.  
3. Mostrar los nombres únicos de ciudades donde hay puertos.  
4. Obtener los distintos tipos de posiciones en el sistema.  
5. Listar los diferentes tipos de puertos registrados (DAY/NIGHT).  
6. Obtener las ciudades de origen únicas de los barcos.  
7. Listar las nacionalidades únicas de los barcos.  
8. Mostrar los correos electrónicos únicos registrados.  
9. Obtener los diferentes años de inicio de actividad de los barcos.  
10. Listar las regiones únicas de los puertos.  
11. Mostrar los tipos de itinerarios que han sido asignados a barcos.  
12. Obtener las diferentes ciudades natales de los tripulantes.  
13. Listar los países donde existen puertos en itinerarios.  
14. Mostrar las distintas fechas de inicio de viaje de itinerarios.  
15. Obtener diferentes combinaciones de país–tipo de puerto.


<br>

## 🟥 JOIN ( INNER JOIN ) 
1. Obtener los barcos junto con sus tripulantes asignados.  
2. Listar los tripulantes con su posición dentro de un barco.  
3. Ver los barcos y los itinerarios en los que participan.  
4. Mostrar los puertos de cada itinerario.  
5. Consultar las asignaciones activas junto con nombres de barcos.  
6. Relacionar tripulantes con itinerarios en los que trabajaron.  
7. Mostrar los puertos visitados por cada barco.  
8. Listar posiciones solo si están asignadas a tripulantes.  
9. Mostrar itinerarios solo si tienen puertos.  
10. Ver tripulantes que tienen asignaciones registradas.  
11. Listar barcos que han participado en itinerarios.  
12. Obtener puertos que están en itinerarios que tienen barcos asignados.

<br>

## 🟥 JOIN ( LEFT JOIN ) 
1. Listar todos los barcos, incluso los que no tienen tripulantes.  
2. Mostrar puertos, incluso los no utilizados en itinerarios.  
3. Mostrar posiciones, aunque no estén asignadas a nadie.  
4. Ver tripulantes, incluso si no tienen asignaciones.  
5. Mostrar itinerarios, incluso si no tienen puertos.  
6. Listar barcos y sus itinerarios, aunque algunos no tengan.  
7. Mostrar tripulantes y fechas de asignación, aunque estén vacías.  
8. Barcos y el puerto donde empezaron su viaje, incluso sin definir.  
9. Tripulantes y la ciudad donde están trabajando, aunque no tengan asignación.  
10. Puertos y barcos que los visitan, aunque no existan viajes registrados.

<br>

## 🟥 JOIN ( RIGHT JOIN )
1. Mostrar todos los tripulantes aunque no estén asignados a barcos.  
2. Ver todas las posiciones aunque no tengan nadie asignado.  
3. Listar todos los puertos, aunque no estén en itinerarios.  
4. Mostrar todos los itinerarios, aunque no tengan barcos.  
5. Ver todos los barcos aunque no tengan viajes definidos.  
6. Mostrar todos los tripulantes y los barcos donde podrían trabajar.  
7. Ver todos los puertos junto con itinerarios donde aparecen, incluso sin asociación.  
8. Mostrar todas las posiciones con los barcos que las utilizan.  
9. Itinerarios con barcos, incluso si no están asignados.  
10. Puertos con barcos que los visitan, aunque no existan visitas.

<br>

## 🟥 JOIN ( FULL JOIN )
1. Listar barcos y tripulantes existan o no asignaciones.  
2. Mostrar puertos e itinerarios aunque no estén relacionados.  
3. Mostrar barcos e itinerarios aunque no coincidan.  
4. Ver tripulantes y posiciones aunque no haya relaciones.  
5. Mostrar puertos y barcos aunque no haya viajes registrados.  
6. Listar posiciones y asignaciones aunque no existan vínculos.  
7. Mostrar itinerarios y puertos aunque no haya visitas.  
8. Barcos e itinerarios sin importar si hay participación.  
9. Tripulantes y asignaciones aunque no haya registros.  
10. Puertos y barcos sin viajes en común.

<br>

## 🟥 JOIN ( ON ) 
1. Relacionar barcos con asignaciones por `ship_id`.  
2. Relacionar tripulantes con asignaciones por `crew_id`.  
3. Relacionar posiciones con asignaciones por `position_id`.  
4. Relacionar itinerarios con barcos en itinerarios.  
5. Relacionar itinerarios con puertos.  
6. Unir barcos con puertos mediante itinerarios.  
7. Unir tripulantes con itinerarios vía asignaciones.  
8. Relacionar puertos con barcos según viajes.  
9. Relacionar itinerarios con fechas de viaje.  
10. Relacionar puertos con regiones mediante itinerarios.

<br>

## 🟪 WHERE ( = )
1. Obtener barcos cuya nacionalidad sea “Chile”.  
2. Tripulantes cuyo país sea “España”.  
3. Puertos ubicados en “Italia”.  
4. Posiciones con tipo “Capitán”.  
5. Itinerarios con descripción igual a “Mediterráneo Norte”.  
6. Puertos con tipo “DAY”.  
7. Tripulantes cuya ciudad natal sea “Lima”.  
8. Barcos cuyo número de registro sea uno específico.  
9. Tripulantes con un email concreto.  
10. Itinerarios con fecha de inicio igual a 2024-01-01.

<br>

## 🟪 WHERE ( <> )
1. Barcos cuya nacionalidad no sea “Argentina”.  
2. Puertos cuyo país no sea “Brasil”.  
3. Tripulantes cuya ciudad natal no sea “Madrid”.  
4. Itinerarios que no tengan descripción vacía.  
5. Puertos no pertenecientes al tipo “NIGHT”.  
6. Tripulantes cuyo país no sea “Perú”.  
7. Barcos cuya ciudad origen no sea “Barcelona”.  
8. Puertos no ubicados en la región “Norte”.  
9. Barcos cuyo nombre no coincida con uno específico.  
10. Tripulantes cuyo país no sea “Portugal”.

<br>

## 🟪 WHERE ( > / < / >= / <= )
1. Barcos creados después de 2010.  
2. Tripulantes nacidos antes de 1980.  
3. Asignaciones que comenzaron después de 2020.  
4. Viajes que terminaron antes de 2022.  
5. Puertos en ciudades alfabéticamente > “M”.  
6. Barcos con ID mayor a 50.  
7. Puertos con ID menor a 200.  
8. Itinerarios con ID mayor o igual a 10.  
9. Tripulantes con fecha de nacimiento <= 1995.  
10. Barcos activos antes de 2000.  
11. Puertos con región < “Norte”.  
12. Itinerarios con duración mayor a 10 días.  
13. Asignaciones de más de 30 días.  
14. Barcos registrados antes de 2015.  
15. Tripulantes contratados después de 2018.

<br>

## 🟪 WHERE ( IN )
1. Puertos en países (“España”, “Italia”, “Francia”).  
2. Tripulantes cuyo origen esté entre varias ciudades.  
3. Barcos cuya nacionalidad esté en una lista.  
4. Puertos de varias regiones.  
5. Itinerarios específicos según ID.  
6. Tripulantes con emails corporativos específicos.  
7. Puertos en ciudades seleccionadas.  
8. Regiones portuarias en una lista.  
9. Barcos cuyos nombres estén en una lista determinada.  
10. Itinerarios por múltiples IDs.

<br>

## 🟪 WHERE ( LIKE )
1. Buscar puertos cuyo nombre comience con “San%”.  
2. Buscar tripulantes con apellido que empiece en “G%”.  
3. Barcos con nombre que contenga “Sea%”.  
4. Puertos cuyo país termine con “land”.  
5. Emails que contienen “@gmail”.  
6. Descripciones de itinerarios con la palabra “Caribe”.  
7. Posiciones con descripción que incluya “responsable”.  
8. Ciudades que comienzan con “New”.  
9. Nacionalidades que terminen con “an”.  
10. Barcos cuyo apodo incluya “Star”.  
11. Puertos con región que incluya “South”.  
12. Tripulantes con nombre que tenga doble vocal.

<br>

## 🟪 WHERE ( BETWEEN )
1. Barcos con actividad entre 2010 y 2020.  
2. Tripulantes nacidos entre 1980 y 1995.  
3. Viajes con duración entre 5 y 15 días.  
4. Puertos creados entre dos IDs.  
5. Asignaciones entre fechas definidas.  
6. Itinerarios entre dos rangos de ID.  
7. Barcos registrados en un rango de fechas.  
8. Tripulantes contratados entre dos fechas.  
9. Fechas de viaje entre dos periodos.  
10. Regiones alfabéticamente entre A y M.

<br>

## 🟪 WHERE ( AND / OR / NOT )
1. Tripulantes españoles **y** argentinos.  
2. Puertos en Italia **o** Francia.  
3. Barcos cuya ciudad origen no sea “Roma”.  
4. Tripulantes de España y nacidos después de 1990.  
5. Puertos de tipo NIGHT o DAY.  
6. Itinerarios que no sean mediterráneos.  
7. Barcos italianos y actividad posterior a 2015.  
8. Tripulantes cuya ciudad sea Madrid o Barcelona.  
9. Puertos cuyo nombre contenga “Port” y país Francia.  
10. Tripulantes no nacidos antes de 1980.  
11. Barcos en ciudades españolas o portuguesas.  
12. Puertos que no estén en regiones del norte.  
13. Itinerarios con puertos españoles o italianos.  
14. Tripulantes jóvenes y contratados recientemente.  
15. Barcos cuyo nombre no comience con “A”.

<br>

## 🟪 WHERE ( IS NULL / IS NOT NULL )
1. Tripulantes sin fecha de fin de asignación.  
2. Barcos cuyo número de registro no esté vacío.  
3. Asignaciones con fecha de fin registrada.  
4. Puertos cuyo tipo no sea nulo.  
5. Itinerarios sin descripción.  
6. Posiciones sin descripción establecida.  
7. Barcos sin nacionalidad registrada.  
8. Tripulantes sin email.  
9. Puertos sin región asignada.  
10. Asignaciones sin fecha de inicio.  
11. Itinerarios sin barcos asignados.  
12. Barcos con ciudad origen definida.

<br>

## ⬛ GROUP BY
1. Agrupar tripulantes por nacionalidad.  
2. Agrupar puertos por país.  
3. Agrupar barcos por ciudad de origen.  
4. Puertos por región.  
5. Tripulantes por ciudad natal.  
6. Barcos por nacionalidad.  
7. Itinerarios por cantidad de puertos.  
8. Tripulantes por año de nacimiento.  
9. Barcos por año de inicio de actividad.  
10. Asignaciones por posición.


## ⚫ COUNT() 
1. Contar cuántos barcos existen en el sistema.  
2. Contar cuántos tripulantes están registrados.  
3. Contar cuántos puertos están asociados a itinerarios.  
4. Contar cuántos itinerarios existen.  
5. Contar cuántos tripulantes tienen nacionalidad española.  
6. Contar la cantidad de puertos de tipo “DAY”.  
7. Contar cuántos tripulantes tiene cada barco.  
8. Contar cuántas posiciones existen.  
9. Contar cuántas asignaciones están activas.  
10. Contar cuántos barcos se crearon después de 2015.  
11. Contar cuántos puertos están en Italia.  
12. Contar cuántos itinerarios tienen más de 3 puertos.  
13. Contar cuántos tripulantes han trabajado en más de un barco.  
14. Contar cuántos puertos de un país participan en itinerarios.  
15. Contar cuántos barcos de nacionalidad argentina existen.

<br>

## ⚫ SUM() 
1. Sumar la cantidad total de días de viaje de cada barco.
2. Sumar los días totales que cada tripulante ha estado asignado a barcos.
3. Sumar los días de asignaciones activas de todos los tripulantes.
4. Sumar la cantidad total de días de viajes finalizados en 2024.
5. Sumar la duración total de todos los itinerarios por barco.
6. Sumar los días acumulados que los tripulantes han pasado en barcos de nacionalidad chilena.
7. Sumar la cantidad total de días que los barcos han pasado en puertos del tipo “NIGHT”.
8. Sumar los días totales de viajes de barcos registrados en Sudafrica.
9. Sumar la duración total de todos los itinerarios de barcos que han participado en más de un itinerario.
10. Sumar los días totales de asignaciones de tripulantes en una posición específica.

<br>

## ⚫ AVG() 
1. Calcular la edad promedio de los tripulantes.  
2. Obtener el promedio de duración de los viajes.  
3. Promedio de puertos por itinerario.  
4. Promedio de años de actividad de los barcos.  
5. Edad promedio por nacionalidad de tripulantes.  
6. Promedio de duración de asignaciones de tripulantes.  
7. Promedio de barcos por itinerario.  
8. Promedio de días de trabajo por tripulante.  
9. Edad promedio de los tripulantes de nacionalidad argentina.  
10. Tiempo promedio entre inicio y fin de viaje en itinerarios.  
11. Promedio de puertos visitados por barcos argentinos.  
12. Promedio de tripulantes por barco.

<br>

## ⚫ MAX() 
1. Obtener la fecha más reciente de inicio de actividades de los barcos.  
2. Obtener la fecha más avanzada de nacimiento de un tripulante.  
3. Fecha de fin de itinerario más lejana.  
4. Máximo número de puertos en un itinerario.  
5. Mayor duración de un viaje registrado.  
6. Última fecha de inicio de asignación.  
7. Puerto más al norte (alfabéticamente).  
8. Barco con el nombre más largo.  
9. Mayor número de tripulantes en un barco.  
10. Itinerario con más barcos asignados.

<br>

## ⚫ MIN()
1. Fecha más antigua de creación de barco.  
2. Fecha de nacimiento más antigua de un tripulante.  
3. Viaje más corto registrado.  
4. Primer itinerario creado.  
5. Puerto alfabéticamente más pequeño.  
6. Primer tripulante en ser contratado.  
7. Primer día de cualquier viaje registrado.  
8. Mínimo número de puertos en un itinerario.  
9. Itinerario con menor duración.  
10. Asignación con menor duración de trabajo.

<br>

## 🟣 HAVING 
1. Nacionalidades con más de 5 tripulantes.  
2. Barcos con más de 10 asignaciones.  
3. Puertos utilizados en más de 3 itinerarios.  
4. Itinerarios con más de 5 puertos.  
5. Posiciones usadas más de 2 veces.  
6. Tripulantes que trabajaron en más de 1 barco.  
7. Barcos con actividad superior a 10 años.  
8. Puertos de países con más de 4 registros.  
9. Itinerarios con más de 20 días de duración.  
10. Barcos con más de 3 viajes.

<br>

## ⬜  ORDER BY / ASC / DESC 
1. Ordenar barcos por nombre ascendente.  
2. Ordenar tripulantes por apellido descendente.  
3. Puertos por país ascendente.  
4. Tripulantes por fecha de nacimiento ascendente.  
5. Itinerarios por descripción ascendente.  
6. Barcos por fecha de inicio de actividad descendente.  
7. Puertos por ciudad descendente.  
8. Asignaciones por fecha de inicio ascendente.  
9. Itinerarios por fecha de fin ascendente.  
10. Puertos por región descendente.  
11. Barcos por número de registro ascendente.  
12. Tripulantes por nacionalidad ascendente.

<br>

## ◽ LIMIT
1. Mostrar solo los primeros 5 barcos.  
2. Mostrar los primeros 10 tripulantes.  
3. Mostrar los 3 puertos más antiguos.  
4. Mostrar los primeros 20 itinerarios.  
5. Mostrar los 2 primeros puertos italianos.  
6. Mostrar solo 1 resultado.  
7. Obtener los 15 primeros emails.  
8. Mostrar los primeros 7 barcos chilenos.  
9. Obtener los primeros 10 puertos por país.  
10. Mostrar los primeros 4 itinerarios.

<br>

## ◾ OFFSET
1. Saltar los primeros 10 tripulantes y mostrar los siguientes.  
2. Saltar los primeros 5 barcos.  
3. Saltar 20 puertos y listar los siguientes.  
4. Saltar los primeros 3 itinerarios.  
5. Saltar los primeros 2 viajes y mostrar del 3º al 10º.  
6. Saltar 15 tripulantes y ver los restantes.  
7. Saltar 7 puertos italianos.  
8. Saltar los primeros 30 emails.  
9. Saltar 12 posiciones.  
10. Saltar los primeros 25 barcos registrados.