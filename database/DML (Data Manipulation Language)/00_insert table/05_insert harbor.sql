USE MaritimeSystemDB; GO 

SELECT name AS Tabla, create_date AS FechaCreacion FROM sys.tables ORDER BY name;

INSERT INTO HARBOR 
(name, region, city, country, operation_type, latitude, longitude) VALUES

('Port of Buenos Aires', 'SurOeste', 'Buenos Aires', 'Argentina', 'DAY', -34.603684, -58.381559),
('Port of Valparaiso', 'SurOeste', 'Valparaiso', 'Chile', 'NIGHT', -33.047238, -71.612688),
('Port of Miami', 'NorOeste', 'Miami', 'United States', 'DAY', 25.761681, -80.191788),
('Port of Rotterdam', 'NorEste', 'Rotterdam', 'Netherlands', 'NIGHT', 51.924420, 4.477733),
('Port of Barcelona', 'NorEste', 'Barcelona', 'Spain', 'DAY', 41.385064, 2.173404),
('Port of Yokohama', 'NorEste', 'Yokohama', 'Japan', 'NIGHT', 35.443707, 139.638031),
('Port of Hamburg', 'NorEste', 'Hamburg', 'Germany', 'DAY', 53.551085, 9.993682),
('Port of Santos', 'SurOeste', 'Santos', 'Brazil', 'NIGHT', -23.960833, -46.333611),
('Port of Vancouver', 'NorOeste', 'Vancouver', 'Canada', 'DAY', 49.282729, -123.120738),
('Port of Cape Town', 'SurEste', 'Cape Town', 'South Africa', 'NIGHT', -33.924869, 18.424055),
('Port of Melbourne', 'SurEste', 'Melbourne', 'Australia', 'DAY', -37.813629, 144.963058),
('Port of Singapore', 'NorEste', 'Singapore', 'Singapore', 'NIGHT', 1.352083, 103.819836),
('Port of Naples', 'NorEste', 'Naples', 'Italy', 'DAY', 40.851798, 14.268120),
('Port of Marseille', 'NorEste', 'Marseille', 'France', 'NIGHT', 43.296482, 5.369780),
('Port of Doha', 'NorEste', 'Doha', 'Qatar', 'DAY', 25.285447, 51.531040),
('Port of Dubai', 'NorEste', 'Dubai', 'United Arab Emirates', 'NIGHT', 25.204849, 55.270783),
('Port of Mumbai', 'NorEste', 'Mumbai', 'India', 'DAY', 19.076090, 72.877426),
('Port of Dublin', 'NorOeste', 'Dublin', 'Ireland', 'NIGHT', 53.349805, -6.260310),
('Port of Helsinki', 'NorEste', 'Helsinki', 'Finland', 'DAY', 60.169857, 24.938379),
('Port of Casablanca', 'NorOeste', 'Casablanca', 'Morocco', 'NIGHT', 33.573110, -7.589843),
('Port of New York', 'NorOeste', 'New York', 'United States', 'DAY', 40.712776, -74.005974),
('Port of Los Angeles', 'NorOeste', 'Los Angeles', 'United States', 'NIGHT', 34.052235, -118.243683),
('Port of Antwerp', 'NorEste', 'Antwerp', 'Belgium', 'DAY', 51.219448, 4.402464),
('Port of Genoa', 'NorEste', 'Genoa', 'Italy', 'NIGHT', 44.405650, 8.946256),
('Port of Le Havre', 'NorEste', 'Le Havre', 'France', 'DAY', 49.494370, 0.107929),
('Port of Manila', 'NorEste', 'Manila', 'Philippines', 'NIGHT', 14.599512, 120.984222),
('Port of Busan', 'NorEste', 'Busan', 'South Korea', 'DAY', 35.179554, 129.075642),
('Port of Shanghai', 'NorEste', 'Shanghai', 'China', 'NIGHT', 31.230391, 121.473701),
('Port of Hong Kong', 'NorEste', 'Hong Kong', 'China', 'DAY', 22.319303, 114.169361),
('Port of Antwerp-Bruges', 'NorEste', 'Zeebrugge', 'Belgium', 'NIGHT', 51.331890, 3.207550),
('Port of San Juan', 'NorOeste', 'San Juan', 'United States', 'DAY', 18.465539, -66.105736),
('Port of Guayaquil', 'SurOeste', 'Guayaquil', 'Ecuador', 'NIGHT', -2.170998, -79.922356),
('Port of Callao', 'SurOeste', 'Callao', 'Peru', 'DAY', -12.056590, -77.118141),
('Port of Montevideo', 'SurOeste', 'Montevideo', 'Uruguay', 'NIGHT', -34.901112, -56.164532),
('Port of Tallinn', 'NorEste', 'Tallinn', 'Estonia', 'DAY', 59.437000, 24.753530),
('Port of Riga', 'NorEste', 'Riga', 'Latvia', 'NIGHT', 56.949649, 24.105186),
('Port of Oslo', 'NorEste', 'Oslo', 'Norway', 'DAY', 59.913869, 10.752245),
('Port of Gothenburg', 'NorEste', 'Gothenburg', 'Sweden', 'NIGHT', 57.708870, 11.974560),
('Port of Alexandria', 'NorEste', 'Alexandria', 'Egypt', 'DAY', 31.200092, 29.918739),
('Port of Izmir', 'NorEste', 'Izmir', 'Turkey', 'NIGHT', 38.423733, 27.142826);

SELECT * FROM HARBOR;