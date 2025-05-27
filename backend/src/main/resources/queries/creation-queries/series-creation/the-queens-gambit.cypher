// Crear la serie (MERGE para evitar duplicados)
MERGE (s:Series {
    seriesId: '18',
    name: 'The Queen\'s Gambit'
})
ON CREATE SET s.rating = 8.6,
              s.numOfRatings = 600000,
              s.description = 'La historia de Beth Harmon, una huérfana prodigio del ajedrez, que lucha contra la adicción y las expectativas mientras persigue su sueño de convertirse en la mejor ajedrecista del mundo.',
              s.year = 2020,
              s.duration = 50,
              s.totalSeasons = 1,
              s.totalEpisodes = 7,
              s.image = 'queens-gambit.png'

// MERGE de géneros
MERGE (g1:Genre {name: 'Drama'})
MERGE (g2:Genre {name: 'Coming of Age'})
MERGE (g3:Genre {name: 'Sports'})
MERGE (g4:Genre {name: 'Psychological'})
// Relacionar géneros
MERGE (s)-[:BELONGS_TO]->(g1)
MERGE (s)-[:BELONGS_TO]->(g2)
MERGE (s)-[:BELONGS_TO]->(g3)
MERGE (s)-[:BELONGS_TO]->(g4)

// MERGE de tags
MERGE (t1:Tag {name: 'Chess'})
MERGE (t2:Tag {name: 'Addiction'})
MERGE (t3:Tag {name: 'Genius'})
MERGE (t4:Tag {name: 'Orphan'})
// Relacionar tags
MERGE (s)-[:HAS_TAG]->(t1)
MERGE (s)-[:HAS_TAG]->(t2)
MERGE (s)-[:HAS_TAG]->(t3)
MERGE (s)-[:HAS_TAG]->(t4)

// MERGE de idioma
MERGE (l:Language {name: 'English'})
MERGE (s)-[:IS_IN_LANGUAGE]->(l)
// MERGE de país
MERGE (c:Country {name: 'United States'})
MERGE (s)-[:PRODUCED_IN]->(c)

// MERGE de director
MERGE (d:Director {name: 'Scott Frank'})
MERGE (s)-[:DIRECTED_BY]->(d)

// MERGE de actores
MERGE (a1:Actor {name: 'Anya Taylor-Joy'})
MERGE (a2:Actor {name: 'Bill Camp'})
MERGE (a3:Actor {name: 'Marielle Heller'})
MERGE (a4:Actor {name: 'Thomas Brodie-Sangster'})
MERGE (a5:Actor {name: 'Harry Melling'})
MERGE (a6:Actor {name: 'Moses Ingram'})
MERGE (a7:Actor {name: 'Jacob Fortune-Lloyd'})
// Relacionar actores
MERGE (s)-[:HAS_ACTOR]->(a1)
MERGE (s)-[:HAS_ACTOR]->(a2)
MERGE (s)-[:HAS_ACTOR]->(a3)
MERGE (s)-[:HAS_ACTOR]->(a4)
MERGE (s)-[:HAS_ACTOR]->(a5)
MERGE (s)-[:HAS_ACTOR]->(a6)
MERGE (s)-[:HAS_ACTOR]->(a7)
