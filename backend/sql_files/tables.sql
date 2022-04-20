
DROP DATABASE IF EXISTS project_based_orgs;
CREATE DATABASE project_based_orgs;

DROP TABLE IF EXISTS project_based_orgs.official_organization;
CREATE TABLE project_based_orgs.official_organization (
  org_name varchar(250) NOT NULL,
  club_name varchar(250) NOT NULL,
  exec_name varchar(250) NOT NULL,
  contact_email varchar(250) NOT NULL,
  website varchar(250) NOT NULL,
  PRIMARY KEY (org_name),
  UNIQUE KEY org_name_UNIQUE (org_name),
  UNIQUE KEY club_name_UNIQUE (club_name)
);

DROP TABLE IF EXISTS project_based_orgs.project;
CREATE TABLE project_based_orgs.project (
  project_id int NOT NULL AUTO_INCREMENT,
  project_contact varchar(250) NOT NULL,
  project_description varchar(250) NOT NULL,
  budget varchar(250) DEFAULT NULL,
  time_interval varchar(250) DEFAULT NULL,
  project_title varchar(250) NOT NULL,
  PRIMARY KEY (project_id),
  UNIQUE KEY project_id_UNIQUE (project_id),
  UNIQUE KEY project_title_UNIQUE (project_title)
);

DROP TABLE IF EXISTS project_based_orgs.university;
CREATE TABLE project_based_orgs.university (
  university_name varchar(500) NOT NULL,
  city varchar(500) DEFAULT NULL,
  u_state varchar(500) DEFAULT NULL,
  website varchar(500) NOT NULL,
  PRIMARY KEY (university_name),
  UNIQUE KEY university_name_UNIQUE (university_name)
);

DROP TABLE IF EXISTS project_based_orgs.project_based_club;
CREATE TABLE project_based_orgs.project_based_club (
  club_name varchar(100) NOT NULL,
  president_name varchar(100) NOT NULL,
  advisor_name varchar(100) NOT NULL,
  contact_email varchar(100) NOT NULL,
  PRIMARY KEY (club_name),
  UNIQUE KEY club_name_UNIQUE (club_name)
);

DROP TABLE IF EXISTS project_based_orgs.registered;
CREATE TABLE project_based_orgs.registered (
  university_name varchar(500) NOT NULL,
  club_name varchar(500) NOT NULL,
  KEY university_name_UNIQUE (university_name),
  UNIQUE KEY club_name_UNIQUE (club_name),
  CONSTRAINT club_name FOREIGN KEY (club_name) REFERENCES project_based_club (club_name) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT university_name FOREIGN KEY (university_name) REFERENCES university (university_name) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS project_based_orgs.technology;
CREATE TABLE project_based_orgs.technology (
  technology_name varchar(100) NOT NULL,
  PRIMARY KEY (technology_name),
  UNIQUE KEY technology_name_UNIQUE (technology_name)
);

DROP TABLE IF EXISTS project_based_orgs.works_on;
CREATE TABLE project_based_orgs.works_on (
  project_title varchar (250) NOT NULL,
  club_name varchar(100) NOT NULL,
  UNIQUE KEY project_title_UNIQUE (project_title),
  KEY club_name_UNIQUE (club_name),
  CONSTRAINT project_title FOREIGN KEY (project_title) REFERENCES project (project_title) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS project_based_orgs.utilizes;
CREATE TABLE project_based_orgs.utilizes (
  project_title varchar (250) NOT NULL,
  technology_name varchar(100) NOT NULL,
  UNIQUE KEY Utilizescol_UNIQUE (technology_name),
  CONSTRAINT technology_name FOREIGN KEY (technology_name) REFERENCES technology (technology_name) ON DELETE CASCADE ON UPDATE CASCADE
);


