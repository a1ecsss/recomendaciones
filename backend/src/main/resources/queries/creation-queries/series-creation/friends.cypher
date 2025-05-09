CREATE (s:Series {
    seriesId: '2',
    name: 'Friends',
    rating: 8.8,
    numOfRatings: 1500000,  // Aproximado de calificaciones en IMDb.
    description: 'Follows the lives of six 20-something friends living in Manhattan as they navigate life, love, and laughter.',
    year: 1994,
    duration: 22,
    totalSeasons: 10,
    totalEpisodes: 236
})

//director
CREATE (d2:Director {directorId: '2', name: 'David Crane', birthDate: '1957-08-13', nationality: 'American'})

//actores
CREATE (a3:Actor {actorId: '3', name: 'Jennifer Aniston', birthDate: '1969-02-11', nationality: 'American'})
CREATE (a4:Actor {actorId: '4', name: 'Courteney Cox', birthDate: '1964-06-15', nationality: 'American'})
CREATE (a5:Actor {actorId: '5', name: 'Lisa Kudrow', birthDate: '1963-07-30', nationality: 'American'})
CREATE (a6:Actor {actorId: '6', name: 'Matt LeBlanc', birthDate: '1967-07-25', nationality: 'American'})
CREATE (a7:Actor {actorId: '7', name: 'Matthew Perry', birthDate: '1969-08-19', nationality: 'American'})
CREATE (a8:Actor {actorId: '8', name: 'David Schwimmer', birthDate: '1966-11-02', nationality: 'American'})

//calificaciones
CREATE (r3:Rating {ratingId: '3', ratingValue: 8.8, ratingSource: 'User', timestamp: '2023-05-10', ratingDescription: 'An iconic comedy with unforgettable characters and moments.'})
CREATE (r4:Rating {ratingId: '4', ratingValue: 8.9, ratingSource: 'Critic', timestamp: '2023-05-12', ratingDescription: 'A masterclass in ensemble comedy and timing.'})

//relacion genero
MATCH (s:Series {seriesId: '2'}), (g4:Genre {name: 'Comedy'}), (g5:Genre {name: 'Romance'})
CREATE (s)-[:BELONGS_TO]->(g4)
CREATE (s)-[:BELONGS_TO]->(g5)

//relacion tags
MATCH (s:Series {seriesId: '2'}), (t5:Tag {name: 'Sitcom'}), (t6:Tag {name: 'Romantic Comedy'}), (t7:Tag {name: 'Ensemble Cast'})
CREATE (s)-[:HAS_TAG]->(t5)
CREATE (s)-[:HAS_TAG]->(t6)
CREATE (s)-[:HAS_TAG]->(t7)

//relacion idiomas
MATCH (s:Series {seriesId: '2'}), (l2:Language {name: 'English'})
CREATE (s)-[:IS_IN_LANGUAGE]->(l2)

//relacion pais
MATCH (s:Series {seriesId: '2'}), (c2:Country {name: 'USA'})
CREATE (s)-[:PRODUCED_IN]->(c2)

//relacion director
MATCH (s:Series {seriesId: '2'}), (d2:Director {name: 'David Crane'})
CREATE (s)-[:DIRECTED_BY]->(d2)

//relacion directores
MATCH (s:Series {seriesId: '2'}), (a3:Actor {name: 'Jennifer Aniston'}), (a4:Actor {name: 'Courteney Cox'}), (a5:Actor {name: 'Lisa Kudrow'}), 
      (a6:Actor {name: 'Matt LeBlanc'}), (a7:Actor {name: 'Matthew Perry'}), (a8:Actor {name: 'David Schwimmer'})
CREATE (s)-[:HAS_ACTOR]->(a3)
CREATE (s)-[:HAS_ACTOR]->(a4)
CREATE (s)-[:HAS_ACTOR]->(a5)
CREATE (s)-[:HAS_ACTOR]->(a6)
CREATE (s)-[:HAS_ACTOR]->(a7)
CREATE (s)-[:HAS_ACTOR]->(a8)

//relacion ratings
MATCH (s:Series {seriesId: '2'}), (r3:Rating {ratingId: '3'}), (r4:Rating {ratingId: '4'})
CREATE (s)-[:HAS_RATING]->(r3)
CREATE (s)-[:HAS_RATING]->(r4)
