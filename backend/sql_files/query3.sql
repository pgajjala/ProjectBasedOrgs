SELECT Un.university_name as "University Name", T.technology_name as "Technology Name"
        FROM project_based_orgs.university Un, project_based_orgs.technology T, project_based_orgs.registered R, project_based_orgs.project_based_club C, project_based_orgs.official_Organization O, project_based_orgs.Works_On W, project_based_orgs.Project P1, project_based_orgs.Utilizes U
        WHERE Un.university_name = R.university_name
        AND R.club_name = C.club_name
        AND O.club_name = C.club_name
        AND W.club_name = C.club_name
        AND W.project_title = P1.project_title
        AND U.project_title = P1.project_title
        AND U.technology_name = T.technology_name
        GROUP BY O.org_name;