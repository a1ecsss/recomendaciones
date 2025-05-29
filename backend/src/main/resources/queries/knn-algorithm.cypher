// Algoritmo KNN para recomendaciones
MATCH (u:User {userId: $userId})-[:HAS_LIKED]->(liked:Series)
WITH u, collect(liked) AS likedSeries

// Buscar TODAS las series NO vistas por el usuario
MATCH (s:Series)
WHERE NOT (u)-[:HAS_WATCHED]->(s)
  AND NOT (u)-[:HAS_LIKED]->(s)

// Calcular la puntuacion basada en coincidencias ponderadas
OPTIONAL MATCH (s)-[:BELONGS_TO]->(g:Genre)<-[:BELONGS_TO]-(likedGenre:Series)
WHERE likedGenre IN likedSeries
WITH u, s, likedSeries, count(g) * u.importanceGenre AS genreScore

OPTIONAL MATCH (s)-[:HAS_ACTOR]->(a:Actor)<-[:HAS_ACTOR]-(likedActor:Series)
WHERE likedActor IN likedSeries
WITH u, s, likedSeries, genreScore, count(a) * u.importanceActor AS actorScore

OPTIONAL MATCH (s)-[:DIRECTED_BY]->(d:Director)<-[:DIRECTED_BY]-(likedDirector:Series)
WHERE likedDirector IN likedSeries
WITH u, s, likedSeries, genreScore, actorScore, count(d) * u.importanceDirector AS directorScore

OPTIONAL MATCH (s)-[:IS_IN_LANGUAGE]->(l:Language)<-[:IS_IN_LANGUAGE]-(likedLanguage:Series)
WHERE likedLanguage IN likedSeries
WITH u, s, likedSeries, genreScore, actorScore, directorScore, count(l) * u.importanceLanguage AS languageScore

OPTIONAL MATCH (s)-[:PRODUCED_IN]->(c:Country)<-[:PRODUCED_IN]-(likedCountry:Series)
WHERE likedCountry IN likedSeries
WITH u, s, likedSeries, genreScore, actorScore, directorScore, languageScore, count(c) * u.importanceCountry AS countryScore

// NUEVO: Calcular coincidencias de tags (peso uniforme, sin importancia del usuario)
OPTIONAL MATCH (s)-[:HAS_TAG]->(tag:Tag)<-[:HAS_TAG]-(likedTag:Series)
WHERE likedTag IN likedSeries
WITH u, s, genreScore, actorScore, directorScore, languageScore, countryScore, count(tag) AS tagScore, likedSeries

// Calcular promedios de año y duración usando reduce y size
WITH u, s, genreScore, actorScore, directorScore, languageScore, countryScore, tagScore,
     abs(s.year - (reduce(total = 0.0, ls IN likedSeries | total + ls.year) / CASE WHEN size(likedSeries) = 0 THEN 1 ELSE size(likedSeries) END)) * u.importanceYear AS yearDiff,
     abs(s.duration - (reduce(total = 0.0, ls IN likedSeries | total + ls.duration) / CASE WHEN size(likedSeries) = 0 THEN 1 ELSE size(likedSeries) END)) * u.importanceDuration AS durationDiff,
     s.rating * u.importanceRating AS ratingScore

// Calcular la puntuación final
WITH s,
     genreScore + actorScore + directorScore + languageScore + countryScore + tagScore + ratingScore
     - yearDiff - durationDiff AS totalScore

ORDER BY totalScore DESC
LIMIT 8

RETURN 
    s.seriesId AS seriesId,
    s.name AS name,
    s.rating AS rating,
    s.numOfRatings AS numOfRatings,
    s.description AS description,
    s.year AS year,
    s.duration AS duration,
    s.totalSeasons AS totalSeasons,
    s.totalEpisodes AS totalEpisodes,
    s.image AS image,
    totalScore
