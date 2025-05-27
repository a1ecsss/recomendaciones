// Algoritmo KNN para recomendaciones
MATCH (u:User {userId: $userId})-[:HAS_LIKED]->(liked:Series)
WITH u, collect(liked) AS likedSeries

// buscar TODAS las series NO vistas por el usuario
MATCH (s:Series)
WHERE NOT (u)-[:HAS_WATCHED]->(s)

// calcular la puntuacion basada en coincidencias ponderadas
OPTIONAL MATCH (s)-[:BELONGS_TO]->(g:Genre)<-[:BELONGS_TO]-(liked)
WITH u, s, likedSeries, count(g) * u.importanceGenre AS genreScore

OPTIONAL MATCH (s)-[:HAS_ACTOR]->(a:Actor)<-[:HAS_ACTOR]-(liked)
WITH u, s, genreScore, count(a) * u.importanceActor AS actorScore

OPTIONAL MATCH (s)-[:DIRECTED_BY]->(d:Director)<-[:DIRECTED_BY]-(liked)
WITH u, s, genreScore, actorScore, count(d) * u.importanceDirector AS directorScore

OPTIONAL MATCH (s)-[:IS_IN_LANGUAGE]->(l:Language)<-[:IS_IN_LANGUAGE]-(liked)
WITH u, s, genreScore, actorScore, directorScore, count(l) * u.importanceLanguage AS languageScore

OPTIONAL MATCH (s)-[:PRODUCED_IN]->(c:Country)<-[:PRODUCED_IN]-(liked)
WITH u, s, genreScore, actorScore, directorScore, languageScore, count(c) * u.importanceCountry AS countryScore

// sumar las puntuaciones de año, rating y duracion
WITH u, s, genreScore, actorScore, directorScore, languageScore, countryScore,
     abs(s.year - avg(liked.year)) * u.importanceYear AS yearDiff,
     abs(s.duration - avg(liked.duration)) * u.importanceDuration AS durationDiff,
     s.rating * u.importanceRating AS ratingScore

// calcular la puntuación final -> considerar la formula
WITH s,
     genreScore + actorScore + directorScore + languageScore + countryScore + ratingScore
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