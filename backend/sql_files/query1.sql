SELECT P.project_title, P.projectj_contact, T.technology_name
        FROM Project P, Technology T, Utilizes U
        WHERE U.proj_id = P.proj_id
        AND U.technology_name = T.technology_name
        AND GROUP BY T.technology_name