// Alternar HAS_LIKED
MATCH (u:User {userId: $userId})
MATCH (s:Series {seriesId: $seriesId})
OPTIONAL MATCH (u)-[r:HAS_LIKED]->(s)
WITH u, s, r
CALL apoc.do.when(
  r IS NULL,
  'CREATE (u)-[:HAS_LIKED]->(s)',
  'DELETE r',
  {u: u, s: s, r: r}
)
YIELD value
RETURN value
