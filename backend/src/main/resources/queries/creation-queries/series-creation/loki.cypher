// Crear la serie
MERGE (s:Series {seriesId: '10', name: 'Loki'})
ON CREATE SET s.rating = 8.2,
              s.numOfRatings = 200000,
              s.description = 'Después de robar el Tesseracto durante los eventos de "Avengers: Endgame", una versión alternativa de Loki es llevada ante la misteriosa Autoridad de Variación Temporal (AVT) y se ve obligado a ayudar a arreglar las líneas de tiempo rotas.',
              s.year = 2021,
              s.duration = 50,
              s.totalSeasons = 2,
              s.totalEpisodes = 12,
              s.image = 'loki.png'

// MERGE de géneros
MERGE (g1:Genre {name: 'Science Fiction'})
MERGE (g2:Genre {name: 'Fantasy'})
MERGE (g3:Genre {name: 'Action'})
MERGE (g4:Genre {name: 'Adventure'})
MERGE (g5:Genre {name: 'Drama'})
MERGE (g6:Genre {name: 'Superhero'})

// Relacionar géneros
MERGE (s)-[:BELONGS_TO]->(g1)
MERGE (s)-[:BELONGS_TO]->(g2)
MERGE (s)-[:BELONGS_TO]->(g3)
MERGE (s)-[:BELONGS_TO]->(g4)
MERGE (s)-[:BELONGS_TO]->(g5)
MERGE (s)-[:BELONGS_TO]->(g6)

// MERGE de tags
MERGE (t1:Tag {name: 'Time Travel'})
MERGE (t2:Tag {name: 'Multiverse'})
MERGE (t3:Tag {name: 'Variant'})
MERGE (t4:Tag {name: 'TVA'})
MERGE (t5:Tag {name: 'God of Mischief'})
MERGE (t6:Tag {name: 'Alternate Timeline'})
MERGE (t7:Tag {name: 'Marvel'})
MERGE (t8:Tag {name: 'Superhero'})
MERGE (t9:Tag {name: 'Magic'})

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

// MERGE de directores
MERGE (d1:Director {name: 'Kate Herron'})
MERGE (d2:Director {name: 'Justin Benson'})
MERGE (d3:Director {name: 'Aaron Moorhead'})

// Relacionar directores
MERGE (s)-[:DIRECTED_BY]->(d1)
MERGE (s)-[:DIRECTED_BY]->(d2)
MERGE (s)-[:DIRECTED_BY]->(d3)

// MERGE de actores
MERGE (a1:Actor {name: 'Tom Hiddleston'})
MERGE (a2:Actor {name: 'Owen Wilson'})
MERGE (a3:Actor {name: 'Sophia Di Martino'})
MERGE (a4:Actor {name: 'Gugu Mbatha-Raw'})
MERGE (a5:Actor {name: 'Wunmi Mosaku'})
MERGE (a6:Actor {name: 'Jonathan Majors'})
MERGE (a7:Actor {name: 'Ke Huy Quan'})

// Relacionar actores principales
MERGE (s)-[:HAS_ACTOR]->(a1)
MERGE (s)-[:HAS_ACTOR]->(a2)
MERGE (s)-[:HAS_ACTOR]->(a3)
MERGE (s)-[:HAS_ACTOR]->(a4)
MERGE (s)-[:HAS_ACTOR]->(a5)
MERGE (s)-[:HAS_ACTOR]->(a6)
MERGE (s)-[:HAS_ACTOR]->(a7)
