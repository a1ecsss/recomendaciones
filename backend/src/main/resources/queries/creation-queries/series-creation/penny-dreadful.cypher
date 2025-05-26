// Crear la serie (MERGE para evitar duplicados)
MERGE (s:Series {
    seriesId: '21',
    name: 'Penny Dreadful'
})
ON CREATE SET s.rating = 8.2,
              s.numOfRatings = 133000,
              s.description = 'Penny Dreadful es una serie de terror gótico ambientada en el Londres victoriano, que entrelaza las historias de personajes clásicos como Drácula, Frankenstein y Dorian Gray en una narrativa oscura y psicológica.',
              s.year = 2014,
              s.duration = 55,
              s.totalSeasons = 3,
              s.totalEpisodes = 27,
              s.image = 'penny-dreadful.png'

// MERGE de géneros
MERGE (g1:Genre {name: 'Horror'})
MERGE (g2:Genre {name: 'Drama'})
MERGE (g3:Genre {name: 'Fantasy'})
MERGE (g4:Genre {name: 'Thriller'})
// Relacionar géneros
MERGE (s)-[:BELONGS_TO]->(g1)
MERGE (s)-[:BELONGS_TO]->(g2)
MERGE (s)-[:BELONGS_TO]->(g3)
MERGE (s)-[:BELONGS_TO]->(g4)

// MERGE de tags
MERGE (t1:Tag {name: 'Gothic'})
MERGE (t2:Tag {name: 'Supernatural'})
MERGE (t3:Tag {name: 'Victorian'})
MERGE (t4:Tag {name: 'Psychological'})
// Relacionar tags
MERGE (s)-[:HAS_TAG]->(t1)
MERGE (s)-[:HAS_TAG]->(t2)
MERGE (s)-[:HAS_TAG]->(t3)
MERGE (s)-[:HAS_TAG]->(t4)

// MERGE de idioma
MERGE (l:Language {name: 'English'})
MERGE (s)-[:IS_IN_LANGUAGE]->(l)
// MERGE de país
MERGE (c:Country {name: 'United Kingdom'})
MERGE (s)-[:PRODUCED_IN]->(c)

// MERGE de director
MERGE (d:Director {name: 'Juan Antonio Bayona'})
MERGE (s)-[:DIRECTED_BY]->(d)

// MERGE de actores
MERGE (a1:Actor {name: 'Eva Green'})
MERGE (a2:Actor {name: 'Josh Hartnett'})
MERGE (a3:Actor {name: 'Timothy Dalton'})
MERGE (a4:Actor {name: 'Reeve Carney'})
MERGE (a5:Actor {name: 'Rory Kinnear'})
MERGE (a6:Actor {name: 'Billie Piper'})
MERGE (a7:Actor {name: 'Harry Treadaway'})
MERGE (a8:Actor {name: 'Danny Sapani'})
MERGE (a9:Actor {name: 'Helen McCrory'})
MERGE (a10:Actor {name: 'Patti LuPone'})
// Relacionar actores
MERGE (s)-[:HAS_ACTOR]->(a1)
MERGE (s)-[:HAS_ACTOR]->(a2)
MERGE (s)-[:HAS_ACTOR]->(a3)
MERGE (s)-[:HAS_ACTOR]->(a4)
MERGE (s)-[:HAS_ACTOR]->(a5)
MERGE (s)-[:HAS_ACTOR]->(a6)
MERGE (s)-[:HAS_ACTOR]->(a7)
MERGE (s)-[:HAS_ACTOR]->(a8)
MERGE (s)-[:HAS_ACTOR]->(a9)
MERGE (s)-[:HAS_ACTOR]->(a10)
