# 📊 Tables for the project


| SHIP                  | Type          |
|-----------------------|---------------|
| `ship_id`             | INT           |
| `nickname`            | VARCHAR(200)  |
| `registration_number` | VARCHAR(200)  |
| `city`                | VARCHAR(200)  |
| `country`             | VARCHAR(200)  |
| `start_of_activity`   | DATE          |
| `capacity`            | INT           |
| `tonnage`             | DECIMAL(10,2) |
| `status`              | VARCHAR(50)   |


<hr>
<br>

| CREW_MEMBER              | Type          |
|--------------------------|---------------|
| `crew_id`                | INT           |
| `first_name`             | VARCHAR(100)  |
| `last_name`              | VARCHAR(100)  |
| `email`                  | VARCHAR(200)  |
| `birth_date`             | DATE          |
| `passport_number`        | VARCHAR(50)   |
| `address`                | VARCHAR(300)  |
| `city`                   | VARCHAR(100)  |
| `nationality`            | VARCHAR(100)  |
| `employment_start_date`  | DATE          |
| `employment_end_date`    | DATE          |
| `status`                 | VARCHAR(50)   |


<hr>
<br>

| POSITION       | Type          |
|----------------|---------------|
| `position_id`  | INT           |
| `type`         | VARCHAR(100)  |
| `description`  | VARCHAR(MAX)  |

<hr>
<br>

| ITINERARY       | Type          |
|-----------------|---------------|
| `itinerary_id`  | INT           |
| `name`          | VARCHAR(200)  |
| `description`   | VARCHAR(MAX)  |

<hr>
<br>

| HARBOR           | Type           |
|------------------|----------------|
| `harbor_id`      | INT            |
| `name`           | VARCHAR(200)   |
| `region`         | VARCHAR(100)   |
| `city`           | VARCHAR(100)   |
| `country`        | VARCHAR(100)   |
| `operation_type` | VARCHAR(10)    |
| `latitude`       | DECIMAL(9,6)   |
| `longitude`      | DECIMAL(9,6)   |
| `is_active`      | BIT            |

<hr>
<br>

| SHIPBOARD_STAFFING        | Type |
|---------------------------|------|
| `assignment_id`           | INT  |
| `ship_id`                 | INT  |
| `crew_id`                 | INT  |
| `position_id`             | INT  |
| `assignment_start_date`   | DATE |
| `assignment_end_date`     | DATE |


<hr>
<br>

| VOYAGE_HISTORY          | Type          |
|-------------------------|---------------|
| `voyage_id`             | INT           |
| `ship_id`               | INT           |
| `itinerary_id`          | INT           |
| `scheduled_start_date`  | DATE          |
| `scheduled_end_date`    | DATE          |
| `actual_start_date`     | DATE          |
| `actual_end_date`       | DATE          |
| `voyage_status`         | VARCHAR(50)   |

<hr>
<br>

| ARRIVAL_HISTORY        | Type      |
|------------------------|-----------|
| `arrival_id`           | INT       |
| `voyage_id`            | INT       |
| `harbor_id`            | INT       |
| `arrival_order`        | INT       |
| `arrival_datetime`     | DATETIME  |
| `departure_datetime`   | DATETIME  |