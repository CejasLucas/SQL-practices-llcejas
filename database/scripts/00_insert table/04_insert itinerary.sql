USE MaritimeSystemDB; GO 

SELECT name AS Tabla, create_date AS FechaCreacion FROM sys.tables ORDER BY name;

INSERT INTO ITINERARY (name, description) VALUES
('Shenzhen – Los Angeles Commercial Route', 'Commercial route from Shenzhen to Los Angeles transporting electronics and consumer goods.'),
('Hamburg – New York Industrial Cargo Route', 'Cargo route from Hamburg to New York focused on machinery and industrial equipment.'),
('Buenos Aires – Santos Agricultural Trade Route', 'South American trade route from Buenos Aires to Santos carrying agricultural products.'),
('Rotterdam – Singapore Global Logistics Route', 'Logistics route from Rotterdam to Singapore transporting mixed containers of technology and textiles.'),
('Shanghai – Hamburg Electronics Freight Route', 'Freight route from Shanghai to Hamburg with electronics and household appliances.'),
('Dubai – Mumbai Chemical & Consumer Goods Route', 'Commercial shipping line from Dubai to Mumbai transporting cleaning products and chemicals.'),
('Valparaiso – Callao Food & Beverage Cargo Route', 'Cargo itinerary from Valparaiso to Callao focused on packaged food and beverages.'),
('Cape Town – Rotterdam Atlantic Trade Route', 'Atlantic trade route from Cape Town to Rotterdam with raw materials and manufactured goods.'),
('Vancouver – Yokohama Pacific Timber Route', 'Pacific cargo line from Vancouver to Yokohama transporting timber and paper products.'),
('Santos – Miami Commercial Cargo Route', 'Commercial route from Santos to Miami with mixed merchandise and electronics.'),
('Genoa – Alexandria Cleaning Supplies Route', 'Freight itinerary from Genoa to Alexandria transporting cleaning supplies and detergents.'),
('Singapore – Sydney Technology Cargo Route', 'Cargo shipping line from Singapore to Sydney with technology and industrial parts.'),
('Montevideo – Lisbon South Atlantic Trade Route', 'South Atlantic trade route from Montevideo to Lisbon carrying frozen food and textiles.'),
('Casablanca – Marseille Household Goods Route', 'Commercial route from Casablanca to Marseille transporting household goods and cleaning products.'),
('Helsinki – Gdansk Machinery Cargo Route', 'Cargo itinerary from Helsinki to Gdansk with machinery and construction materials.'),
('Durban – Dubai Chemical Freight Route', 'Freight route from Durban to Dubai transporting chemicals and packaged consumer goods.'),
('Dublin – New York Pharmaceutical Route', 'Commercial shipping line from Dublin to New York focused on pharmaceuticals and cleaning products.'),
('Saint Petersburg – Rotterdam Industrial Cargo Route', 'Cargo route from Saint Petersburg to Rotterdam transporting electronics and industrial machinery.'),
('Guayaquil – Los Angeles Agricultural Export Route', 'South American logistics route from Guayaquil to Los Angeles with agricultural exports and cleaning products.'),
('Manila – Hong Kong Commercial Cargo Route', 'Commercial itinerary from Manila to Hong Kong transporting textiles, electronics, and packaged goods.'),
('Reykjavik – Nuuk Arctic Supply Route', 'Cargo route from Reykjavik to Nuuk - Greenland, focused on construction materials, food supplies, and industrial equipment for Arctic operations.'),
('Rotterdam – Mumbai Intercontinental Trade Route', 'Commercial shipping route from Rotterdam to Mumbai - India, transporting machinery, pharmaceuticals, textiles, and packaged consumer goods.');

SELECT * FROM ITINERARY;