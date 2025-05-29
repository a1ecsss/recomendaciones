// Crear la serie (MERGE para evitar duplicados)
MERGE (s:Series {
    seriesId: '28',
    name: 'The Penguin'
})
ON CREATE SET s.rating = 8.9,
              s.numOfRatings = 65260,
              s.description = 'Tras la muerte de Carmine Falcone, Oswald "Oz" Cobb, alias El Pingüino, busca consolidar su poder en el inframundo criminal de Gotham City.',
              s.year = 2024,
              s.duration = 60,
              s.totalSeasons = 1,
              s.totalEpisodes = 8,
              s.image = 'the-penguin.png'

// MERGE de géneros
MERGE (g1:Genre {name: 'Crime'})
MERGE (g2:Genre {name: 'Drama'})
MERGE (g3:Genre {name: 'Thriller'})
MERGE (g4:Genre {name: 'Action'})
// Relacionar géneros
MERGE (s)-[:BELONGS_TO]->(g1)
MERGE (s)-[:BELONGS_TO]->(g2)
MERGE (s)-[:BELONGS_TO]->(g3)
MERGE (s)-[:BELONGS_TO]->(g4)

// MERGE de tags
MERGE (t1:Tag {name: 'DC Comics'})
MERGE (t2:Tag {name: 'Gotham City'})
MERGE (t3:Tag {name: 'Mafia'})
MERGE (t4:Tag {name: 'Spin-off'})
MERGE (t5:Tag {name: 'Villain Origin'})
MERGE (t6:Tag {name: 'Power Struggle'})
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
MERGE (d:Director {name: 'Craig Zobel'})
MERGE (s)-[:DIRECTED_BY]->(d)

// MERGE de actores
MERGE (a1:Actor {name: 'Colin Farrell'})
MERGE (a2:Actor {name: 'Cristin Milioti'})
MERGE (a3:Actor {name: 'Rhenzy Feliz'})
MERGE (a4:Actor {name: 'Deirdre O\'Connell'})
MERGE (a5:Actor {name: 'Clancy Brown'})
MERGE (a6:Actor {name: 'Carmen Ejogo'})
MERGE (a7:Actor {name: 'Michael Zegen'})
MERGE (a8:Actor {name: 'Michael Kelly'})
MERGE (a9:Actor {name: 'Shohreh Aghdashloo'})
MERGE (a10:Actor {name: 'James Madio'})
MERGE (a11:Actor {name: 'Scott Cohen'})
MERGE (a12:Actor {name: 'Theo Rossi'})
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
MERGE (s)-[:HAS_ACTOR]->(a11)
MERGE (s)-[:HAS_ACTOR]->(a12)
