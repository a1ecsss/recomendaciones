MATCH (s:Series)
RETURN s.seriesId AS seriesId, 
       s.name AS name, 
       COALESCE(s.rating, 0.0) AS rating, 
       COALESCE(s.numOfRatings, 0) AS numOfRatings, 
       s.description AS description, 
       COALESCE(s.year, 0) AS year, 
       COALESCE(s.duration, 0) AS duration, 
       COALESCE(s.totalSeasons, 0) AS totalSeasons, 
       COALESCE(s.totalEpisodes, 0) AS totalEpisodes, 
       s.image AS image
ORDER BY s.name ASC
