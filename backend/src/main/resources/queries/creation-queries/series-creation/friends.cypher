// Crear la serie
MERGE (s:Series {seriesId: '6', name: 'Friends'})
ON CREATE SET s.rating = 8.9,
              s.numOfRatings = 2500000,
              s.description = 'Seis amigos veinteañeros que viven en Manhattan navegan por la vida y el amor mientras comparten risas y momentos inolvidables.',
              s.year = 1994,
              s.duration = 22,
              s.totalSeasons = 10,
              s.totalEpisodes = 236,
              s.image = 'friends.png'

// MERGE de géneros
MERGE (g1:Genre {name: 'Comedy'})
MERGE (g2:Genre {name: 'Romance'})
MERGE (g3:Genre {name: 'Sitcom'})

// Relacionar géneros
MERGE (s)-[:BELONGS_TO]->(g1)
MERGE (s)-[:BELONGS_TO]->(g2)
MERGE (s)-[:BELONGS_TO]->(g3)

// MERGE de tags
MERGE (t1:Tag {name: 'Friendship'})
MERGE (t2:Tag {name: 'New York'})
MERGE (t3:Tag {name: 'Coffee Shop'})
MERGE (t4:Tag {name: 'Relationships'})
MERGE (t5:Tag {name: 'Roommates'})
MERGE (t6:Tag {name: 'Dating'})
MERGE (t7:Tag {name: 'Humor'})
MERGE (t8:Tag {name: 'Moral Dilemmas'})
MERGE (t9:Tag {name: 'Family'})
MERGE (t10:Tag {name: 'Friendship'})
MERGE (t11:Tag {name: 'Loyalty'})

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

// MERGE de idioma
MERGE (l:Language {name: 'English'})
MERGE (s)-[:IS_IN_LANGUAGE]->(l)

// MERGE de país
MERGE (c:Country {name: 'United States'})
MERGE (s)-[:PRODUCED_IN]->(c)

// MERGE de creadores
MERGE (d1:Director {name: 'David Crane'})
MERGE (d2:Director {name: 'Marta Kauffman'})

// Relacionar creadores
MERGE (s)-[:DIRECTED_BY]->(d1)
MERGE (s)-[:DIRECTED_BY]->(d2)

// MERGE de actores
MERGE (a1:Actor {name: 'Jennifer Aniston'})
MERGE (a2:Actor {name: 'Courteney Cox'})
MERGE (a3:Actor {name: 'Lisa Kudrow'})
MERGE (a4:Actor {name: 'Matt LeBlanc'})
MERGE (a5:Actor {name: 'Matthew Perry'})
MERGE (a6:Actor {name: 'David Schwimmer'})

// Relacionar actores principales
MERGE (s)-[:HAS_ACTOR]->(a1)
MERGE (s)-[:HAS_ACTOR]->(a2)
MERGE (s)-[:HAS_ACTOR]->(a3)
MERGE (s)-[:HAS_ACTOR]->(a4)
MERGE (s)-[:HAS_ACTOR]->(a5)
MERGE (s)-[:HAS_ACTOR]->(a6)
