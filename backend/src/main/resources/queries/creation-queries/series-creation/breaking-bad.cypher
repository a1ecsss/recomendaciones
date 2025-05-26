// Crear la serie (MERGE para evitar duplicados)
MERGE (s:Series {seriesId: '12', name: 'Breaking Bad'})
ON CREATE SET s.rating = 9.5,
              s.numOfRatings = 2000000,
              s.description = 'Walter White, un profesor de química de secundaria diagnosticado con cáncer de pulmón, se adentra en el mundo del crimen al producir y vender metanfetamina para asegurar el futuro financiero de su familia.',
              s.year = 2008,
              s.duration = 47,
              s.totalSeasons = 5,
              s.totalEpisodes = 62,
              s.image = 'breaking_bad.png'

// MERGE de géneros
MERGE (g1:Genre {name: 'Crime'})
MERGE (g2:Genre {name: 'Drama'})
MERGE (g3:Genre {name: 'Thriller'})
MERGE (g4:Genre {name: 'Neo-Western'})
MERGE (g5:Genre {name: 'Black Comedy'})

// Relacionar géneros
MERGE (s)-[:BELONGS_TO]->(g1)
MERGE (s)-[:BELONGS_TO]->(g2)
MERGE (s)-[:BELONGS_TO]->(g3)
MERGE (s)-[:BELONGS_TO]->(g4)
MERGE (s)-[:BELONGS_TO]->(g5)

// MERGE de tags
MERGE (t1:Tag {name: 'Methamphetamine'})
MERGE (t2:Tag {name: 'Antihero'})
MERGE (t3:Tag {name: 'Drug Cartel'})
MERGE (t4:Tag {name: 'Chemistry'})
MERGE (t5:Tag {name: 'Moral Ambiguity'})
MERGE (t6:Tag {name: 'Cancer'})
MERGE (t7:Tag {name: 'Albuquerque'})

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
MERGE (d:Director {name: 'Vince Gilligan'})
MERGE (s)-[:DIRECTED_BY]->(d)

// MERGE de actores
MERGE (a1:Actor {name: 'Bryan Cranston'})
MERGE (a2:Actor {name: 'Aaron Paul'})
MERGE (a3:Actor {name: 'Anna Gunn'})
MERGE (a4:Actor {name: 'RJ Mitte'})
MERGE (a5:Actor {name: 'Dean Norris'})
MERGE (a6:Actor {name: 'Betsy Brandt'})
MERGE (a7:Actor {name: 'Bob Odenkirk'})

// Relacionar actores principales
MERGE (s)-[:HAS_ACTOR]->(a1)
MERGE (s)-[:HAS_ACTOR]->(a2)
MERGE (s)-[:HAS_ACTOR]->(a3)
MERGE (s)-[:HAS_ACTOR]->(a4)
MERGE (s)-[:HAS_ACTOR]->(a5)
MERGE (s)-[:HAS_ACTOR]->(a6)
MERGE (s)-[:HAS_ACTOR]->(a7)
