SELECT P.project_title, P.project_contact, T.technology_name
        FROM project_based_orgs.project P, project_based_orgs.technology T, project_based_orgs.utilizes U
        WHERE U.project_id = P.project_id
        AND U.technology_name = T.technology_name
        GROUP BY T.technology_name;