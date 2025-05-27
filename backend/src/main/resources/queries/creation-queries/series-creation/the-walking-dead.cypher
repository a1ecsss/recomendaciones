// Crear la serie
MERGE (s:Series {seriesId: '19', name: 'The Walking Dead'})
ON CREATE SET s.rating = 8.2,
              s.numOfRatings = 2000000,
              s.description = 'Después de despertar de un coma, el oficial de policía Rick Grimes descubre que el mundo ha sido invadido por zombis. Se une a un grupo de sobrevivientes que luchan por mantenerse con vida en un mundo postapocalíptico.',
              s.year = 2010,
              s.duration = 45,
              s.totalSeasons = 11,
              s.totalEpisodes = 177,
              s.image = 'the_walking_dead.png'

// MERGE de géneros
MERGE (g1:Genre {name: 'Horror'})
MERGE (g2:Genre {name: 'Drama'})
MERGE (g3:Genre {name: 'Thriller'})
MERGE (g4:Genre {name: 'Action'})
MERGE (g5:Genre {name: 'Post-Apocalyptic'})
MERGE (g6:Genre {name: 'Zombie'})

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
MERGE (t3:Tag {name: 'Post-Apocalyptic'})
MERGE (t4:Tag {name: 'Group Dynamics'})
MERGE (t5:Tag {name: 'Moral Dilemmas'})
MERGE (t6:Tag {name: 'Leadership'})
MERGE (t7:Tag {name: 'Human Conflict'})

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
MERGE (d:Director {name: 'Frank Darabont'})
MERGE (s)-[:DIRECTED_BY]->(d)

// MERGE de actores
MERGE (a1:Actor {name: 'Andrew Lincoln'})
MERGE (a2:Actor {name: 'Norman Reedus'})
MERGE (a3:Actor {name: 'Melissa McBride'})
MERGE (a4:Actor {name: 'Lauren Cohan'})
MERGE (a5:Actor {name: 'Danai Gurira'})
MERGE (a6:Actor {name: 'Steven Yeun'})
MERGE (a7:Actor {name: 'Chandler Riggs'})

// Relacionar actores principales
MERGE (s)-[:HAS_ACTOR]->(a1)
MERGE (s)-[:HAS_ACTOR]->(a2)
MERGE (s)-[:HAS_ACTOR]->(a3)
MERGE (s)-[:HAS_ACTOR]->(a4)
MERGE (s)-[:HAS_ACTOR]->(a5)
MERGE (s)-[:HAS_ACTOR]->(a6)
MERGE (s)-[:HAS_ACTOR]->(a7)
