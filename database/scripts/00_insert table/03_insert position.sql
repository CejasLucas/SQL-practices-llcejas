USE MaritimeLogisticsDB; GO 

SELECT name AS Tabla, create_date AS FechaCreacion FROM sys.tables ORDER BY name;

INSERT INTO POSITION (position_type, position_description) VALUES
('Captain', 'Responsible for the overall operation of the ship and crew safety.'),
('First Officer', 'Assists the captain and supervises navigation duties.'),
('Chief Engineer', 'In charge of the engine room operations and technical maintenance.'),
('Deck Officer', 'Supervises deck operations, maneuvers, and equipment maintenance.'),
('Communications Officer', 'Manages communication systems and navigational alerts.'),
('Helmsman', 'Steers the ship following officers’ commands.'),
('General Seaman', 'Performs maintenance, maneuvers, and general support tasks.'),
('Boatswain', 'Leads deck personnel and coordinates operational tasks.'),
('Cook', 'Responsible for preparing meals for the crew.'),
('Marine Mechanic', 'Performs mechanical maintenance and repairs in the engine room.');

SELECT * FROM POSITION;