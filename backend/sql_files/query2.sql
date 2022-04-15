Select p.project_title, p.time_interval, p.budget
From Project p, Project_Based_Club c, Utilizes u
Where u.project_title = p.project_title 
AND u.club_name = c.club_name
