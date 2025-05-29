// Crear la serie
MERGE (s:Series {seriesId: '16', name: 'The Last of Us'})
ON CREATE SET s.rating = 9.0,
              s.numOfRatings = 1500000,
              s.description = 'Veinte años después de la destrucción de la civilización moderna, Joel, un sobreviviente endurecido, es contratado para sacar de contrabando a Ellie, una niña de 14 años, de una zona de cuarentena opresiva. Lo que comienza como un pequeño trabajo pronto se convierte en un viaje brutal y desgarrador.',
              s.year = 2023,
              s.duration = 60,
              s.totalSeasons = 2,
              s.totalEpisodes = 16,
              s.image = 'the_last_of_us.png'

// MERGE de géneros
MERGE (g1:Genre {name: 'Drama'})
MERGE (g2:Genre {name: 'Post-Apocalyptic'})
MERGE (g3:Genre {name: 'Thriller'})
MERGE (g4:Genre {name: 'Action'})
MERGE (g5:Genre {name: 'Adventure'})
MERGE (g6:Genre {name: 'Horror'})

// Relacionar géneros
MERGE (s)-[:BELONGS_TO]->(g1)
MERGE (s)-[:BELONGS_TO]->(g2)
MERGE (s)-[:BELONGS_TO]->(g3)
MERGE (s)-[:BELONGS_TO]->(g4)
MERGE (s)-[:BELONGS_TO]->(g5)
MERGE (s)-[:BELONGS_TO]->(g6)

// MERGE de tags
MERGE (t1:Tag {name: 'Zombie Apocalypse'})
MERGE (t2:Tag {name: 'Survival'})
MERGE (t3:Tag {name: 'Fungal Infection'})
MERGE (t4:Tag {name: 'Father-Daughter Relationship'})
MERGE (t5:Tag {name: 'Moral Dilemma'})
MERGE (t6:Tag {name: 'Post-Apocalyptic'})
MERGE (t7:Tag {name: 'Trauma'})
MERGE (t8:Tag {name: 'Drama'})
MERGE (t9:Tag {name: 'Addiction'})

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

// MERGE de creadores
MERGE (d1:Director {name: 'Craig Mazin'})
MERGE (d2:Director {name: 'Neil Druckmann'})

// Relacionar creadores
MERGE (s)-[:DIRECTED_BY]->(d1)
MERGE (s)-[:DIRECTED_BY]->(d2)

// MERGE de actores
MERGE (a1:Actor {name: 'Pedro Pascal'})
MERGE (a2:Actor {name: 'Bella Ramsey'})
MERGE (a3:Actor {name: 'Gabriel Luna'})
MERGE (a4:Actor {name: 'Isabela Merced'})
MERGE (a5:Actor {name: 'Young Mazino'})
MERGE (a6:Actor {name: 'Anna Torv'})
MERGE (a7:Actor {name: 'Merle Dandridge'})

// Relacionar actores principales
MERGE (s)-[:HAS_ACTOR]->(a1)
MERGE (s)-[:HAS_ACTOR]->(a2)
MERGE (s)-[:HAS_ACTOR]->(a3)
MERGE (s)-[:HAS_ACTOR]->(a4)
MERGE (s)-[:HAS_ACTOR]->(a5)
MERGE (s)-[:HAS_ACTOR]->(a6)
MERGE (s)-[:HAS_ACTOR]->(a7)
