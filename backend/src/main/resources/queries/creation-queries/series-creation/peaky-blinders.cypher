// Crear la serie (MERGE para evitar duplicados)
MERGE (s:Series {
    seriesId: '20',
    name: 'Peaky Blinders'
})
ON CREATE SET s.rating = 8.8,
              s.numOfRatings = 500000,
              s.description = 'Un drama criminal ambientado en Birmingham, Inglaterra, después de la Primera Guerra Mundial, que sigue a la familia Shelby y su banda, los Peaky Blinders.',
              s.year = 2013,
              s.duration = 60,
              s.totalSeasons = 6,
              s.totalEpisodes = 36,
              s.image = 'peaky-blinders.png'

// MERGE de géneros
MERGE (g1:Genre {name: 'Crime'})
MERGE (g2:Genre {name: 'Drama'})
MERGE (g3:Genre {name: 'Historical'})
MERGE (g4:Genre {name: 'Thriller'})
// Relacionar géneros
MERGE (s)-[:BELONGS_TO]->(g1)
MERGE (s)-[:BELONGS_TO]->(g2)
MERGE (s)-[:BELONGS_TO]->(g3)
MERGE (s)-[:BELONGS_TO]->(g4)

// MERGE de tags
MERGE (t1:Tag {name: 'Gangsters'})
MERGE (t2:Tag {name: 'Post-War'})
MERGE (t3:Tag {name: 'Family'})
MERGE (t4:Tag {name: 'Power Struggle'})
// Relacionar tags
MERGE (s)-[:HAS_TAG]->(t1)
MERGE (s)-[:HAS_TAG]->(t2)
MERGE (s)-[:HAS_TAG]->(t3)
MERGE (s)-[:HAS_TAG]->(t4)

// MERGE de idioma
MERGE (l:Language {name: 'English'})
MERGE (s)-[:IS_IN_LANGUAGE]->(l)
// MERGE de país
MERGE (c:Country {name: 'United Kingdom'})
MERGE (s)-[:PRODUCED_IN]->(c)

// MERGE de director
MERGE (d:Director {name: 'Steven Knight'})
MERGE (s)-[:DIRECTED_BY]->(d)

// MERGE de actores
MERGE (a1:Actor {name: 'Cillian Murphy'})
MERGE (a2:Actor {name: 'Paul Anderson'})
MERGE (a3:Actor {name: 'Helen McCrory'})
MERGE (a4:Actor {name: 'Sophie Rundle'})
MERGE (a5:Actor {name: 'Finn Cole'})
MERGE (a6:Actor {name: 'Tom Hardy'})
MERGE (a7:Actor {name: 'Anya Taylor-Joy'})
// Relacionar actores
MERGE (s)-[:HAS_ACTOR]->(a1)
MERGE (s)-[:HAS_ACTOR]->(a2)
MERGE (s)-[:HAS_ACTOR]->(a3)
MERGE (s)-[:HAS_ACTOR]->(a4)
MERGE (s)-[:HAS_ACTOR]->(a5)
MERGE (s)-[:HAS_ACTOR]->(a6)
MERGE (s)-[:HAS_ACTOR]->(a7)
