SELECT P.project_title as "Project Title", P.project_contact "Project Contact ", T.technology_name as "Technology"
        FROM project_based_orgs.project P, project_based_orgs.technology T, project_based_orgs.utilizes U
        WHERE U.project_title = P.project_title
        AND U.technology_name = T.technology_name
        GROUP BY T.technology_name;