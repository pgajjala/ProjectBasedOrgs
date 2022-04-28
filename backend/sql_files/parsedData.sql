LOAD DATA LOCAL INFILE 'backend/sql_files/fake_data/University.csv'   
INTO TABLE project_based_orgs.university  
FIELDS TERMINATED BY ','  
OPTIONALLY ENCLOSED BY '"'  
LINES TERMINATED BY '\r\n'   
IGNORE 1 ROWS;  

LOAD DATA LOCAL INFILE 'backend/sql_files/fake_data/Official_Organization.csv'   
INTO TABLE project_based_orgs.official_organization  
FIELDS TERMINATED BY ','  
OPTIONALLY ENCLOSED BY '"'  
LINES TERMINATED BY '\r\n'   
IGNORE 1 ROWS;  

LOAD DATA LOCAL INFILE 'backend/sql_files/fake_data/Project_Based_Clubs.csv'   
INTO TABLE project_based_orgs.project_based_club
FIELDS TERMINATED BY ','  
OPTIONALLY ENCLOSED BY '"'  
LINES TERMINATED BY '\r\n'   
IGNORE 1 ROWS; 

LOAD DATA LOCAL INFILE 'backend/sql_files/fake_data/Project.csv'   
INTO TABLE project_based_orgs.project
FIELDS TERMINATED BY ','  
OPTIONALLY ENCLOSED BY '"'  
LINES TERMINATED BY '\r\n'   
IGNORE 1 ROWS; 

LOAD DATA LOCAL INFILE 'backend/sql_files/fake_data/Technology.csv'   
INTO TABLE project_based_orgs.technology  
FIELDS TERMINATED BY ','  
OPTIONALLY ENCLOSED BY '"'  
LINES TERMINATED BY '\r\n'   
IGNORE 1 ROWS; 
