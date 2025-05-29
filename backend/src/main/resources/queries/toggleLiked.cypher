MATCH (u:User {userId: $userId})
MATCH (s:Series {seriesId: $seriesId})
OPTIONAL MATCH (u)-[r:HAS_LIKED]->(s)
WITH u, s, r
FOREACH (_ IN CASE WHEN r IS NULL THEN [1] ELSE [] END |
  CREATE (u)-[:HAS_LIKED]->(s)
)
FOREACH (_ IN CASE WHEN r IS NOT NULL THEN [1] ELSE [] END |
  DELETE r
)
RETURN s.seriesId AS seriesId, s.name AS name
