# 📊 Tables for the project

| Column SHIP            | Description 
|------------------------|-------------
| `ship_id`              | (PK)  
| `name_or_nickname`     | VARCHAR(200)  
| `registration_number`  | VARCHAR(200) (unique)
| `start_of_activity`    | DATE
| `origin_city`          | VARCHAR(200)
| `nationality`          | VARCHAR(200)

<hr>
<br>

| Column CREW MEMBER     | Description
|------------------------|------------
| `crew_id`              | (PK)
| `first_name`           | VARCHAR(100)
| `last_name`            | VARCHAR(100)
| `email`                | VARCHAR(200) (unique)
| `passport_number`      | VARCHAR(50) (unique)
| `home_city`            | VARCHAR(100)
| `nationality`          | VARCHAR(100)
| `birth_date`           | DATE
| `employment_start_date`| DATE

<hr>
<br>

| Column POSITION        | Description
|------------------------|------------
| `position_id`          | (PK)
| `position_type`        | VARCHAR(100)
| `position_description` | TEXT

<hr>
<br>

| Column HARBOR            | Description
|------------------------|------------
| `harbor_id`              | (PK)
| `name`                 | VARCHAR(200)
| `region`               | VARCHAR(100)
| `city`                 | VARCHAR(100)
| `country`              | VARCHAR(100)
| `port_type`            | ENUM('DAY','NIGHT')

<hr>
<br>

| Column ITINERARY      | Description
|------------------------|------------
| `itinerary_id`         | (PK)
| `description`          | TEXT

<hr>
<br>


| Column CREW ASSIGNMENTS TO SHIPS        | Description
|-----------------------------------------|------------
| `ship_id`                               | (FK) REFERENCES SHIP(ship_id)
| `crew_id`                               | (FK) REFERENCES CREW_MEMBER(crew_id)
| `position_id`                           | (FK) REFERENCES POSITION(position_id)
| `assignment_start_date`                 | DATE
| `assignment_end_date`                   | DATE

<hr>
<br>

| Column SHIPS IN ITINERARIES  | Description
|------------------------------|------------
| `id`                         | (PK)
| `ship_id`                    | (FK) REFERENCES SHIP(ship_id)
| `itinerary_id`               | (FK) REFERENCES ITINERARY(itinerary_id)
| `voyage_start_date`          | DATE
| `voyage_end_date`            | DATE

<hr>
<br>

| Column HARBOR IN ITINERARY               | Description
|---------------------------------|------------
| `id`                            | (PK)
| `harbor_id`                       | (FK) REFERENCES HARBOR(harbor_id)
| `itinerary_id`                  | (FK) REFERENCES ITINERARY(itinerary_id)