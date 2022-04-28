

LOAD DATA LOCAL INFILE 'backend/sql_files/fake_data/Utilizes.csv'   
INTO TABLE project_based_orgs.utilizes  
FIELDS TERMINATED BY ','  
OPTIONALLY ENCLOSED BY '"'  
LINES TERMINATED BY '\r\n'   
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'backend/sql_files/fake_data/Works_on.csv'   
INTO TABLE project_based_orgs.works_on
FIELDS TERMINATED BY ','  
OPTIONALLY ENCLOSED BY '"'  
LINES TERMINATED BY '\r\n'   
IGNORE 1 ROWS;  

LOAD DATA LOCAL INFILE 'backend/sql_files/fake_data/Registered.csv'   
INTO TABLE project_based_orgs.registered  
FIELDS TERMINATED BY ','  
OPTIONALLY ENCLOSED BY '"'  
LINES TERMINATED BY '\r\n'   
IGNORE 1 ROWS; 