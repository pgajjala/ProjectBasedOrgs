SELECT C.president_name as "Club President Name", C.club_name as "Club Name"
	        FROM project_based_orgs.project_based_club C
	        GROUP BY C.club_name;
