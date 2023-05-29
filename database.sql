CREATE DATABASE IF NOT EXISTS `benin_dns_forum`;

USE `benin_dns_forum`;

SET
  SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

START TRANSACTION;

SET
  time_zone = "+00:00";

CREATE TABLE IF NOT EXISTS `activities` (
  `id` int NOT NULL,
  `slug` varchar(255) NOT NULL COMMENT 'C''est le titre ou theme de l''activité',
  `desc` text,
  `cat_id` int NOT NULL,
  `isEdition` tinyint(1) DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'C''est la table stockant les informations des activités au Benin DNS Forum';

--
-- Dumping data for table `activities`
--
INSERT INTO
  `activities` (
    `id`,
    `slug`,
    `desc`,
    `cat_id`,
    `isEdition`,
    `created_by`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    'Woman DNS Academy',
    'Woman DNS Academy (WDA) est le programme de formation du Bénin DNS Forum essentiellement destiné aux femmes et consacré à l’initiation aux systèmes DNS et leurs administrations. Ce programme aborde également les grands enjeux de l’économie du DNS et les modèles économiques autour des noms de domaine.\r\n\r\nLa formation est essentiellement pratique et vise à offrir non seulement une connaissance approfondie des technologies du DNS, des protocoles autour du DNS et d’Internet, mais aussi à créer un véritable engouement au sein du genre féminin à s’intéresser aux questions liées aux DNS et à son infrastructure.\r\n\r\nLe programme se déroule sur quatre (04) jours. La sélection des candidats s’est faite suite à un appel à candidature ouverte. Les candidates remplissant les conditions minima de sélection sont invitées à participer au programme.\r\n\r\nLes candidates sélectionnées ne résidant pas dans la ville de Cotonou (Bénin) où se déroule la formation ont pu bénéficier d’une prise en charge complète (Restauration – Hébergement – Transport). Cette possibilité de bourse permet de diversifier l’origine géographique des candidates.',
    3,
    1,
    1,
    '2023-05-29 05:02:26',
    NULL
  ),
  (
    2,
    'DNSathon  (Hackathon sur le DNS)',
    'Le DNSathon (Hackathon sur le DNS) est le hackathon collaboratif organisé par le Bénin DNS Forum et qui mobilisera  une cinquantaine de participants de différents profils sur 36h. \r\n\r\nIl a été introduit dans le programme du Bénin DNS Forum depuis l\'édition 2017 suite à l’intérêt manifesté par la communauté d’apprendre et de comprendre l’implémentation technique de la hiérarchisation du DNS.\r\n\r\nCette année le DNSathon se déroulera les Mercredi 09 et Jeudi 10 Novembre 2022 dans la ville de Parakou. L’objectif sera de mettre en place un prototype de l’infrastructure DNS sécurisée de bout en bout (Root, Registre, Registrar) avec l’implémentation des extensions de sécurité DNSSEC et DoH/DoT',
    4,
    1,
    1,
    '2023-05-29 05:02:26',
    NULL
  );

-- --------------------------------------------------------
--
-- Table structure for table `activitie_edition`
--
CREATE TABLE IF NOT EXISTS `activitie_edition` (
  `id` int NOT NULL,
  `edition_id` int NOT NULL,
  `activitie_id` int NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'C''est la table fessant le lien entre une activité et une edition';

--
-- Dumping data for table `activitie_edition`
--
INSERT INTO
  `activitie_edition` (`id`, `edition_id`, `activitie_id`)
VALUES
  (1, 1, 1),
  (2, 1, 2);

-- --------------------------------------------------------
--
-- Table structure for table `candidates`
--
CREATE TABLE IF NOT EXISTS `candidates` (
  `id` int NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `activitie_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'C''est la table stockant les informations des candidats potentiels du Benin DNS Forum par ses activités';

--
-- Dumping data for table `candidates`
--
INSERT INTO
  `candidates` (
    `id`,
    `first_name`,
    `last_name`,
    `email`,
    `phone`,
    `company`,
    `activitie_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    'John',
    'DOE',
    'johndoe@exemple.com',
    '+22996431150',
    'FuturaVision',
    2,
    '2023-05-29 05:22:29',
    NULL
  );

-- --------------------------------------------------------
--
-- Table structure for table `categories`
--
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int NOT NULL,
  `slug` varchar(255) NOT NULL COMMENT 'C''est le titre du catégorie',
  `created_by` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'C''est la table stockant les différentes catégories des activités';

--
-- Dumping data for table `categories`
--
INSERT INTO
  `categories` (`id`, `slug`, `created_by`, `created_at`)
VALUES
  (3, 'Formation', 1, '2023-05-29 05:05:27'),
  (4, 'Hackaton', 1, '2023-05-29 05:05:54'),
  (5, 'Forum Public', 1, '2023-05-29 05:06:35');

-- --------------------------------------------------------
--
-- Table structure for table `editions`
--
CREATE TABLE IF NOT EXISTS `editions` (
  `id` int NOT NULL,
  `slug` varchar(255) NOT NULL COMMENT 'C''est le nom de l''edition du forum',
  `theme` varchar(255) NOT NULL,
  `start_on` datetime NOT NULL,
  `end_on` datetime NOT NULL,
  `created_by` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'C''est la table stockant les informations de lancement de chaque edition du Benin DNS Forum';

--
-- Dumping data for table `editions`
--
INSERT INTO
  `editions` (
    `id`,
    `slug`,
    `theme`,
    `start_on`,
    `end_on`,
    `created_by`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    'Bénin DNS Forum 2022: 8ème édition',
    'Importance du DNS dans la stratégie de cybersécurité',
    '2023-05-29 04:09:52',
    '2023-05-29 04:09:52',
    1,
    '2023-05-29 05:09:52',
    NULL
  );

-- --------------------------------------------------------
--
-- Table structure for table `members`
--
CREATE TABLE IF NOT EXISTS `members` (
  `id` int NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin', 'standard', 'moderateur') NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'C''est la table stockant les informations des membres du Benin DNS Forum';

--
-- Dumping data for table `members`
--
INSERT INTO
  `members` (
    `id`,
    `first_name`,
    `last_name`,
    `email`,
    `password`,
    `role`,
    `created_at`
  )
VALUES
  (
    1,
    'Kabirou',
    'ALASSANE',
    'dev@kabirou-alassane.com',
    '$2y$10$CVc6M8O2Jk6gl3y9gmgSp.wjUIXqtBnXkiNiO7Gb9xaADtox3NTcy',
    'admin',
    '2023-05-29 05:00:36'
  );

-- --------------------------------------------------------
--
-- Table structure for table `reports`
--
CREATE TABLE IF NOT EXISTS `reports` (
  `id` int NOT NULL,
  `edition_id` int NOT NULL,
  `content` text,
  `created_by` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'C''est la table stockant les rapports de chaque editions du Benin DNS Forum';

--
-- Dumping data for table `reports`
--
INSERT INTO
  `reports` (
    `id`,
    `edition_id`,
    `content`,
    `created_by`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    1,
    'Le Bénin Numérique le compte désormais dans ses mémoires et dans ses succès. Premier Forum national sur le continent africain dédié au Système des Noms de Domaine (DNS), le Bénin DNS Forum, pour l’édition 2021, a réuni 599 participants dont plus de 150 jeunes femmes sur l’ensemble des principales activités exécutées.\r\n\r\nLe Forum Public de Communication, la formation Woman DNS Academy (WDA), la 1ère édition de Woman DNS Academy Networking (WDA Networking), le DNSathon (Hackathon sur le DNS) et la Rencontre multi-acteurs sont les grands axes d’activités de cette 7ème édition du Bénin DNS Forum tenue du 19 au 23 octobre 2021 à Cotonou et avec le soutien de l’Afnic et de plusieurs partenaires locaux et internationaux.\r\n\r\nLes cinq (5) jours de travaux, d’ateliers et de formation ont été de véritables moments de partages, de réflexions, de débats et de propositions concrètes autour du thème «Internet et le commerce électronique au Bénin». Plusieurs innovations ont marqué cette 7ème édition du Bénin DNS Forum, notamment le dnsquizz lors du forum public et la 1ère édition de « WDA Networking« \r\n\r\nLe présent Rapport Global du Bénin DNS Forum 2021, détaillé et illustré, dresse le bilan de ces cinq jours d’intenses activités, présente les résultats obtenus et annonce les perspectives pour une huitième édition pleine de défis.',
    1,
    '2023-05-29 05:18:54',
    NULL
  );

--
-- Indexes for dumped tables
--
--
-- Indexes for table `activities`
--
ALTER TABLE
  `activities`
ADD
  PRIMARY KEY (`id`),
ADD
  KEY `cat_id` (`cat_id`),
ADD
  KEY `created_by` (`created_by`);

--
-- Indexes for table `activitie_edition`
--
ALTER TABLE
  `activitie_edition`
ADD
  PRIMARY KEY (`id`),
ADD
  KEY `edition_id` (`edition_id`),
ADD
  KEY `activitie_id` (`activitie_id`);

--
-- Indexes for table `candidates`
--
ALTER TABLE
  `candidates`
ADD
  PRIMARY KEY (`id`),
ADD
  UNIQUE KEY `email` (`email`),
ADD
  KEY `activitie_id` (`activitie_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE
  `categories`
ADD
  PRIMARY KEY (`id`),
ADD
  KEY `created_by` (`created_by`);

--
-- Indexes for table `editions`
--
ALTER TABLE
  `editions`
ADD
  PRIMARY KEY (`id`),
ADD
  KEY `created_by` (`created_by`);

--
-- Indexes for table `members`
--
ALTER TABLE
  `members`
ADD
  PRIMARY KEY (`id`),
ADD
  UNIQUE KEY `email` (`email`);

--
-- Indexes for table `reports`
--
ALTER TABLE
  `reports`
ADD
  PRIMARY KEY (`id`),
ADD
  KEY `edition_id` (`edition_id`),
ADD
  KEY `created_by` (`created_by`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE
  `activities`
MODIFY
  `id` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 3;

--
-- AUTO_INCREMENT for table `activitie_edition`
--
ALTER TABLE
  `activitie_edition`
MODIFY
  `id` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 3;

--
-- AUTO_INCREMENT for table `candidates`
--
ALTER TABLE
  `candidates`
MODIFY
  `id` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE
  `categories`
MODIFY
  `id` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 6;

--
-- AUTO_INCREMENT for table `editions`
--
ALTER TABLE
  `editions`
MODIFY
  `id` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 2;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE
  `members`
MODIFY
  `id` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 2;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE
  `reports`
MODIFY
  `id` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 2;

--
-- Constraints for dumped tables
--
--
-- Constraints for table `activities`
--
ALTER TABLE
  `activities`
ADD
  CONSTRAINT `activities_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`),
ADD
  CONSTRAINT `activities_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `members` (`id`);

--
-- Constraints for table `activitie_edition`
--
ALTER TABLE
  `activitie_edition`
ADD
  CONSTRAINT `activitie_edition_ibfk_1` FOREIGN KEY (`edition_id`) REFERENCES `editions` (`id`),
ADD
  CONSTRAINT `activitie_edition_ibfk_2` FOREIGN KEY (`activitie_id`) REFERENCES `activities` (`id`);

--
-- Constraints for table `candidates`
--
ALTER TABLE
  `candidates`
ADD
  CONSTRAINT `candidates_ibfk_1` FOREIGN KEY (`activitie_id`) REFERENCES `activities` (`id`);

--
-- Constraints for table `categories`
--
ALTER TABLE
  `categories`
ADD
  CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `members` (`id`);

--
-- Constraints for table `editions`
--
ALTER TABLE
  `editions`
ADD
  CONSTRAINT `editions_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `members` (`id`);

--
-- Constraints for table `reports`
--
ALTER TABLE
  `reports`
ADD
  CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`edition_id`) REFERENCES `editions` (`id`),
ADD
  CONSTRAINT `reports_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `members` (`id`);

COMMIT;