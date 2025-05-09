MATCH (s:Series)-[:BELONGS_TO]->(g:Genre)<-[:BELONGS_TO]-(recommended:Series)
WHERE s.name = $name
WITH recommended, COUNT(gATCH (s)-[:HAS_ACTOR]->(a:Actor)<-[:HAS_ACTOR]-(recommended)
WITH recommended, genreSimilarity, COUNT(a) AS actorSimilarity
MATCH (s)-[:HAS_TAG]->(t:Tag)<-[:HAS_TAG]-(recommended)
WITH recommended, genreSimilarity, actorSimilarity, COUNT(t) AS tagSimilarity
MATCH (s)-[:HAS_RATING]->(r:Rating)<-[:HAS_RATING]-(recommended)
WITH recommended, genreSimilarity, actorSimilarity, tagSimilarity, AVG(r.ratingValue) AS ratingSimilarity
RETURN recommended.name AS RecommendedSeries, genreSimilarity + actorSimilarity + tagSimilarity + ratingSimilarity AS TotalSimilarity
ORDER BY TotalSimilarity DESC
LIMIT 1;) AS genreSimilarity
M
