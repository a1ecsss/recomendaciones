CREATE (s:Series {
    seriesId: '1',
    name: 'Breaking Bad',
    rating: 9.5,
    numOfRatings: 2000000,  // Este es un valor aproximado de calificaciones en IMDb.
    description: 'A high school chemistry teacher turned methamphetamine producer teams up with a former student to produce and sell crystal meth.',
    year: 2008,
    duration: 47,
    totalSeasons: 5,
    totalEpisodes: 62
})

//creacion de director
CREATE (d1:Director {directorId: '1', name: 'Vince Gilligan', birthDate: '1967-02-10', nationality: 'American'})

//creacion de actores
CREATE (a1:Actor {actorId: '1', name: 'Bryan Cranston', birthDate: '1956-03-07', nationality: 'American'})
CREATE (a2:Actor {actorId: '2', name: 'Aaron Paul', birthDate: '1979-08-27', nationality: 'American'})

//creacion de ratings
CREATE (r1:Rating {ratingId: '1', ratingValue: 9.5, ratingSource: 'User', timestamp: '2023-05-10', ratingDescription: 'An absolute masterpiece!'})
CREATE (r2:Rating {ratingId: '2', ratingValue: 9.5, ratingSource: 'Critic', timestamp: '2023-05-12', ratingDescription: 'A groundbreaking series that redefined TV.'})


//Relacion Entre Genero
MATCH (s:Series {seriesId: '1'}), (g1:Genre {name: 'Drama'}), (g2:Genre {name: 'Crime'}), (g3:Genre {name: 'Thriller'})
CREATE (s)-[:BELONGS_TO]->(g1)
CREATE (s)-[:BELONGS_TO]->(g2)
CREATE (s)-[:BELONGS_TO]->(g3)

//Relaciones de Tags
MATCH (s:Series {seriesId: '1'}), (t1:Tag {name: 'Crime'}), (t2:Tag {name: 'Suspense'}), (t3:Tag {name: 'Drug'}), (t4:Tag {name: 'Action'})
CREATE (s)-[:HAS_TAG]->(t1)
CREATE (s)-[:HAS_TAG]->(t2)
CREATE (s)-[:HAS_TAG]->(t3)
CREATE (s)-[:HAS_TAG]->(t4)

//Relación de Idiomas
MATCH (s:Series {seriesId: '1'}), (l1:Language {name: 'English'})
CREATE (s)-[:IS_IN_LANGUAGE]->(l1)

//Relación de Paises
MATCH (s:Series {seriesId: '1'}), (c1:Country {name: 'USA'})
CREATE (s)-[:PRODUCED_IN]->(c1)

//Relacion con director
MATCH (s:Series {seriesId: '1'}), (d1:Director {name: 'Vince Gilligan'})
CREATE (s)-[:DIRECTED_BY]->(d1)

//Relacion con actores
MATCH (s:Series {seriesId: '1'}), (a1:Actor {name: 'Bryan Cranston'}), (a2:Actor {name: 'Aaron Paul'})
CREATE (s)-[:HAS_ACTOR]->(a1)
CREATE (s)-[:HAS_ACTOR]->(a2)

//Relaciones de Rating
MATCH (s:Series {seriesId: '1'}), (r1:Rating {ratingId: '1'}), (r2:Rating {ratingId: '2'})
CREATE (s)-[:HAS_RATING]->(r1)
CREATE (s)-[:HAS_RATING]->(r2)
