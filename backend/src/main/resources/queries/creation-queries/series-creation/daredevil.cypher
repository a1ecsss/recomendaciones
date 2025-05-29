// Crear la serie
MERGE (s:Series {seriesId: '4', name: 'Daredevil'})
ON CREATE SET s.rating = 8.6,
              s.numOfRatings = 500000,
              s.description = 'Matt Murdock, un abogado ciego con sentidos sobrehumanos, lucha contra el crimen como el justiciero Daredevil en las calles de Hell\'s Kitchen, Nueva York.',
              s.year = 2015,
              s.duration = 56,
              s.totalSeasons = 3,
              s.totalEpisodes = 39,
              s.image = 'daredevil.png'

// MERGE de géneros
MERGE (g1:Genre {name: 'Action'})
MERGE (g2:Genre {name: 'Crime'})
MERGE (g3:Genre {name: 'Drama'})
MERGE (g4:Genre {name: 'Thriller'})
MERGE (g5:Genre {name: 'Superhero'})

// Relacionar géneros
MERGE (s)-[:BELONGS_TO]->(g1)
MERGE (s)-[:BELONGS_TO]->(g2)
MERGE (s)-[:BELONGS_TO]->(g3)
MERGE (s)-[:BELONGS_TO]->(g4)
MERGE (s)-[:BELONGS_TO]->(g5)

// MERGE de tags
MERGE (t1:Tag {name: 'Vigilante'})
MERGE (t2:Tag {name: 'Blind Hero'})
MERGE (t3:Tag {name: 'Hell\'s Kitchen'})
MERGE (t4:Tag {name: 'Lawyer'})
MERGE (t5:Tag {name: 'Martial Arts'})
MERGE (t6:Tag {name: 'Dark Tone'})
MERGE (t7:Tag {name: 'Marvel'})
MERGE (t8:Tag {name: 'New York'})
MERGE (t9:Tag {name: 'Antihero'})
MERGE (t10:Tag {name: 'Drama'})
MERGE (t11:Tag {name: 'Psychological'})
MERGE (t12:Tag {name: 'Loyalty'})
MERGE (t13:Tag {name: 'Strategy'})

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
MERGE (d:Director {name: 'Drew Goddard'})
MERGE (s)-[:DIRECTED_BY]->(d)

// MERGE de actores
MERGE (a1:Actor {name: 'Charlie Cox'})
MERGE (a2:Actor {name: 'Deborah Ann Woll'})
MERGE (a3:Actor {name: 'Elden Henson'})
MERGE (a4:Actor {name: 'Vincent D\'Onofrio'})
MERGE (a5:Actor {name: 'Rosario Dawson'})
MERGE (a6:Actor {name: 'Jon Bernthal'})
MERGE (a7:Actor {name: 'Élodie Yung'})

// Relacionar actores principales
MERGE (s)-[:HAS_ACTOR]->(a1)
MERGE (s)-[:HAS_ACTOR]->(a2)
MERGE (s)-[:HAS_ACTOR]->(a3)
MERGE (s)-[:HAS_ACTOR]->(a4)
MERGE (s)-[:HAS_ACTOR]->(a5)
MERGE (s)-[:HAS_ACTOR]->(a6)
MERGE (s)-[:HAS_ACTOR]->(a7)
