SELECT p.project_id, c.club_name
FROM project_based_orgs.project p, project_based_orgs.works_on w, project_based_orgs.project_based_club c
WHERE p.project_id = w.project_id
AND w.club_name = c.club_name;
