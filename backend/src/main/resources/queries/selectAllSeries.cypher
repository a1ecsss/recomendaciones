MATCH (u:User {userId: $userId})
MATCH (s:Series)
OPTIONAL MATCH (u)-[likeRel:HAS_LIKED]->(s)
OPTIONAL MATCH (u)-[watchRel:HAS_WATCHED]->(s)
RETURN s.seriesId AS seriesId, 
       s.name AS name, 
       COALESCE(s.rating, 0.0) AS rating, 
       COALESCE(s.numOfRatings, 0) AS numOfRatings, 
       s.description AS description, 
       COALESCE(s.year, 0) AS year, 
       COALESCE(s.duration, 0) AS duration, 
       COALESCE(s.totalSeasons, 0) AS totalSeasons, 
       COALESCE(s.totalEpisodes, 0) AS totalEpisodes, 
       s.image AS image,
       CASE WHEN likeRel IS NULL THEN false ELSE true END AS hasLiked,
       CASE WHEN watchRel IS NULL THEN false ELSE true END AS hasWatched
ORDER BY s.name ASC
