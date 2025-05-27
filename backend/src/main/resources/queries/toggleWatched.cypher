// Alternar HAS_WATCHED
MATCH (u:User {userId: $userId})
MATCH (s:Series {seriesId: $seriesId})
OPTIONAL MATCH (u)-[r:HAS_WATCHED]->(s)
WITH u, s, r
CALL apoc.do.when(
  r IS NULL,
  'CREATE (u)-[:HAS_WATCHED]->(s)',
  'DELETE r',
  {u: u, s: s, r: r}
)
YIELD value
RETURN value
