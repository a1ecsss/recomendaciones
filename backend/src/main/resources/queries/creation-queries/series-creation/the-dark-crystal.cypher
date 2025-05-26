// Crear la serie (MERGE para evitar duplicados)
MERGE (s:Series {
    seriesId: '18',
    name: 'The Dark Crystal: Age of Resistance'
})
ON CREATE SET s.rating = 8.4,
              s.numOfRatings = 35000,
              s.description = 'En un mundo de fantasía donde los Gelflings luchan contra el malvado poder de los Skeksis, un trío de héroes se embarca en una épica batalla para salvar su planeta.',
              s.year = 2019,
              s.duration = 60,
              s.totalSeasons = 1,
              s.totalEpisodes = 10,
              s.image = 'dark-crystal.png'

// MERGE de géneros
MERGE (g1:Genre {name: 'Fantasy'})
MERGE (g2:Genre {name: 'Adventure'})
MERGE (g3:Genre {name: 'Drama'})
MERGE (g4:Genre {name: 'Animation'})
MERGE (g5:Genre {name: 'Puppet'})
// Relacionar géneros
MERGE (s)-[:BELONGS_TO]->(g1)
MERGE (s)-[:BELONGS_TO]->(g2)
MERGE (s)-[:BELONGS_TO]->(g3)
MERGE (s)-[:BELONGS_TO]->(g4)
MERGE (s)-[:BELONGS_TO]->(g5)

// MERGE de tags
MERGE (t1:Tag {name: 'Dark Fantasy'})
MERGE (t2:Tag {name: 'Prequel'})
MERGE (t3:Tag {name: 'Adventure'})
MERGE (t4:Tag {name: 'Magic'})
MERGE (t5:Tag {name: 'Heroic Journey'})
// Relacionar tags
MERGE (s)-[:HAS_TAG]->(t1)
MERGE (s)-[:HAS_TAG]->(t2)
MERGE (s)-[:HAS_TAG]->(t3)
MERGE (s)-[:HAS_TAG]->(t4)
MERGE (s)-[:HAS_TAG]->(t5)

// MERGE de idioma
MERGE (l:Language {name: 'English'})
MERGE (s)-[:IS_IN_LANGUAGE]->(l)
// MERGE de país
MERGE (c:Country {name: 'United Kingdom'})
MERGE (s)-[:PRODUCED_IN]->(c)

// MERGE de director (varios directores para la serie)
MERGE (d:Director {name: 'Louis Leterrier'})
MERGE (s)-[:DIRECTED_BY]->(d)

// MERGE de actores
MERGE (a1:Actor {name: 'Nathalie Emmanuel'})
MERGE (a2:Actor {name: 'Lena Headey'})
MERGE (a3:Actor {name: 'Natalie Dormer'})
MERGE (a4:Actor {name: 'Taron Egerton'})
MERGE (a5:Actor {name: 'Anya Taylor-Joy'})
MERGE (a6:Actor {name: 'Helena Bonham Carter'})
MERGE (a7:Actor {name: 'Simon Pegg'})
MERGE (a8:Actor {name: 'Mark Hamill'})
// Relacionar actores
MERGE (s)-[:HAS_ACTOR]->(a1)
MERGE (s)-[:HAS_ACTOR]->(a2)
MERGE (s)-[:HAS_ACTOR]->(a3)
MERGE (s)-[:HAS_ACTOR]->(a4)
MERGE (s)-[:HAS_ACTOR]->(a5)
MERGE (s)-[:HAS_ACTOR]->(a6)
MERGE (s)-[:HAS_ACTOR]->(a7)
MERGE (s)-[:HAS_ACTOR]->(a8)
