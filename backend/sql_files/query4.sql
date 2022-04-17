SELECT p.project_id as "Project ID", c.club_name as "Club Name"
FROM project_based_orgs.project p, project_based_orgs.works_on w, project_based_orgs.project_based_club c
WHERE p.project_title = w.project_title
AND w.club_name = c.club_name;
