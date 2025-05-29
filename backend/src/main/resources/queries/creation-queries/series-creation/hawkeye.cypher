// Crear la serie (MERGE para evitar duplicados)
MERGE (s:Series {
    seriesId: '8',
    name: 'Hawkeye'
})
ON CREATE SET s.rating = 7.5,
              s.numOfRatings = 120000,
              s.description = 'Un año después de los eventos de Avengers: Endgame, Clint Barton debe trabajar junto con la joven Kate Bishop para enfrentarse a los enemigos de su pasado como Ronin y poder volver con su familia a tiempo para Navidad.',
              s.year = 2021,
              s.duration = 50,
              s.totalSeasons = 1,
              s.totalEpisodes = 6,
              s.image = 'hawkeye.png'

// MERGE de géneros
MERGE (g1:Genre {name: 'Action'})
MERGE (g2:Genre {name: 'Adventure'})
MERGE (g3:Genre {name: 'Superhero'})
MERGE (g4:Genre {name: 'Crime'})
// Relacionar géneros
MERGE (s)-[:BELONGS_TO]->(g1)
MERGE (s)-[:BELONGS_TO]->(g2)
MERGE (s)-[:BELONGS_TO]->(g3)
MERGE (s)-[:BELONGS_TO]->(g4)

// MERGE de tags
MERGE (t1:Tag {name: 'Marvel'})
MERGE (t2:Tag {name: 'Christmas'})
MERGE (t3:Tag {name: 'Mentorship'})
MERGE (t4:Tag {name: 'Bow and Arrow'})
MERGE (t5:Tag {name: 'Vigilante'})
MERGE (t6:Tag {name: 'New York'})
MERGE (t7:Tag {name: 'Strategy'})
MERGE (t8:Tag {name: 'Loyalty'})
// Relacionar tags
MERGE (s)-[:HAS_TAG]->(t1)
MERGE (s)-[:HAS_TAG]->(t2)
MERGE (s)-[:HAS_TAG]->(t3)
MERGE (s)-[:HAS_TAG]->(t4)
MERGE (s)-[:HAS_TAG]->(t5)
MERGE (s)-[:HAS_TAG]->(t6)
MERGE (s)-[:HAS_TAG]->(t7)
MERGE (s)-[:HAS_TAG]->(t8)

// MERGE de idioma
MERGE (l:Language {name: 'English'})
MERGE (s)-[:IS_IN_LANGUAGE]->(l)
// MERGE de país
MERGE (c:Country {name: 'United States'})
MERGE (s)-[:PRODUCED_IN]->(c)

// MERGE de director
MERGE (d:Director {name: 'Rhys Thomas'})
MERGE (s)-[:DIRECTED_BY]->(d)

// MERGE de actores
MERGE (a1:Actor {name: 'Jeremy Renner'})
MERGE (a2:Actor {name: 'Hailee Steinfeld'})
MERGE (a3:Actor {name: 'Florence Pugh'})
MERGE (a4:Actor {name: 'Vera Farmiga'})
MERGE (a5:Actor {name: 'Tony Dalton'})
MERGE (a6:Actor {name: 'Alaqua Cox'})
MERGE (a7:Actor {name: 'Zahn McClarnon'})
MERGE (a8:Actor {name: 'Vincent D\'Onofrio'})
// Relacionar actores
MERGE (s)-[:HAS_ACTOR]->(a1)
MERGE (s)-[:HAS_ACTOR]->(a2)
MERGE (s)-[:HAS_ACTOR]->(a3)
MERGE (s)-[:HAS_ACTOR]->(a4)
MERGE (s)-[:HAS_ACTOR]->(a5)
MERGE (s)-[:HAS_ACTOR]->(a6)
MERGE (s)-[:HAS_ACTOR]->(a7)
MERGE (s)-[:HAS_ACTOR]->(a8)
