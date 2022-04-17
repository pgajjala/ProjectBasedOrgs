CREATE DATABASE project_based_orgs;
CREATE TABLE project_based_orgs.official_organization (
  org_name varchar(1000) NOT NULL,
  club_name varchar(1000) NOT NULL,
  exec_name varchar(1000) NOT NULL,
  contact_email varchar(1000) NOT NULL,
  website varchar(1000) NOT NULL,
  PRIMARY KEY (org_name),
  UNIQUE KEY org_name_UNIQUE (org_name),
  UNIQUE KEY club_name_UNIQUE (club_name)
);

CREATE TABLE project_based_orgs.project (
  project_id int NOT NULL AUTO_INCREMENT,
  project_contact varchar(1000) NOT NULL,
  description varchar(1000) NOT NULL,
  budget int DEFAULT NULL,
  time_interval varchar(1000) DEFAULT NULL,
  project_title varchar(500) NOT NULL,
  PRIMARY KEY (project_id),
  UNIQUE KEY project_id_UNIQUE (project_id),
  UNIQUE KEY project_title_UNIQUE (project_title)
);

CREATE TABLE project_based_orgs.project_based_club (
  club_name varchar(100) NOT NULL,
  president_name varchar(100) NOT NULL,
  advisor_name varchar(100) NOT NULL,
  contact_email varchar(100) NOT NULL,
  PRIMARY KEY (club_name),
  UNIQUE KEY club_name_UNIQUE (club_name)
);

CREATE TABLE project_based_orgs.registered (
  university_name varchar(500) NOT NULL,
  club_name varchar(500) NOT NULL,
  UNIQUE KEY university_name_UNIQUE (university_name),
  UNIQUE KEY club_name_UNIQUE (club_name),
  CONSTRAINT club_name FOREIGN KEY (club_name) REFERENCES project_based_club (club_name),
  CONSTRAINT university_name FOREIGN KEY (university_name) REFERENCES university (university_name)
);

CREATE TABLE project_based_orgs.registered (
  university_name varchar(500) NOT NULL,
  club_name varchar(500) NOT NULL,
  UNIQUE KEY university_name_UNIQUE (university_name),
  UNIQUE KEY club_name_UNIQUE (club_name),
  CONSTRAINT club_name FOREIGN KEY (club_name) REFERENCES project_based_club (club_name),
  CONSTRAINT university_name FOREIGN KEY (university_name) REFERENCES university (university_name)
);


CREATE TABLE project_based_orgs.university (
  university_name varchar(500) NOT NULL,
  address varchar(500) DEFAULT NULL,
  website varchar(500) NOT NULL,
  PRIMARY KEY (university_name),
  UNIQUE KEY university_name_UNIQUE (university_name)
);

CREATE TABLE project_based_orgs.utilizes (
  project_id int NOT NULL,
  technology_name varchar(500) NOT NULL,
  UNIQUE KEY Utilizescol_UNIQUE (technology_name),
  UNIQUE KEY project_id_UNIQUE (project_id),
  CONSTRAINT project_id FOREIGN KEY (project_id) REFERENCES project (project_id),
  CONSTRAINT technology_name FOREIGN KEY (technology_name) REFERENCES technology (technology_name)
);

CREATE TABLE project_based_orgs.works_on (
  project_id int NOT NULL,
  club_name varchar(100) NOT NULL,
  UNIQUE KEY project_id_UNIQUE (project_id),
  UNIQUE KEY club_name_UNIQUE (club_name),
  CONSTRAINT works_on_ibfk_1 FOREIGN KEY (project_id) REFERENCES project (project_id)
);

CREATE TABLE project_based_orgs.technology (
  technology_name varchar(100) NOT NULL,
  PRIMARY KEY (technology_name),
  UNIQUE KEY University_Name_UNIQUE (technology_name)
);

DROP DATABASE project_based_orgs;
 

