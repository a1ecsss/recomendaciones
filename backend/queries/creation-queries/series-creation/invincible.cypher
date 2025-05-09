CREATE (s:Series {
    seriesId: '3',
    name: 'Invincible',
    rating: 8.7,
    numOfRatings: 500000,  // Aproximado de calificaciones en IMDb.
    description: 'Teenager Mark Grayson inherits superhuman abilities from his father, Omni-Man, and must learn to navigate the responsibilities of being a hero, while dealing with the legacy of his father’s actions.',
    year: 2021,
    duration: 45,
    totalSeasons: 1,
    totalEpisodes: 8
})

//director
CREATE (d3:Director {directorId: '3', name: 'Robert Kirkman', birthDate: '1978-11-30', nationality: 'American'})

//actores
CREATE (a9:Actor {actorId: '9', name: 'Steven Yeun', birthDate: '1983-12-12', nationality: 'South Korean-American'})
CREATE (a10:Actor {actorId: '10', name: 'J.K. Simmons', birthDate: '1955-01-09', nationality: 'American'})
CREATE (a11:Actor {actorId: '11', name: 'Sandra Oh', birthDate: '1971-07-20', nationality: 'Canadian'})

//ratings
CREATE (r5:Rating {ratingId: '5', ratingValue: 8.7, ratingSource: 'User', timestamp: '2023-05-10', ratingDescription: 'An exciting and action-packed animated series with great character development.'})
CREATE (r6:Rating {ratingId: '6', ratingValue: 8.5, ratingSource: 'Critic', timestamp: '2023-05-12', ratingDescription: 'A fresh take on the superhero genre, blending action with emotional depth.'})

//relacion genero
MATCH (s:Series {seriesId: '3'}), (g6:Genre {name: 'Action'}), (g7:Genre {name: 'Superhero'})
CREATE (s)-[:BELONGS_TO]->(g6)
CREATE (s)-[:BELONGS_TO]->(g7)

//relacion tags
MATCH (s:Series {seriesId: '3'}), (t8:Tag {name: 'Violence'}), (t9:Tag {name: 'Animated'}), (t10:Tag {name: 'Superpowers'})
CREATE (s)-[:HAS_TAG]->(t8)
CREATE (s)-[:HAS_TAG]->(t9)
CREATE (s)-[:HAS_TAG]->(t10)

//relacion idioma
MATCH (s:Series {seriesId: '3'}), (l3:Language {name: 'English'})
CREATE (s)-[:IS_IN_LANGUAGE]->(l3)

//relacion pais
MATCH (s:Series {seriesId: '3'}), (c3:Country {name: 'USA'})
CREATE (s)-[:PRODUCED_IN]->(c3)

//relacion director
MATCH (s:Series {seriesId: '3'}), (d3:Director {name: 'Robert Kirkman'})
CREATE (s)-[:DIRECTED_BY]->(d3)

//relacion actores
MATCH (s:Series {seriesId: '3'}), (a9:Actor {name: 'Steven Yeun'}), (a10:Actor {name: 'J.K. Simmons'}), (a11:Actor {name: 'Sandra Oh'})
CREATE (s)-[:HAS_ACTOR]->(a9)
CREATE (s)-[:HAS_ACTOR]->(a10)
CREATE (s)-[:HAS_ACTOR]->(a11)

//relacion ratings
MATCH (s:Series {seriesId: '3'}), (r5:Rating {ratingId: '5'}), (r6:Rating {ratingId: '6'})
CREATE (s)-[:HAS_RATING]->(r5)
CREATE (s)-[:HAS_RATING]->(r6)
