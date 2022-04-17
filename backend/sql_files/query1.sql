SELECT P.project_title, P.projectj_contact, T.technology_name
        FROM project_based_orgs.project P, project_based_orgs.technology T, project_based_orgs.utilizes U
        WHERE U.proj_id = P.proj_id
        AND U.technology_name = T.technology_name
        AND GROUP BY T.technology_name;