
DROP DATABASE IF EXISTS project_based_orgs;
CREATE DATABASE project_based_orgs;

DROP TABLE IF EXISTS project_based_orgs.official_organization;
CREATE TABLE project_based_orgs.official_organization (
  org_name varchar(250) NOT NULL,
  club_name varchar(250) NOT NULL,
  exec_name varchar(250) NOT NULL,
  contact_email varchar(250) NOT NULL,
  website varchar(250) NOT NULL,
  PRIMARY KEY (org_name)
);


DROP TABLE IF EXISTS project_based_orgs.project;
CREATE TABLE project_based_orgs.project (
  project_id int NOT NULL AUTO_INCREMENT,
  project_title varchar(250) NOT NULL,
  project_contact varchar(250) NOT NULL,
  project_description varchar(250) NOT NULL,
  budget int NOT NULL,
  time_interval varchar(250) NOT NULL,
  PRIMARY KEY (project_id,project_title),
  UNIQUE KEY project_title_UNIQUE (project_title)
);


DROP TABLE IF EXISTS project_based_orgs.university;
CREATE TABLE project_based_orgs.university (
  university_name varchar(250) NOT NULL,
  city varchar(250) NOT NULL,
  u_state varchar(250) NOT NULL,
  website varchar(250) NOT NULL,
  PRIMARY KEY (university_name)
);


DROP TABLE IF EXISTS project_based_orgs.project_based_club;
CREATE TABLE project_based_orgs.project_based_club (
  club_name varchar(250) NOT NULL,
  president_name varchar(250) NOT NULL,
  advisor_name varchar(250) NOT NULL,
  contact_email varchar(250) NOT NULL,
  PRIMARY KEY (club_name),
  UNIQUE KEY club_name_UNIQUE (club_name)
);


DROP TABLE IF EXISTS project_based_orgs.registered;
CREATE TABLE project_based_orgs.registered (
  university_name varchar(250) NOT NULL,
  club_name varchar(250) NOT NULL,
  KEY universityname_fk_idx (university_name),
  KEY clubname_fk_idx (club_name),
  CONSTRAINT clubname_fk FOREIGN KEY (club_name) REFERENCES project_based_club (club_name) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT universityname_fk FOREIGN KEY (university_name) REFERENCES university (university_name) ON DELETE CASCADE ON UPDATE CASCADE
);


DROP TABLE IF EXISTS project_based_orgs.technology;
CREATE TABLE project_based_orgs.technology (
  technology_name varchar(250) NOT NULL,
  PRIMARY KEY (technology_name)
);


DROP TABLE IF EXISTS project_based_orgs.works_on;
CREATE TABLE project_based_orgs.works_on (
  project_title varchar(250) NOT NULL,
  club_name varchar(250) NOT NULL,
  KEY projecttitle_fk_idx (project_title),
  KEY clubname_fk_idx (club_name),
  CONSTRAINT cname_fk FOREIGN KEY (club_name) REFERENCES project_based_club (club_name) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT title_fk FOREIGN KEY (project_title) REFERENCES project (project_title) ON DELETE CASCADE ON UPDATE CASCADE
);


DROP TABLE IF EXISTS project_based_orgs.utilizes;
CREATE TABLE utilizes (
  project_title varchar(250) NOT NULL,
  technoloy_name varchar(250) NOT NULL,
  KEY projecttitle_fk_idx (project_title),
  KEY technologyname_fk_idx (technoloy_name),
  CONSTRAINT projecttitle_fk FOREIGN KEY (project_title) REFERENCES project (project_title) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT technologyname_fk FOREIGN KEY (technoloy_name) REFERENCES technology (technology_name) ON DELETE CASCADE ON UPDATE CASCADE
);



