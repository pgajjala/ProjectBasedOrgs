SELECT p.project_title, u.state
FROM Project p, University u, Works_on w, Registered r, Project_Based_Club c
WHERE u.university_name = r.university_name
AND r.club_name = c.club_name
AND c.club_name = w.club_name
AND w.project_title = p.project_title
GROUP BY u.state;