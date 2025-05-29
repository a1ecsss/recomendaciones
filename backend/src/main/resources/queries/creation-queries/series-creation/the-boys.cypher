// Crear la serie
MERGE (s:Series {seriesId: '14', name: 'The Boys'})
ON CREATE SET s.rating = 8.7,
              s.numOfRatings = 500000,
              s.description = 'En un mundo donde los superhéroes abusan de sus poderes, un grupo de vigilantes conocidos como "The Boys" se propone exponer la verdad sobre "The Seven" y Vought International.',
              s.year = 2019,
              s.duration = 60,
              s.totalSeasons = 4,
              s.totalEpisodes = 32,
              s.image = 'the_boys.png'

// MERGE de géneros
MERGE (g1:Genre {name: 'Action'})
MERGE (g2:Genre {name: 'Drama'})
MERGE (g3:Genre {name: 'Satire'})
MERGE (g4:Genre {name: 'Superhero'})
MERGE (g5:Genre {name: 'Dark Comedy'})

// Relacionar géneros
MERGE (s)-[:BELONGS_TO]->(g1)
MERGE (s)-[:BELONGS_TO]->(g2)
MERGE (s)-[:BELONGS_TO]->(g3)
MERGE (s)-[:BELONGS_TO]->(g4)
MERGE (s)-[:BELONGS_TO]->(g5)

// MERGE de tags
MERGE (t1:Tag {name: 'Superhero'})
MERGE (t2:Tag {name: 'Violence'})
MERGE (t3:Tag {name: 'Antihero'})
MERGE (t4:Tag {name: 'Vigilante'})
MERGE (t5:Tag {name: 'Corruption'})
MERGE (t6:Tag {name: 'Satire'})
MERGE (t7:Tag {name: 'Gore'})
MERGE (t8:Tag {name: 'Drug'})
MERGE (t9:Tag {name: 'Experiment'})
MERGE (t10:Tag {name: 'Revenge'})
MERGE (t11:Tag {name: 'Explosive'})
MERGE (t12:Tag {name: 'Media'})
MERGE (t13:Tag {name: 'Corporation'})
MERGE (t14:Tag {name: 'Psychological'})
MERGE (t15:Tag {name: 'Conspiracy'})
MERGE (t16:Tag {name: 'Betrayal'})
MERGE (t17:Tag {name: 'Loyalty'})

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
MERGE (s)-[:HAS_TAG]->(t14)
MERGE (s)-[:HAS_TAG]->(t15)
MERGE (s)-[:HAS_TAG]->(t16)
MERGE (s)-[:HAS_TAG]->(t17)

// MERGE de idioma
MERGE (l:Language {name: 'English'})
MERGE (s)-[:IS_IN_LANGUAGE]->(l)

// MERGE de país
MERGE (c:Country {name: 'United States'})
MERGE (s)-[:PRODUCED_IN]->(c)

// MERGE de director
MERGE (d:Director {name: 'Eric Kripke'})
MERGE (s)-[:DIRECTED_BY]->(d)

// MERGE de actores
MERGE (a1:Actor {name: 'Karl Urban'})
MERGE (a2:Actor {name: 'Jack Quaid'})
MERGE (a3:Actor {name: 'Antony Starr'})

// Relacionar actores principales
MERGE (s)-[:HAS_ACTOR]->(a1)
MERGE (s)-[:HAS_ACTOR]->(a2)
MERGE (s)-[:HAS_ACTOR]->(a3)
