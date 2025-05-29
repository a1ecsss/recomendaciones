// Crear la serie (MERGE para evitar duplicados)
MERGE (s:Series {
    seriesId: '23',
    name: 'Suits'
})
ON CREATE SET s.rating = 8.4,
              s.numOfRatings = 516000,
              s.description = 'Drama legal que sigue a un joven con memoria fotográfica que comienza a trabajar en un prestigioso bufete de abogados de Nueva York sin tener título en derecho.',
              s.year = 2011,
              s.duration = 45,
              s.totalSeasons = 9,
              s.totalEpisodes = 134,
              s.image = 'suits.png'

// MERGE de géneros
MERGE (g1:Genre {name: 'Drama'})
MERGE (g2:Genre {name: 'Legal'})
MERGE (g3:Genre {name: 'Comedy'})
MERGE (g4:Genre {name: 'Workplace'})
// Relacionar géneros
MERGE (s)-[:BELONGS_TO]->(g1)
MERGE (s)-[:BELONGS_TO]->(g2)
MERGE (s)-[:BELONGS_TO]->(g3)
MERGE (s)-[:BELONGS_TO]->(g4)

// MERGE de tags
MERGE (t1:Tag {name: 'Law'})
MERGE (t2:Tag {name: 'Corporate'})
MERGE (t3:Tag {name: 'New York'})
MERGE (t4:Tag {name: 'Mentorship'})
MERGE (t5:Tag {name: 'Deception'})
MERGE (t6:Tag {name: 'Friendship'})
MERGE (t7:Tag {name: 'Lawyer'})
MERGE (t8:Tag {name: 'Loyalty'})
MERGE (t9:Tag {name: 'Strategy'})
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

// MERGE de idioma
MERGE (l:Language {name: 'English'})
MERGE (s)-[:IS_IN_LANGUAGE]->(l)
// MERGE de país
MERGE (c:Country {name: 'United States'})
MERGE (s)-[:PRODUCED_IN]->(c)

// MERGE de director
MERGE (d:Director {name: 'Aaron Korsh'})
MERGE (s)-[:DIRECTED_BY]->(d)

// MERGE de actores
MERGE (a1:Actor {name: 'Gabriel Macht'})
MERGE (a2:Actor {name: 'Patrick J. Adams'})
MERGE (a3:Actor {name: 'Meghan Markle'})
MERGE (a4:Actor {name: 'Sarah Rafferty'})
MERGE (a5:Actor {name: 'Rick Hoffman'})
MERGE (a6:Actor {name: 'Gina Torres'})
MERGE (a7:Actor {name: 'Amanda Schull'})
MERGE (a8:Actor {name: 'Katherine Heigl'})
MERGE (a9:Actor {name: 'Dulé Hill'})
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
