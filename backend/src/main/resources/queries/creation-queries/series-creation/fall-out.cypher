// Crear la serie
MERGE (s:Series {seriesId: '5', name: 'Fallout'})
ON CREATE SET s.rating = 8.6,
              s.numOfRatings = 500000,
              s.description = 'Doscientos años después del apocalipsis, los habitantes de lujosos refugios subterráneos deben regresar al infierno radiactivo que sus antepasados dejaron atrás, enfrentándose a un universo complejo, violento y extraño.',
              s.year = 2024,
              s.duration = 60,
              s.totalSeasons = 1,
              s.totalEpisodes = 8,
              s.image = 'fallout.png'

// MERGE de géneros
MERGE (g1:Genre {name: 'Science Fiction'})
MERGE (g2:Genre {name: 'Post-Apocalyptic'})
MERGE (g3:Genre {name: 'Drama'})
MERGE (g4:Genre {name: 'Action'})
MERGE (g5:Genre {name: 'Western'})

// Relacionar géneros
MERGE (s)-[:BELONGS_TO]->(g1)
MERGE (s)-[:BELONGS_TO]->(g2)
MERGE (s)-[:BELONGS_TO]->(g3)
MERGE (s)-[:BELONGS_TO]->(g4)
MERGE (s)-[:BELONGS_TO]->(g5)

// MERGE de tags
MERGE (t1:Tag {name: 'Nuclear Apocalypse'})
MERGE (t2:Tag {name: 'Vault Dweller'})
MERGE (t3:Tag {name: 'Brotherhood of Steel'})
MERGE (t4:Tag {name: 'Mutants'})
MERGE (t5:Tag {name: 'Wasteland'})
MERGE (t6:Tag {name: 'Power Armor'})
MERGE (t7:Tag {name: 'Survival'})
MERGE (t8:Tag {name: 'Post-Apocalyptic'})

// Relacionar tags
MERGE (s)-[:HAS_TAG]->(t1)
MERGE (s)-[:HAS_TAG]->(t2)
MERGE (s)-[:HAS_TAG]->(t3)
MERGE (s)-[:HAS_TAG]->(t4)
MERGE (s)-[:HAS_TAG]->(t5)
MERGE (s)-[:HAS_TAG]->(t6)
MERGE (s)-[:HAS_TAG]->(t7)
MERGE (s)-[:HAS_TAG]->(t8)

// MERGE de idioma
MERGE (l:Language {name: 'English'})
MERGE (s)-[:IS_IN_LANGUAGE]->(l)

// MERGE de país
MERGE (c:Country {name: 'United States'})
MERGE (s)-[:PRODUCED_IN]->(c)

// MERGE de director
MERGE (d:Director {name: 'Jonathan Nolan'})
MERGE (s)-[:DIRECTED_BY]->(d)

// MERGE de actores
MERGE (a1:Actor {name: 'Ella Purnell'})
MERGE (a2:Actor {name: 'Walton Goggins'})
MERGE (a3:Actor {name: 'Aaron Moten'})
MERGE (a4:Actor {name: 'Kyle MacLachlan'})
MERGE (a5:Actor {name: 'Moises Arias'})
MERGE (a6:Actor {name: 'Xelia Mendes-Jones'})
MERGE (a7:Actor {name: 'Michael Emerson'})

// Relacionar actores principales
MERGE (s)-[:HAS_ACTOR]->(a1)
MERGE (s)-[:HAS_ACTOR]->(a2)
MERGE (s)-[:HAS_ACTOR]->(a3)
MERGE (s)-[:HAS_ACTOR]->(a4)
MERGE (s)-[:HAS_ACTOR]->(a5)
MERGE (s)-[:HAS_ACTOR]->(a6)
MERGE (s)-[:HAS_ACTOR]->(a7)
