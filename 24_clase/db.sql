-- Adminer 4.8.1 MySQL 8.4.0 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

CREATE DATABASE `consultorio_adriana` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `consultorio_adriana`;

DROP TABLE IF EXISTS `facturacion`;
CREATE TABLE `facturacion` (
  `id_factura` int NOT NULL AUTO_INCREMENT,
  `medico_cuit` varchar(11) DEFAULT NULL,
  `paciente_dni` varchar(8) DEFAULT NULL,
  `obra_social_id` int DEFAULT NULL,
  `precio` decimal(12,2) DEFAULT NULL,
  `fecha` date DEFAULT (curdate()),
  PRIMARY KEY (`id_factura`),
  KEY `fk_medico_fact` (`medico_cuit`),
  KEY `fk_paciente_fact` (`paciente_dni`),
  KEY `fk_obra_social_fact` (`obra_social_id`),
  CONSTRAINT `fk_medico_fact` FOREIGN KEY (`medico_cuit`) REFERENCES `medico` (`medico_cuit`),
  CONSTRAINT `fk_obra_social_fact` FOREIGN KEY (`obra_social_id`) REFERENCES `obra_social` (`obra_social_id`),
  CONSTRAINT `fk_paciente_fact` FOREIGN KEY (`paciente_dni`) REFERENCES `paciente` (`paciente_dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `facturacion` (`id_factura`, `medico_cuit`, `paciente_dni`, `obra_social_id`, `precio`, `fecha`) VALUES
(1,	'23998877665',	'20950419',	19,	91708.19,	'2023-08-08'),
(2,	'23498877663',	'43583450',	14,	75665.53,	'2024-03-17'),
(3,	'23998877665',	'20950419',	29,	62075.29,	'2023-05-22'),
(4,	'23998877665',	'79817942',	29,	95720.27,	'2024-03-13'),
(5,	'23998877665',	'55364346',	28,	41702.01,	'2024-03-05'),
(6,	'23998877665',	'20950419',	27,	90177.86,	'2023-11-08'),
(7,	'23498877663',	'20950419',	24,	48525.98,	'2023-07-21'),
(8,	'23998877665',	'60460873',	1,	75287.88,	'2023-10-12'),
(9,	'23998877665',	'60460873',	12,	76830.91,	'2024-03-23'),
(10,	'23498877663',	'15767164',	4,	60826.57,	'2024-03-29'),
(11,	'23498877663',	'43583450',	32,	65416.14,	'2023-05-31'),
(12,	'23498877663',	'20950419',	21,	30142.65,	'2024-04-20'),
(13,	'23998877665',	'20950419',	37,	81309.64,	'2024-02-09'),
(14,	'23498877663',	'55364346',	8,	42199.73,	'2023-09-16'),
(15,	'23498877663',	'15767164',	16,	58150.04,	'2024-02-15'),
(16,	'23998877665',	'20950419',	8,	37455.98,	'2024-04-25'),
(17,	'23498877663',	'55364346',	28,	63022.69,	'2023-10-20'),
(18,	'23498877663',	'27555702',	34,	46234.68,	'2024-05-17'),
(19,	'23498877663',	'43583450',	19,	34854.60,	'2024-05-18'),
(20,	'23498877663',	'43583450',	25,	50399.22,	'2023-06-21'),
(21,	'23998877665',	'60460873',	5,	76214.14,	'2023-11-04'),
(22,	'23498877663',	'60460873',	36,	60566.80,	'2023-11-11'),
(23,	'23498877663',	'60460873',	9,	81178.23,	'2024-03-10'),
(24,	'23998877665',	'20950419',	19,	93838.99,	'2023-09-13'),
(25,	'23498877663',	'20950419',	8,	49892.12,	'2023-08-30'),
(26,	'23498877663',	'79817942',	31,	72682.10,	'2023-07-19'),
(27,	'23498877663',	'20950419',	23,	66460.38,	'2023-12-30'),
(28,	'23998877665',	'92403549',	25,	95940.97,	'2024-05-10'),
(29,	'23998877665',	'43583450',	15,	78722.23,	'2024-03-04'),
(30,	'23498877663',	'15767164',	15,	82800.77,	'2023-07-12');

DROP TABLE IF EXISTS `link_paciente_medico`;
CREATE TABLE `link_paciente_medico` (
  `medico_cuit` varchar(11) NOT NULL,
  `paciente_dni` varchar(8) NOT NULL,
  `med_cabecera` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`medico_cuit`,`paciente_dni`),
  KEY `fk_paciente_link` (`paciente_dni`),
  CONSTRAINT `fk_medico_link` FOREIGN KEY (`medico_cuit`) REFERENCES `medico` (`medico_cuit`),
  CONSTRAINT `fk_paciente_link` FOREIGN KEY (`paciente_dni`) REFERENCES `paciente` (`paciente_dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `link_paciente_medico` (`medico_cuit`, `paciente_dni`, `med_cabecera`) VALUES
('23498877663',	'15767164',	1),
('23498877663',	'20950419',	0),
('23498877663',	'27555702',	0),
('23498877663',	'55364346',	1),
('23498877663',	'61037388',	0),
('23498877663',	'79817942',	0),
('23998877665',	'20950419',	1),
('23998877665',	'27555702',	0),
('23998877665',	'55364346',	1),
('23998877665',	'79817942',	0),
('23998877665',	'92403549',	0);

DROP TABLE IF EXISTS `medico`;
CREATE TABLE `medico` (
  `medico_cuit` varchar(11) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `especialidad` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`medico_cuit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `medico` (`medico_cuit`, `nombre`, `especialidad`) VALUES
('23498877663',	'favaloro',	'cardiologia'),
('23998877665',	'adriana',	'cardiologia');

DROP TABLE IF EXISTS `obra_social`;
CREATE TABLE `obra_social` (
  `obra_social_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `plan` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`obra_social_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `obra_social` (`obra_social_id`, `nombre`, `plan`) VALUES
(1,	'Toyota',	'Violet'),
(2,	'Plymouth',	'Yellow'),
(3,	'Citroën',	'Blue'),
(4,	'Hummer',	'Red'),
(5,	'Volkswagen',	'Green'),
(6,	'Mazda',	'Pink'),
(7,	'Mercedes-Benz',	'Crimson'),
(8,	'Mazda',	'Green'),
(9,	'GMC',	'Green'),
(10,	'Bentley',	'Blue'),
(11,	'Plymouth',	'Aquamarine'),
(12,	'BMW',	'Turquoise'),
(13,	'Ford',	'Purple'),
(14,	'Chrysler',	'Green'),
(15,	'Pontiac',	'Khaki'),
(16,	'GMC',	'Puce'),
(17,	'Oldsmobile',	'Goldenrod'),
(18,	'Saturn',	'Blue'),
(19,	'Mercury',	'Orange'),
(20,	'Infiniti',	'Teal'),
(21,	'Volvo',	'Fuscia'),
(22,	'BMW',	'Purple'),
(23,	'Volkswagen',	'Puce'),
(24,	'GMC',	'Goldenrod'),
(25,	'Kia',	'Orange'),
(26,	'Land Rover',	'Pink'),
(27,	'Lexus',	'Teal'),
(28,	'Land Rover',	'Violet'),
(29,	'Subaru',	'Mauv'),
(30,	'Ford',	'Red'),
(31,	'Suzuki',	'Teal'),
(32,	'Volkswagen',	'Mauv'),
(33,	'Porsche',	'Maroon'),
(34,	'Volvo',	'Pink'),
(35,	'Nissan',	'Fuscia'),
(36,	'Audi',	'Fuscia'),
(37,	'Toyota',	'Fuscia'),
(38,	'Dodge',	'Green'),
(39,	'Ford',	'Turquoise');

DROP TABLE IF EXISTS `paciente`;
CREATE TABLE `paciente` (
  `paciente_dni` varchar(8) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `edad` int DEFAULT NULL,
  PRIMARY KEY (`paciente_dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `paciente` (`paciente_dni`, `email`, `edad`) VALUES
('11118291',	'yklimschakw@discuz.net',	89),
('13963024',	'apipworth11@t.co',	83),
('15767164',	'gzanetello3@vkontakte.ru',	63),
('20950419',	'tbastide1@wordpress.org',	90),
('27555702',	'lscarrisbrick7@addtoany.com',	65),
('32043329',	'eolphertk@wordpress.org',	20),
('32876757',	'kridgewellc@google.co.uk',	97),
('33652922',	'mandreolettii@imageshack.us',	36),
('34476609',	'meyreed@xrea.com',	62),
('37724902',	'sscrooby9@netscape.com',	53),
('39854778',	'padriaensb@google.pl',	26),
('40448504',	'gmorehall16@trellian.com',	60),
('40693340',	'readsl@4shared.com',	90),
('41490971',	'rdautryt@yelp.com',	48),
('41498810',	'glachezeg@mozilla.com',	86),
('42746804',	'kdebullione@eepurl.com',	81),
('43583450',	'bpeacock5@canalblog.com',	47),
('46884829',	'fmasseom@prlog.org',	40),
('47719433',	'gcumberlidgep@dion.ne.jp',	24),
('54532719',	'sbonettr@alibaba.com',	30),
('55206429',	'hhealings15@elegantthemes.com',	75),
('55307857',	'larlow10@etsy.com',	48),
('55364346',	'jcheek0@bravesites.com',	44),
('60460873',	'sfrude8@goodreads.com',	63),
('61037388',	'dvorley2@soup.io',	54),
('64282074',	'kpywell18@nydailynews.com',	71),
('66214008',	'cpeirpoint17@cnbc.com',	55),
('67360219',	'rtrans@ihg.com',	30),
('68243080',	'cskamell14@sun.com',	79),
('69589296',	'swerrito@constantcontact.com',	92),
('69703731',	'gduigany@tinypic.com',	61),
('71855260',	'verrola@issuu.com',	47),
('75844565',	'mvandevliesx@cdbaby.com',	98),
('77450150',	'mgallelliv@blogs.com',	76),
('77594215',	'mbewsheaf@microsoft.com',	45),
('78298066',	'aferrymanh@yelp.com',	35),
('79817942',	'twhitford6@sbwire.com',	22),
('79993644',	'kcuerj@businesswire.com',	59),
('81627328',	'rkilfether12@wikimedia.org',	20),
('83827924',	'lvitallq@livejournal.com',	67),
('87884570',	'hmulryan13@wired.com',	65),
('92403549',	'ldurnford4@ihg.com',	85),
('94103619',	'dboiseu@japanpost.jp',	32),
('94387194',	'khaken@vinaora.com',	22),
('95276483',	'btolworthiez@zdnet.com',	81);

-- 2024-05-22 22:29:26
