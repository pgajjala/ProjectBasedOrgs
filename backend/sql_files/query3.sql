SELECT DISTINCT C.club_name
FROM project_based_orgs.project_based_club C, project_based_orgs.works_on W, project_based_orgs.project P1
        WHERE EXISTS (SELECT P.project_title 
                FROM project_based_orgs.project P, project_based_orgs.technology T, project_based_orgs.utilizes U  
                WHERE T.technology_name = 'Arduino'
                AND U.technology_name = T.technology_name
                AND P.project_title = U.project_title
                AND P.project_title = P1.project_title)
	AND P1.project_title = W.project_title
	AND W.club_name = C.club_name;