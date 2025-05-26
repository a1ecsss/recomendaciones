// Crear la serie
MERGE (s:Series {seriesId: '6', name: 'The Boys'})
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

// Relacionar géneros
MERGE (s)-[:BELONGS_TO]->(g1)
MERGE (s)-[:BELONGS_TO]->(g2)
MERGE (s)-[:BELONGS_TO]->(g3)

// MERGE de tags
MERGE (t1:Tag {name: 'Superheroes'})
MERGE (t2:Tag {name: 'Dark Comedy'})
MERGE (t3:Tag {name: 'Vigilantes'})

// Relacionar tags
MERGE (s)-[:HAS_TAG]->(t1)
MERGE (s)-[:HAS_TAG]->(t2)
MERGE (s)-[:HAS_TAG]->(t3)

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
