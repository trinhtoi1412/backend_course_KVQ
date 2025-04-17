drop table if exists cars;
create table cars(
    brand varchar(50),
    model varchar(50),
    year int
);

insert into cars (brand, model, year)
values
('Volvo', 'p1800', 1968),
('BMW', 'M1', 1978),
('Toyota', 'Celica', 1975),
('Lexus', 'LX600', 2020),
('Toyota', 'Land cruiser', 2000);

select * from cars;

alter table cars
add color varchar(50);

select * from cars;

update cars
set color = 'grey'
where model = 'p1800';

update cars
set color = 'black'
where model = 'M1';

update cars
set color = 'white'
where model = 'Celica';

update cars
set color = 'silver'
where model = 'LX600';

update cars
set color = 'black'
where model = 'Land cruiser';

drop table if exists categories;
create table categories(
    categories_id serial not null primary key,
    categories_name varchar(50),
    description varchar(1000)
);

alter table categories
drop column categories_name, add column category_name varchar(50);

INSERT INTO categories (category_name, description)
VALUES
  ('Beverages', 'Soft drinks, coffees, teas, beers, and ales'),
  ('Condiments', 'Sweet and savory sauces, relishes, spreads, and seasonings'),
  ('Confections', 'Desserts, candies, and sweet breads'),
  ('Dairy Products', 'Cheeses'),
  ('Grains/Cereals', 'Breads, crackers, pasta, and cereal'),
  ('Meat/Poultry', 'Prepared meats'),
  ('Produce', 'Dried fruit and bean curd'),
  ('Seafood', 'Seaweed and fish');

drop table if exists customers;
create table customers(
    customer_id serial not null primary key,
    customer_name varchar(255),
    contact_name varchar(255),
    address varchar(500),
    city varchar(255),
    postal_code varchar(255),
    country varchar(255)
);

INSERT INTO customers (customer_name, contact_name, address, city, postal_code, country)
VALUES
  ('Alfreds Futterkiste', 'Maria Anders', 'Obere Str. 57', 'Berlin', '12209', 'Germany'),
  ('Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Avda. de la Constitucion 2222', 'Mexico D.F.', '05021', 'Mexico'),
  ('Antonio Moreno Taquera', 'Antonio Moreno', 'Mataderos 2312', 'Mexico D.F.', '05023', 'Mexico'),
  ('Around the Horn', 'Thomas Hardy', '120 Hanover Sq.', 'London', 'WA1 1DP', 'UK'),
  ('Berglunds snabbkoep', 'Christina Berglund', 'Berguvsvegen 8', 'Lulea', 'S-958 22', 'Sweden'),
  ('Blauer See Delikatessen', 'Hanna Moos', 'Forsterstr. 57', 'Mannheim', '68306', 'Germany'),
  ('Blondel pere et fils', 'Frederique Citeaux', '24, place Kleber', 'Strasbourg', '67000', 'France'),
  ('Bolido Comidas preparadas', 'Martin Sommer', 'C/ Araquil, 67', 'Madrid', '28023', 'Spain'),
  ('Bon app', 'Laurence Lebihans', '12, rue des Bouchers', 'Marseille', '13008', 'France'),
  ('Bottom-Dollar Marketse', 'Elizabeth Lincoln', '23 Tsawassen Blvd.', 'Tsawassen', 'T2F 8M4', 'Canada'),
  ('Bs Beverages', 'Victoria Ashworth', 'Fauntleroy Circus', 'London', 'EC2 5NT', 'UK'),
  ('Cactus Comidas para llevar', 'Patricio Simpson', 'Cerrito 333', 'Buenos Aires', '1010', 'Argentina'),
  ('Centro comercial Moctezuma', 'Francisco Chang', 'Sierras de Granada 9993', 'Mexico D.F.', '05022', 'Mexico'),
  ('Chop-suey Chinese', 'Yang Wang', 'Hauptstr. 29', 'Bern', '3012', 'Switzerland'),
  ('Comercio Mineiro', 'Pedro Afonso', 'Av. dos Lusiadas, 23', 'Sao Paulo', '05432-043', 'Brazil'),
  ('Consolidated Holdings', 'Elizabeth Brown', 'Berkeley Gardens 12 Brewery ', 'London', 'WX1 6LT', 'UK'),
  ('Drachenblut Delikatessend', 'Sven Ottlieb', 'Walserweg 21', 'Aachen', '52066', 'Germany'),
  ('Du monde entier', 'Janine Labrune', '67, rue des Cinquante Otages', 'Nantes', '44000', 'France'),
  ('Eastern Connection', 'Ann Devon', '35 King George', 'London', 'WX3 6FW', 'UK'),
  ('Ernst Handel', 'Roland Mendel', 'Kirchgasse 6', 'Graz', '8010', 'Austria'),
  ('Familia Arquibaldo', 'Aria Cruz', 'Rua Oros, 92', 'Sao Paulo', '05442-030', 'Brazil'),
  ('FISSA Fabrica Inter. Salchichas S.A.', 'Diego Roel', 'C/ Moralzarzal, 86', 'Madrid', '28034', 'Spain'),
  ('Folies gourmandes', 'Martine Rance', '184, chaussee de Tournai', 'Lille', '59000', 'France'),
  ('Folk och fe HB', 'Maria Larsson', 'Akergatan 24', 'Brecke', 'S-844 67', 'Sweden'),
  ('Frankenversand', 'Peter Franken', 'Berliner Platz 43', 'Munchen', '80805', 'Germany'),
  ('France restauration', 'Carine Schmitt', '54, rue Royale', 'Nantes', '44000', 'France'),
  ('Franchi S.p.A.', 'Paolo Accorti', 'Via Monte Bianco 34', 'Torino', '10100', 'Italy'),
  ('Furia Bacalhau e Frutos do Mar', 'Lino Rodriguez ', 'Jardim das rosas n. 32', 'Lisboa', '1675', 'Portugal'),
  ('Galeria del gastronomo', 'Eduardo Saavedra', 'Rambla de Cataluna, 23', 'Barcelona', '08022', 'Spain'),
  ('Godos Cocina Tipica', 'Jose Pedro Freyre', 'C/ Romero, 33', 'Sevilla', '41101', 'Spain'),
  ('Gourmet Lanchonetes', 'Andre Fonseca', 'Av. Brasil, 442', 'Campinas', '04876-786', 'Brazil'),
  ('Great Lakes Food Market', 'Howard Snyder', '2732 Baker Blvd.', 'Eugene', '97403', 'USA'),
  ('GROSELLA-Restaurante', 'Manuel Pereira', '5th Ave. Los Palos Grandes', 'Caracas', '1081', 'Venezuela'),
  ('Hanari Carnes', 'Mario Pontes', 'Rua do Paco, 67', 'Rio de Janeiro', '05454-876', 'Brazil'),
  ('HILARION-Abastos', 'Carlos Hernandez', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristobal', '5022', 'Venezuela'),
  ('Hungry Coyote Import Store', 'Yoshi Latimer', 'City Center Plaza 516 Main St.', 'Elgin', '97827', 'USA'),
  ('Hungry Owl All-Night Grocers', 'Patricia McKenna', '8 Johnstown Road', 'Cork', '', 'Ireland'),
  ('Island Trading', 'Helen Bennett', 'Garden House Crowther Way', 'Cowes', 'PO31 7PJ', 'UK'),
  ('Koniglich Essen', 'Philip Cramer', 'Maubelstr. 90', 'Brandenburg', '14776', 'Germany'),
  ('La corne d abondance', 'Daniel Tonini', '67, avenue de l Europe', 'Versailles', '78000', 'France'),
  ('La maison d Asie', 'Annette Roulet', '1 rue Alsace-Lorraine', 'Toulouse', '31000', 'France'),
  ('Laughing Bacchus Wine Cellars', 'Yoshi Tannamuri', '1900 Oak St.', 'Vancouver', 'V3F 2K1', 'Canada'),
  ('Lazy K Kountry Store', 'John Steel', '12 Orchestra Terrace', 'Walla Walla', '99362', 'USA'),
  ('Lehmanns Marktstand', 'Renate Messner', 'Magazinweg 7', 'Frankfurt a.M. ', '60528', 'Germany'),
  ('Lets Stop N Shop', 'Jaime Yorres', '87 Polk St. Suite 5', 'San Francisco', '94117', 'USA'),
  ('LILA-Supermercado', 'Carlos Gonzalez', 'Carrera 52 con Ave. Bolivar #65-98 Llano Largo', 'Barquisimeto', '3508', 'Venezuela'),
  ('LINO-Delicateses', 'Felipe Izquierdo', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', '4980', 'Venezuela'),
  ('Lonesome Pine Restaurant', 'Fran Wilson', '89 Chiaroscuro Rd.', 'Portland', '97219', 'USA'),
  ('Magazzini Alimentari Riuniti', 'Giovanni Rovelli', 'Via Ludovico il Moro 22', 'Bergamo', '24100', 'Italy'),
  ('Maison Dewey', 'Catherine Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', 'B-1180', 'Belgium'),
  ('Mere Paillarde', 'Jean Fresniere', '43 rue St. Laurent', 'Montreal', 'H1J 1C3', 'Canada'),
  ('Morgenstern Gesundkost', 'Alexander Feuer', 'Heerstr. 22', 'Leipzig', '04179', 'Germany'),
  ('North/South', 'Simon Crowther', 'South House 300 Queensbridge', 'London', 'SW7 1RZ', 'UK'),
  ('Oceano Atlantico Ltda.', 'Yvonne Moncada', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', '1010', 'Argentina'),
  ('Old World Delicatessen', 'Rene Phillips', '2743 Bering St.', 'Anchorage', '99508', 'USA'),
  ('Ottilies Keseladen', 'Henriette Pfalzheim', 'Mehrheimerstr. 369', 'Koln', '50739', 'Germany'),
  ('Paris specialites', 'Marie Bertrand', '265, boulevard Charonne', 'Paris', '75012', 'France'),
  ('Pericles Comidas clasicas', 'Guillermo Fernandez', 'Calle Dr. Jorge Cash 321', 'Mexico D.F.', '05033', 'Mexico'),
  ('Piccolo und mehr', 'Georg Pipps', 'Geislweg 14', 'Salzburg', '5020', 'Austria'),
  ('Princesa Isabel Vinhoss', 'Isabel de Castro', 'Estrada da saude n. 58', 'Lisboa', '1756', 'Portugal'),
  ('Que Delicia', 'Bernardo Batista', 'Rua da Panificadora, 12', 'Rio de Janeiro', '02389-673', 'Brazil'),
  ('Queen Cozinha', 'Lucia Carvalho', 'Alameda dos Canarios, 891', 'Sao Paulo', '05487-020', 'Brazil'),
  ('QUICK-Stop', 'Horst Kloss', 'Taucherstrasse 10', 'Cunewalde', '01307', 'Germany'),
  ('Rancho grande', 'Sergio Gutiarrez', 'Av. del Libertador 900', 'Buenos Aires', '1010', 'Argentina'),
  ('Rattlesnake Canyon Grocery', 'Paula Wilson', '2817 Milton Dr.', 'Albuquerque', '87110', 'USA'),
  ('Reggiani Caseifici', 'Maurizio Moroni', 'Strada Provinciale 124', 'Reggio Emilia', '42100', 'Italy'),
  ('Ricardo Adocicados', 'Janete Limeira', 'Av. Copacabana, 267', 'Rio de Janeiro', '02389-890', 'Brazil'),
  ('Richter Supermarkt', 'Michael Holz', 'Grenzacherweg 237', 'Genève', '1203', 'Switzerland'),
  ('Romero y tomillo', 'Alejandra Camino', 'Gran Via, 1', 'Madrid', '28001', 'Spain'),
  ('Santa Gourmet', 'Jonas Bergulfsen', 'Erling Skakkes gate 78', 'Stavern', '4110', 'Norway'),
  ('Save-a-lot Markets', 'Jose Pavarotti', '187 Suffolk Ln.', 'Boise', '83720', 'USA'),
  ('Seven Seas Imports', 'Hari Kumar', '90 Wadhurst Rd.', 'London', 'OX15 4NB', 'UK'),
  ('Simons bistro', 'Jytte Petersen', 'Vinbeltet 34', 'Kobenhavn', '1734', 'Denmark'),
  ('Specialites du monde', 'Dominique Perrier', '25, rue Lauriston', 'Paris', '75016', 'France'),
  ('Split Rail Beer & Ale', 'Art Braunschweiger', 'P.O. Box 555', 'Lander', '82520', 'USA'),
  ('Supremes delices', 'Pascale Cartrain', 'Boulevard Tirou, 255', 'Charleroi', 'B-6000', 'Belgium'),
  ('The Big Cheese', 'Liz Nixon', '89 Jefferson Way Suite 2', 'Portland', '97201', 'USA'),
  ('The Cracker Box', 'Liu Wong', '55 Grizzly Peak Rd.', 'Butte', '59801', 'USA'),
  ('Toms Spezialiteten', 'Karin Josephs', 'Luisenstr. 48', 'Manster', '44087', 'Germany'),
  ('Tortuga Restaurante', 'Miguel Angel Paolino', 'Avda. Azteca 123', 'Mexico D.F.', '05033', 'Mexico'),
  ('Tradicao Hipermercados', 'Anabela Domingues', 'Av. Ines de Castro, 414', 'Sao Paulo', '05634-030', 'Brazil'),
  ('Trails Head Gourmet Provisioners', 'Helvetius Nagy', '722 DaVinci Blvd.', 'Kirkland', '98034', 'USA'),
  ('Vaffeljernet', 'Palle Ibsen', 'Smagsloget 45', 'Arhus', '8200', 'Denmark'),
  ('Victuailles en stock', 'Mary Saveley', '2, rue du Commerce', 'Lyon', '69004', 'France'),
  ('Vins et alcools Chevalier', 'Paul Henriot', '59 rue de l Abbaye', 'Reims', '51100', 'France'),
  ('Die Wandernde Kuh', 'Rita Moller', 'Adenauerallee 900', 'Stuttgart', '70563', 'Germany'),
  ('Wartian Herkku', 'Pirkko Koskitalo', 'Torikatu 38', 'Oulu', '90110', 'Finland'),
  ('Wellington Importadora', 'Paula Parente', 'Rua do Mercado, 12', 'Resende', '08737-363', 'Brazil'),
  ('White Clover Markets', 'Karl Jablonski', '305 - 14th Ave. S. Suite 3B', 'Seattle', '98128', 'USA'),
  ('Wilman Kala', 'Matti Karttunen', 'Keskuskatu 45', 'Helsinki', '21240', 'Finland'),
  ('Wolski', 'Zbyszek', 'ul. Filtrowa 68', 'Walla', '01-012', 'Poland');

drop table if exists products;
create table products(
    product_id serial not null primary key,
    product_name varchar(255),
    category_id int,
    unit varchar(255),
    price decimal(10, 2)
);

INSERT INTO products (product_id, product_name, category_id, unit, price)
VALUES
  (1, 'Chais', 1, '10 boxes x 20 bags', 18),
  (2, 'Chang', 1, '24 - 12 oz bottles', 19),
  (3, 'Aniseed Syrup', 2, '12 - 550 ml bottles', 10),
  (4, 'Chef Antons Cajun Seasoning', 2, '48 - 6 oz jars', 22),
  (5, 'Chef Antons Gumbo Mix', 2, '36 boxes', 21.35),
  (6, 'Grandmas Boysenberry Spread', 2, '12 - 8 oz jars', 25),
  (7, 'Uncle Bobs Organic Dried Pears', 7, '12 - 1 lb pkgs.', 30),
  (8, 'Northwoods Cranberry Sauce', 2, '12 - 12 oz jars', 40),
  (9, 'Mishi Kobe Niku', 6, '18 - 500 g pkgs.', 97),
  (10, 'Ikura', 8, '12 - 200 ml jars', 31),
  (11, 'Queso Cabrales', 4, '1 kg pkg.', 21),
  (12, 'Queso Manchego La Pastora', 4, '10 - 500 g pkgs.', 38),
  (13, 'Konbu', 8, '2 kg box', 6),
  (14, 'Tofu', 7, '40 - 100 g pkgs.', 23.25),
  (15, 'Genen Shouyu', 2, '24 - 250 ml bottles', 15.5),
  (16, 'Pavlova', 3, '32 - 500 g boxes', 17.45),
  (17, 'Alice Mutton', 6, '20 - 1 kg tins', 39),
  (18, 'Carnarvon Tigers', 8, '16 kg pkg.', 62.5),
  (19, 'Teatime Chocolate Biscuits', 3, '10 boxes x 12 pieces', 9.2),
  (20, 'Sir Rodneys Marmalade', 3, '30 gift boxes', 81),
  (21, 'Sir Rodneys Scones', 3, '24 pkgs. x 4 pieces', 10),
  (22, 'Gustafs Kneckebrod', 5, '24 - 500 g pkgs.', 21),
  (23, 'Tunnbrod', 5, '12 - 250 g pkgs.', 9),
  (24, 'Guarani Fantastica', 1, '12 - 355 ml cans', 4.5),
  (25, 'NuNuCa Nui-Nougat-Creme', 3, '20 - 450 g glasses', 14),
  (26, 'Gumber Gummiberchen', 3, '100 - 250 g bags', 31.23),
  (27, 'Schoggi Schokolade', 3, '100 - 100 g pieces', 43.9),
  (28, 'Rassle Sauerkraut', 7, '25 - 825 g cans', 45.6),
  (29, 'Thoringer Rostbratwurst', 6, '50 bags x 30 sausgs.', 123.79),
  (30, 'Nord-Ost Matjeshering', 8, '10 - 200 g glasses', 25.89),
  (31, 'Gorgonzola Telino', 4, '12 - 100 g pkgs', 12.5),
  (32, 'Mascarpone Fabioli', 4, '24 - 200 g pkgs.', 32),
  (33, 'Geitost', 4, '500 g', 2.5),
  (34, 'Sasquatch Ale', 1, '24 - 12 oz bottles', 14),
  (35, 'Steeleye Stout', 1, '24 - 12 oz bottles', 18),
  (36, 'Inlagd Sill', 8, '24 - 250 g jars', 19),
  (37, 'Gravad lax', 8, '12 - 500 g pkgs.', 26),
  (38, 'Cote de Blaye', 1, '12 - 75 cl bottles', 263.5),
  (39, 'Chartreuse verte', 1, '750 cc per bottle', 18),
  (40, 'Boston Crab Meat', 8, '24 - 4 oz tins', 18.4),
  (41, 'Jacks New England Clam Chowder', 8, '12 - 12 oz cans', 9.65),
  (42, 'Singaporean Hokkien Fried Mee', 5, '32 - 1 kg pkgs.', 14),
  (43, 'Ipoh Coffee', 1, '16 - 500 g tins', 46),
  (44, 'Gula Malacca', 2, '20 - 2 kg bags', 19.45),
  (45, 'Rogede sild', 8, '1k pkg.', 9.5),
  (46, 'Spegesild', 8, '4 - 450 g glasses', 12),
  (47, 'Zaanse koeken', 3, '10 - 4 oz boxes', 9.5),
  (48, 'Chocolade', 3, '10 pkgs.', 12.75),
  (49, 'Maxilaku', 3, '24 - 50 g pkgs.', 20),
  (50, 'Valkoinen suklaa', 3, '12 - 100 g bars', 16.25),
  (51, 'Manjimup Dried Apples', 7, '50 - 300 g pkgs.', 53),
  (52, 'Filo Mix', 5, '16 - 2 kg boxes', 7),
  (53, 'Perth Pasties', 6, '48 pieces', 32.8),
  (54, 'Tourtiare', 6, '16 pies', 7.45),
  (55, 'Pate chinois', 6, '24 boxes x 2 pies', 24),
  (56, 'Gnocchi di nonna Alice', 5, '24 - 250 g pkgs.', 38),
  (57, 'Ravioli Angelo', 5, '24 - 250 g pkgs.', 19.5),
  (58, 'Escargots de Bourgogne', 8, '24 pieces', 13.25),
  (59, 'Raclette Courdavault', 4, '5 kg pkg.', 55),
  (60, 'Camembert Pierrot', 4, '15 - 300 g rounds', 34),
  (61, 'Sirop d arable', 2, '24 - 500 ml bottles', 28.5),
  (62, 'Tarte au sucre', 3, '48 pies', 49.3),
  (63, 'Vegie-spread', 2, '15 - 625 g jars', 43.9),
  (64, 'Wimmers gute Semmelknadel', 5, '20 bags x 4 pieces', 33.25),
  (65, 'Louisiana Fiery Hot Pepper Sauce', 2, '32 - 8 oz bottles', 21.05),
  (66, 'Louisiana Hot Spiced Okra', 2, '24 - 8 oz jars', 17),
  (67, 'Laughing Lumberjack Lager', 1, '24 - 12 oz bottles', 14),
  (68, 'Scottish Longbreads', 3, '10 boxes x 8 pieces', 12.5),
  (69, 'Gudbrandsdalsost', 4, '10 kg pkg.', 36),
  (70, 'Outback Lager', 1, '24 - 355 ml bottles', 15),
  (71, 'Flotemysost', 4, '10 - 500 g pkgs.', 21.5),
  (72, 'Mozzarella di Giovanni', 4, '24 - 200 g pkgs.', 34.8),
  (73, 'Red Kaviar', 8, '24 - 150 g jars', 15),
  (74, 'Longlife Tofu', 7, '5 kg pkg.', 10),
  (75, 'Rhenbreu Klosterbier', 1, '24 - 0.5 l bottles', 7.75),
  (76, 'Lakkalikeeri', 1, '500 ml ', 18),
  (77, 'Original Frankfurter grune Soae', 2, '12 boxes', 13);

select * from cars
where brand = 'Volvo';

select * from cars
where model like 'M%';

select count(distinct country) from customers;

select * from products
order by price desc ;

select * from products
order by product_name desc;

SELECT * FROM customers
LIMIT 20 OFFSET 40;

SELECT MIN(price) AS lowest_price FROM products;

SELECT * FROM customers
WHERE country IN ('Germany', 'France', 'UK');

SELECT product_name || ' ' || unit AS product
FROM products;

select product_id, product_name, category_name
from products
inner join categories on products.category_id = categories.categories_id;