// Crear la serie
MERGE (s:Series {seriesId: '20', name: 'X-Men \'97'})
ON CREATE SET s.rating = 8.9,
              s.numOfRatings = 500000,
              s.description = 'Los X-Men, un grupo de mutantes con habilidades extraordinarias, luchan por la coexistencia pacífica en un mundo que los teme y los odia. En esta continuación de la serie animada de los 90, enfrentan nuevas amenazas y desafíos personales.',
              s.year = 2024,
              s.duration = 30,
              s.totalSeasons = 1,
              s.totalEpisodes = 10,
              s.image = 'xmen_97.png'

// MERGE de géneros
MERGE (g1:Genre {name: 'Action'})
MERGE (g2:Genre {name: 'Adventure'})
MERGE (g3:Genre {name: 'Science Fiction'})
MERGE (g4:Genre {name: 'Superhero'})
MERGE (g5:Genre {name: 'Animation'})

// Relacionar géneros
MERGE (s)-[:BELONGS_TO]->(g1)
MERGE (s)-[:BELONGS_TO]->(g2)
MERGE (s)-[:BELONGS_TO]->(g3)
MERGE (s)-[:BELONGS_TO]->(g4)
MERGE (s)-[:BELONGS_TO]->(g5)

// MERGE de tags
MERGE (t1:Tag {name: 'Mutants'})
MERGE (t2:Tag {name: 'Teamwork'})
MERGE (t3:Tag {name: 'Diversity'})
MERGE (t4:Tag {name: 'Prejudice'})
MERGE (t5:Tag {name: 'Redemption'})
MERGE (t6:Tag {name: 'Legacy'})
MERGE (t7:Tag {name: 'Animated Series'})

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
MERGE (d:Director {name: 'Jake Castorena'})
MERGE (s)-[:DIRECTED_BY]->(d)

// MERGE de actores
MERGE (a1:Actor {name: 'Ray Chase'})
MERGE (a2:Actor {name: 'Jennifer Hale'})
MERGE (a3:Actor {name: 'Alison Sealy-Smith'})
MERGE (a4:Actor {name: 'Cal Dodd'})
MERGE (a5:Actor {name: 'Lenore Zann'})
MERGE (a6:Actor {name: 'George Buza'})
MERGE (a7:Actor {name: 'A.J. LoCascio'})

// Relacionar actores principales
MERGE (s)-[:HAS_ACTOR]->(a1)
MERGE (s)-[:HAS_ACTOR]->(a2)
MERGE (s)-[:HAS_ACTOR]->(a3)
MERGE (s)-[:HAS_ACTOR]->(a4)
MERGE (s)-[:HAS_ACTOR]->(a5)
MERGE (s)-[:HAS_ACTOR]->(a6)
MERGE (s)-[:HAS_ACTOR]->(a7)
