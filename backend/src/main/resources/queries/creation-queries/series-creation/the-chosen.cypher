// Crear la serie (MERGE para evitar duplicados)
MERGE (s:Series {
    seriesId: '21',
    name: 'The Chosen'
})
ON CREATE SET s.rating = 9.2,
              s.numOfRatings = 80000,
              s.description = 'Serie dramática histórica que retrata la vida de Jesús de Nazaret a través de las personas que lo conocieron.',
              s.year = 2017,
              s.duration = 50,
              s.totalSeasons = 5,
              s.totalEpisodes = 40,
              s.image = 'the-chosen.png'

// MERGE de géneros
MERGE (g1:Genre {name: 'Drama'})
MERGE (g2:Genre {name: 'History'})
MERGE (g3:Genre {name: 'Faith'})
MERGE (g4:Genre {name: 'Biographical'})
// Relacionar géneros
MERGE (s)-[:BELONGS_TO]->(g1)
MERGE (s)-[:BELONGS_TO]->(g2)
MERGE (s)-[:BELONGS_TO]->(g3)
MERGE (s)-[:BELONGS_TO]->(g4)

// MERGE de tags
MERGE (t1:Tag {name: 'Faith'})
MERGE (t2:Tag {name: 'Religion'})
MERGE (t3:Tag {name: 'Jesus'})
MERGE (t4:Tag {name: 'Bible'})
MERGE (t5:Tag {name: 'Historical'})
MERGE (t6:Tag {name: 'Christianity'})
// Relacionar tags
MERGE (s)-[:HAS_TAG]->(t1)
MERGE (s)-[:HAS_TAG]->(t2)
MERGE (s)-[:HAS_TAG]->(t3)
MERGE (s)-[:HAS_TAG]->(t4)
MERGE (s)-[:HAS_TAG]->(t5)
MERGE (s)-[:HAS_TAG]->(t6)

// MERGE de idioma
MERGE (l:Language {name: 'English'})
MERGE (s)-[:IS_IN_LANGUAGE]->(l)
// MERGE de país
MERGE (c:Country {name: 'United States'})
MERGE (s)-[:PRODUCED_IN]->(c)

// MERGE de director
MERGE (d:Director {name: 'Dallas Jenkins'})
MERGE (s)-[:DIRECTED_BY]->(d)

// MERGE de actores
MERGE (a1:Actor {name: 'Jonathan Roumie'})
MERGE (a2:Actor {name: 'Shahar Isaac'})
MERGE (a3:Actor {name: 'Elizabeth Tabish'})
MERGE (a4:Actor {name: 'Paras Patel'})
MERGE (a5:Actor {name: 'Noah James'})
MERGE (a6:Actor {name: 'George H. Xanthis'})
MERGE (a7:Actor {name: 'Lara Silva'})
// Relacionar actores
MERGE (s)-[:HAS_ACTOR]->(a1)
MERGE (s)-[:HAS_ACTOR]->(a2)
MERGE (s)-[:HAS_ACTOR]->(a3)
MERGE (s)-[:HAS_ACTOR]->(a4)
MERGE (s)-[:HAS_ACTOR]->(a5)
MERGE (s)-[:HAS_ACTOR]->(a6)
MERGE (s)-[:HAS_ACTOR]->(a7)
