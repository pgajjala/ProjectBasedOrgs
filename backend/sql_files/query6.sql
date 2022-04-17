SELECT p.project_title, u.u_state
FROM project_based_orgs.project p, project_based_orgs.university u, project_based_orgs.works_on w, project_based_orgs.registered r, project_based_orgs.project_based_club c
WHERE u.university_name = r.university_name
AND r.club_name = c.club_name
AND c.club_name = w.club_name
AND w.project_id = p.project_id
GROUP BY u.u_state;