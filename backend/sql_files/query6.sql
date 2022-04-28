SELECT p.project_title as "Project Title", u.u_state "University State"
FROM project_based_orgs.project p, project_based_orgs.university u, project_based_orgs.works_on w, project_based_orgs.registered r, project_based_orgs.project_based_club c
WHERE u.university_name = r.university_name
AND r.club_name = c.club_name
AND c.club_name = w.club_name
AND w.project_title = p.project_title
ORDER BY u.u_state;