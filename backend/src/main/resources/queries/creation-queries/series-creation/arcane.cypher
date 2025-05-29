// Crear la serie (MERGE para evitar duplicados)
MERGE (s:Series {
    seriesId: '1',
    name: 'Arcane'
})
ON CREATE SET s.rating = 9.0,
              s.numOfRatings = 600000,
              s.description = 'En las ciudades de Piltover y Zaun, dos hermanas luchan en bandos opuestos de una guerra entre tecnologías mágicas y convicciones enfrentadas.',
              s.year = 2021,
              s.duration = 40,
              s.totalSeasons = 2,
              s.totalEpisodes = 18,
              s.image = 'arcane.png'

// MERGE de géneros
MERGE (g1:Genre {name: 'Animation'})
MERGE (g2:Genre {name: 'Action'})
MERGE (g3:Genre {name: 'Fantasy'})
MERGE (g4:Genre {name: 'Steampunk'})

// Relacionar géneros
MERGE (s)-[:BELONGS_TO]->(g1)
MERGE (s)-[:BELONGS_TO]->(g2)
MERGE (s)-[:BELONGS_TO]->(g3)
MERGE (s)-[:BELONGS_TO]->(g4)

// MERGE de tags
MERGE (t1:Tag {name: 'Drama'})
MERGE (t2:Tag {name: 'Science Fiction'})
MERGE (t3:Tag {name: 'Adventure'})
MERGE (t4:Tag {name: 'Animation'})
MERGE (t5:Tag {name: 'Steampunk'})
MERGE (t6:Tag {name: 'Fantasy'})
MERGE (t7:Tag {name: 'Magic'})
MERGE (t8:Tag {name: 'Technology'})
MERGE (t9:Tag {name: 'Rebellion'})
MERGE (t10:Tag {name: 'Friendship'})
MERGE (t11:Tag {name: 'Conflict'})
MERGE (t12:Tag {name: 'Psychological'})
MERGE (t13:Tag {name: 'Family'})

// Relacionar tags
MERGE (s)-[:HAS_TAG]->(t1)
MERGE (s)-[:HAS_TAG]->(t2)
MERGE (s)-[:HAS_TAG]->(t3)
MERGE (s)-[:HAS_TAG]->(t4)
MERGE (s)-[:HAS_TAG]->(t5)
MERGE (s)-[:HAS_TAG]->(t6)
MERGE (s)-[:HAS_TAG]->(t7)
MERGE (s)-[:HAS_TAG]->(t8)
MERGE (s)-[:HAS_TAG]->(t9)
MERGE (s)-[:HAS_TAG]->(t10)
MERGE (s)-[:HAS_TAG]->(t11)
MERGE (s)-[:HAS_TAG]->(t12)
MERGE (s)-[:HAS_TAG]->(t13)

// MERGE de idioma
MERGE (l:Language {name: 'English'})
MERGE (s)-[:IS_IN_LANGUAGE]->(l)
// MERGE de país
MERGE (c:Country {name: 'United States'})
MERGE (s)-[:PRODUCED_IN]->(c)

// MERGE de director
MERGE (d:Director {name: 'Pascal Charrue'})
MERGE (s)-[:DIRECTED_BY]->(d)

// MERGE de actores
MERGE (a1:Actor {name: 'Hailee Steinfeld'})
MERGE (a2:Actor {name: 'Ella Purnell'})
MERGE (a3:Actor {name: 'Kevin Alejandro'})
// Relacionar actores
MERGE (s)-[:HAS_ACTOR]->(a1)
MERGE (s)-[:HAS_ACTOR]->(a2)
MERGE (s)-[:HAS_ACTOR]->(a3)
