SELECT p.project_title, c.club_name
FROM Project p, Works_on w, Project_Based_Club c
WHERE p.project_title = w.project_title
AND w.club_name = c.club_name
