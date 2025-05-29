// Crear la serie (MERGE para evitar duplicados)
MERGE (s:Series {
    seriesId: '24',
    name: 'On My Block'
})
ON CREATE SET s.rating = 7.9,
              s.numOfRatings = 27000,
              s.description = 'Cuatro adolescentes de un barrio peligroso de Los Ángeles navegan por los altibajos de la amistad y la vida escolar mientras lidian con desafíos propios de su entorno.',
              s.year = 2018,
              s.duration = 30,
              s.totalSeasons = 4,
              s.totalEpisodes = 38,
              s.image = 'on-my-block.png'

// MERGE de géneros
MERGE (g1:Genre {name: 'Comedy'})
MERGE (g2:Genre {name: 'Drama'})
MERGE (g3:Genre {name: 'Teen'})
MERGE (g4:Genre {name: 'Coming-of-age'})
// Relacionar géneros
MERGE (s)-[:BELONGS_TO]->(g1)
MERGE (s)-[:BELONGS_TO]->(g2)
MERGE (s)-[:BELONGS_TO]->(g3)
MERGE (s)-[:BELONGS_TO]->(g4)

// MERGE de tags
MERGE (t1:Tag {name: 'Teen'})
MERGE (t2:Tag {name: 'Comedy'})
MERGE (t3:Tag {name: 'Friendship'})
MERGE (t4:Tag {name: 'Los Angeles'})
MERGE (t5:Tag {name: 'Coming-of-age'})
MERGE (t6:Tag {name: 'Urban'})
MERGE (t7:Tag {name: 'Drama'})
// Relacionar tags
MERGE (s)-[:HAS_TAG]->(t1)
MERGE (s)-[:HAS_TAG]->(t2)
MERGE (s)-[:HAS_TAG]->(t3)
MERGE (s)-[:HAS_TAG]->(t4)
MERGE (s)-[:HAS_TAG]->(t5)
MERGE (s)-[:HAS_TAG]->(t6)
MERGE (s)-[:HAS_TAG]->(t7)

// MERGE de idioma
MERGE (l:Language {name: 'English'})
MERGE (s)-[:IS_IN_LANGUAGE]->(l)
// MERGE de país
MERGE (c:Country {name: 'United States'})
MERGE (s)-[:PRODUCED_IN]->(c)

// MERGE de director
MERGE (d:Director {name: 'Lauren Iungerich'})
MERGE (s)-[:DIRECTED_BY]->(d)

// MERGE de actores
MERGE (a1:Actor {name: 'Sierra Capri'})
MERGE (a2:Actor {name: 'Jason Genao'})
MERGE (a3:Actor {name: 'Brett Gray'})
MERGE (a4:Actor {name: 'Diego Tinoco'})
MERGE (a5:Actor {name: 'Jessica Marie Garcia'})
MERGE (a6:Actor {name: 'Julio Macias'})
MERGE (a7:Actor {name: 'Ronni Hawk'})
// Relacionar actores
MERGE (s)-[:HAS_ACTOR]->(a1)
MERGE (s)-[:HAS_ACTOR]->(a2)
MERGE (s)-[:HAS_ACTOR]->(a3)
MERGE (s)-[:HAS_ACTOR]->(a4)
MERGE (s)-[:HAS_ACTOR]->(a5)
MERGE (s)-[:HAS_ACTOR]->(a6)
MERGE (s)-[:HAS_ACTOR]->(a7)
