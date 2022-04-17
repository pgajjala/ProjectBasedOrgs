SELECT U.university_name, T.technology_name
        FROM project_based_orgs.university U, project_based_orgs.technology T, project_based_orgs.registered R, project_based_orgs.project_based_club C, project_based_orgs.official_Organization O, project_based_orgs.Oversees Ov, project_based_orgs.Works_On W, project_based_orgs.Project P1, project_based_orgs.Utilizes U
        WHERE U.university_name = R.university_name
        AND R.club_name = C.club_name
        AND O.club_name = C.club_name
        AND Ov.O_name = O.O_name
        AND W.club_name = C.club_name
        AND W.project_title = P1.project_title
        AND U.project_title = P1.project_title
        AND U.technology_name = T.technology_name
        GROUP BY O.O_name;