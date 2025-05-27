// Crear la serie
MERGE (s:Series {seriesId: '8', name: 'Invincible'})
ON CREATE SET s.rating = 8.7,
              s.numOfRatings = 500000,
              s.description = 'Mark Grayson es un adolescente normal, excepto por el hecho de que su padre es el superhéroe más poderoso del planeta, Omni-Man. A medida que desarrolla sus propios poderes, Mark debe enfrentarse a las duras realidades de ser un héroe.',
              s.year = 2021,
              s.duration = 45,
              s.totalSeasons = 1,
              s.totalEpisodes = 8,
              s.image = 'invincible.png'

// MERGE de géneros
MERGE (g1:Genre {name: 'Animation'})
MERGE (g2:Genre {name: 'Superheroes'})

// Relacionar géneros
MERGE (s)-[:BELONGS_TO]->(g1)
MERGE (s)-[:BELONGS_TO]->(g2)

// MERGE de tags
MERGE (t1:Tag {name: 'Action'})
MERGE (t2:Tag {name: 'Drama'})
MERGE (t3:Tag {name: 'Science Fiction'})

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
MERGE (d:Director {name: 'Simon Racioppa'})
MERGE (s)-[:DIRECTED_BY]->(d)

// MERGE de actores
MERGE (a1:Actor {name: 'Steven Yeun'})
MERGE (a2:Actor {name: 'J.K. Simmons'})
MERGE (a3:Actor {name: 'Sandra Oh'})

// Relacionar actores principales
MERGE (s)-[:HAS_ACTOR]->(a1)
MERGE (s)-[:HAS_ACTOR]->(a2)
MERGE (s)-[:HAS_ACTOR]->(a3)
