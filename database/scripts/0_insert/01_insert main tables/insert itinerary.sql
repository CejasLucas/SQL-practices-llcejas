USE MaritimeLogisticsDB; GO 

SELECT name AS Tabla, create_date AS FechaCreacion FROM sys.tables ORDER BY name;

INSERT INTO ITINERARY (description) VALUES
('Commercial route from Shenzhen to Los Angeles transporting electronics and consumer goods.'),
('Cargo route from Hamburg to New York focused on machinery and industrial equipment.'),
('South American trade route from Buenos Aires to Santos carrying agricultural products.'),
('Logistics route from Rotterdam to Singapore transporting mixed containers of technology and textiles.'),
('Freight route from Shanghai to Hamburg with electronics and household appliances.'),
('Commercial shipping line from Dubai to Mumbai transporting cleaning products and chemicals.'),
('Cargo itinerary from Valparaiso to Callao focused on packaged food and beverages.'),
('Atlantic trade route from Cape Town to Rotterdam with raw materials and manufactured goods.'),
('Pacific cargo line from Vancouver to Yokohama transporting timber and paper products.'),
('Commercial route from Santos to Miami with mixed merchandise and electronics.'),
('Freight itinerary from Genoa to Alexandria transporting cleaning supplies and detergents.'),
('Cargo shipping line from Singapore to Sydney with technology and industrial parts.'),
('South Atlantic trade route from Montevideo to Lisbon carrying frozen food and textiles.'),
('Commercial route from Casablanca to Marseille transporting household goods and cleaning products.'),
('Cargo itinerary from Helsinki to Gdansk with machinery and construction materials.'),
('Freight route from Durban to Dubai transporting chemicals and packaged consumer goods.'),
('Commercial shipping line from Dublin to New York focused on pharmaceuticals and cleaning products.'),
('Cargo route from Saint Petersburg to Rotterdam transporting electronics and industrial machinery.'),
('South American logistics route from Guayaquil to Los Angeles with agricultural exports and cleaning products.'),
('Commercial itinerary from Manila to Hong Kong transporting textiles, electronics, and packaged goods.');