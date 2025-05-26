// Crear la serie
MERGE (s:Series {seriesId: '5', name: 'The Mandalorian'})
ON CREATE SET s.rating = 8.7,
              s.numOfRatings = 500000,
              s.description = 'Un cazarrecompensas solitario en los confines de la galaxia protege a un misterioso niño con habilidades especiales mientras evade a las fuerzas imperiales remanentes.',
              s.year = 2019,
              s.duration = 40,
              s.totalSeasons = 3,
              s.totalEpisodes = 24,
              s.image = 'the_mandalorian.png'

// MERGE de géneros
MERGE (g1:Genre {name: 'Science Fiction'})
MERGE (g2:Genre {name: 'Action'})
MERGE (g3:Genre {name: 'Adventure'})

// Relacionar géneros
MERGE (s)-[:BELONGS_TO]->(g1)
MERGE (s)-[:BELONGS_TO]->(g2)
MERGE (s)-[:BELONGS_TO]->(g3)

// MERGE de tags
MERGE (t1:Tag {name: 'Space'})
MERGE (t2:Tag {name: 'Bounty Hunter'})
MERGE (t3:Tag {name: 'Star Wars'})

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
MERGE (d:Director {name: 'Jon Favreau'})
MERGE (s)-[:DIRECTED_BY]->(d)

// MERGE de actores
MERGE (a1:Actor {name: 'Pedro Pascal'})
MERGE (a2:Actor {name: 'Carl Weathers'})
MERGE (a3:Actor {name: 'Giancarlo Esposito'})

// Relacionar actores principales
MERGE (s)-[:HAS_ACTOR]->(a1)
MERGE (s)-[:HAS_ACTOR]->(a2)
MERGE (s)-[:HAS_ACTOR]->(a3)
