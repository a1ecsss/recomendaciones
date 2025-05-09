CREATE (s:Series {
    seriesId: '4',
    name: 'Arcane',
    rating: 8.8,
    numOfRatings: 1000000,  // Aproximado de calificaciones en IMDb.
    description: 'Set in the utopian Piltover and the oppressed underground city of Zaun, the series follows the origins of two iconic characters from the League of Legends universe: Vi and Jinx.',
    year: 2021,
    duration: 50,
    totalSeasons: 1,
    totalEpisodes: 9
})

//director
CREATE (d4:Director {directorId: '4', name: 'Christian Linke', birthDate: '1980-07-01', nationality: 'German'})
CREATE (d5:Director {directorId: '5', name: 'Alex Yee', birthDate: '1982-03-15', nationality: 'American'})

//actores
CREATE (a12:Actor {actorId: '12', name: 'Hailee Steinfeld', birthDate: '1996-12-11', nationality: 'American'})
CREATE (a13:Actor {actorId: '13', name: 'Ella Purnell', birthDate: '1996-09-17', nationality: 'English'})
CREATE (a14:Actor {actorId: '14', name: 'Kevin Alejandro', birthDate: '1976-04-07', nationality: 'American'})

//ratings
CREATE (r7:Rating {ratingId: '7', ratingValue: 8.8, ratingSource: 'User', timestamp: '2023-05-10', ratingDescription: 'An amazing series with beautiful animation and gripping storytelling.'})
CREATE (r8:Rating {ratingId: '8', ratingValue: 8.9, ratingSource: 'Critic', timestamp: '2023-05-12', ratingDescription: 'A stunning visual experience that dives deep into the lore of League of Legends.'})

//relacion generos
MATCH (s:Series {seriesId: '4'}), (g8:Genre {name: 'Action'}), (g9:Genre {name: 'Adventure'})
CREATE (s)-[:BELONGS_TO]->(g8)
CREATE (s)-[:BELONGS_TO]->(g9)

//relacion tags
MATCH (s:Series {seriesId: '4'}), (t11:Tag {name: 'Superpowers'}), (t12:Tag {name: 'Animation'}), (t13:Tag {name: 'Fantasy'})
CREATE (s)-[:HAS_TAG]->(t11)
CREATE (s)-[:HAS_TAG]->(t12)
CREATE (s)-[:HAS_TAG]->(t13)

//relacion idiomas
MATCH (s:Series {seriesId: '4'}), (l4:Language {name: 'English'})
CREATE (s)-[:IS_IN_LANGUAGE]->(l4)

//relacion pais
MATCH (s:Series {seriesId: '4'}), (c4:Country {name: 'USA'})
CREATE (s)-[:PRODUCED_IN]->(c4)

//relacion directores
MATCH (s:Series {seriesId: '4'}), (d4:Director {name: 'Christian Linke'}), (d5:Director {name: 'Alex Yee'})
CREATE (s)-[:DIRECTED_BY]->(d4)
CREATE (s)-[:DIRECTED_BY]->(d5)

//r actores
MATCH (s:Series {seriesId: '4'}), (a12:Actor {name: 'Hailee Steinfeld'}), (a13:Actor {name: 'Ella Purnell'}), (a14:Actor {name: 'Kevin Alejandro'})
CREATE (s)-[:HAS_ACTOR]->(a12)
CREATE (s)-[:HAS_ACTOR]->(a13)
CREATE (s)-[:HAS_ACTOR]->(a14)

// ratings
MATCH (s:Series {seriesId: '4'}), (r7:Rating {ratingId: '7'}), (r8:Rating {ratingId: '8'})
CREATE (s)-[:HAS_RATING]->(r7)
CREATE (s)-[:HAS_RATING]->(r8)
