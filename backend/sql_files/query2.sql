SELECT p.project_title, p.time_interval, p.budget
FROM project_based_orgs.project p, project_based_orgs.project_based_club c, project_based_orgs.works_on u
WHERE u.project_id = p.project_id 
AND u.club_name = c.club_name;
