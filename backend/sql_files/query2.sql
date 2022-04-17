SELECT p.project_title as "Project Title", p.time_interval as "Time Interval", p.budget as "Budget"
FROM project_based_orgs.project p, project_based_orgs.project_based_club c, project_based_orgs.works_on u
WHERE u.project_title = p.project_title 
AND u.club_name = c.club_name;
