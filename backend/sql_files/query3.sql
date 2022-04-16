SELECT U.university_name, T.technology_name
        FROM University U, Technology T, Registered R, Project_Based_Club C, Official_Organization O, Oversees Ov, Works_On W, Project P1, Utilizes U
        WHERE U.university_name = R.university_name
        AND R.club_name = C.club_name
        AND O.club_name = C.club_name
        AND Ov.O_name = O.O_name
        AND W.club_name = C.club_name
        AND W.project_title = P1.project_title
        AND U.project_title = P1.project_title
        AND U.technology_name = T.technology_name
        GROUP BY O.O_name