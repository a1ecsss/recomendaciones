// Crear la serie
MERGE (s:Series {seriesId: '3', name: 'Chernobyl'})
ON CREATE SET s.rating = 9.4,
              s.numOfRatings = 600000,
              s.description = 'Una dramatización del desastre nuclear de Chernóbil de abril de 1986 y los esfuerzos de limpieza que siguieron.',
              s.year = 2019,
              s.duration = 60,
              s.totalSeasons = 1,
              s.totalEpisodes = 5,
              s.image = 'chernobyl.png'

// MERGE de géneros
MERGE (g1:Genre {name: 'Drama'})
MERGE (g2:Genre {name: 'Historical'})
MERGE (g3:Genre {name: 'Thriller'})
MERGE (g4:Genre {name: 'Disaster'})
MERGE (g5:Genre {name: 'Tragedy'})

// Relacionar géneros
MERGE (s)-[:BELONGS_TO]->(g1)
MERGE (s)-[:BELONGS_TO]->(g2)
MERGE (s)-[:BELONGS_TO]->(g3)
MERGE (s)-[:BELONGS_TO]->(g4)
MERGE (s)-[:BELONGS_TO]->(g5)

// MERGE de tags
MERGE (t1:Tag {name: 'Nuclear Disaster'})
MERGE (t2:Tag {name: 'Soviet Union'})
MERGE (t3:Tag {name: 'Radiation'})
MERGE (t4:Tag {name: 'Cover-Up'})
MERGE (t5:Tag {name: 'Investigation'})
MERGE (t6:Tag {name: 'Crisis Management'})
MERGE (t7:Tag {name: 'Historical Event'})
MERGE (t8:Tag {name: 'Drama'})
MERGE (t9:Tag {name: 'Trauma'})
MERGE (t10:Tag {name: 'Conspiracy'})

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

// MERGE de idioma
MERGE (l:Language {name: 'English'})
MERGE (s)-[:IS_IN_LANGUAGE]->(l)

// MERGE de países
MERGE (c1:Country {name: 'United States'})
MERGE (c2:Country {name: 'United Kingdom'})

// Relacionar países
MERGE (s)-[:PRODUCED_IN]->(c1)
MERGE (s)-[:PRODUCED_IN]->(c2)

// MERGE de director
MERGE (d:Director {name: 'Johan Renck'})
MERGE (s)-[:DIRECTED_BY]->(d)

// MERGE de actores
MERGE (a1:Actor {name: 'Jared Harris'})
MERGE (a2:Actor {name: 'Stellan Skarsgård'})
MERGE (a3:Actor {name: 'Emily Watson'})
MERGE (a4:Actor {name: 'Paul Ritter'})
MERGE (a5:Actor {name: 'Jessie Buckley'})
MERGE (a6:Actor {name: 'Adam Nagaitis'})
MERGE (a7:Actor {name: 'Robert Emms'})

// Relacionar actores principales
MERGE (s)-[:HAS_ACTOR]->(a1)
MERGE (s)-[:HAS_ACTOR]->(a2)
MERGE (s)-[:HAS_ACTOR]->(a3)
MERGE (s)-[:HAS_ACTOR]->(a4)
MERGE (s)-[:HAS_ACTOR]->(a5)
MERGE (s)-[:HAS_ACTOR]->(a6)
MERGE (s)-[:HAS_ACTOR]->(a7)
