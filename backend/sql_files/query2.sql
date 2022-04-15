SELECT p.project_title, p.time_interval, p.budget
FROM Project p, Project_Based_Club c, Utilizes u
WHERE u.project_title = p.project_title 
AND u.club_name = c.club_name
