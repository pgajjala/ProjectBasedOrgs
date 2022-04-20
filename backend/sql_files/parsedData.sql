LOAD DATA INFILE 'backend/sql_files/fake_data/University.csv'   
INTO TABLE project_based_orgs.university  
FIELDS TERMINATED BY ','  
OPTIONALLY ENCLOSED BY '"'  
LINES TERMINATED BY '\r\n'   
IGNORE 1 ROWS;  