DROP TABLE IF EXISTS `continents`
CREATE TABLE `continents` (
	`code` VARCHAR(2) NOT NULL DEFAULT '',
	`name` VARCHAR(15) NOT NULL DEFAULT '',
	UNIQUE KEY `code` (`code`)
) ENGINE = MyISAM DEFAULT CHARSET=utf8;

-- Hasura GraphQL Server - use Postgres database
--DROP TABLE IF EXISTS continents
--CREATE TABLE continents (
--	code VARCHAR(2) NOT NULL DEFAULT '',
--	name VARCHAR(15) NOT NULL DEFAULT '',
--	UNIQUE(code)
--);

INSERT INTO `continents` (`code`, `name`) VALUES
	('AF', 'Africa'),
	('AN', 'Antarctica'),
	('AS', 'Asia'),
	('EU', 'Europe'),
	('NA', 'North America'),
	('OC', 'Oceania'),
	('SA', 'South America');
	
--INSERT INTO continents (code, name) VALUES
--	('AF', 'Africa'),
--	('AN', 'Antarctica'),
--	('AS', 'Asia'),
--	('EU', 'Europe'),
--	('NA', 'North America'),
--	('OC', 'Oceania'),
--	('SA', 'South America');