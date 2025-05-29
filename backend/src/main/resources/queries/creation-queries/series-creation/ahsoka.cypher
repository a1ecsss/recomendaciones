// Crear la serie (MERGE para evitar duplicados)
MERGE (s:Series {
    seriesId: '25',
    name: 'Ahsoka'
})
ON CREATE SET s.rating = 7.5,
              s.numOfRatings = 131000,
              s.description = 'Después de la caída del Imperio Galáctico, la ex aprendiz Jedi Ahsoka Tano investiga una amenaza emergente para la galaxia.',
              s.year = 2023,
              s.duration = 45,
              s.totalSeasons = 1,
              s.totalEpisodes = 8,
              s.image = 'ahsoka.png'

// MERGE de géneros
MERGE (g1:Genre {name: 'Science Fiction'})
MERGE (g2:Genre {name: 'Action'})
MERGE (g3:Genre {name: 'Adventure'})
MERGE (g4:Genre {name: 'Fantasy'})
// Relacionar géneros
MERGE (s)-[:BELONGS_TO]->(g1)
MERGE (s)-[:BELONGS_TO]->(g2)
MERGE (s)-[:BELONGS_TO]->(g3)
MERGE (s)-[:BELONGS_TO]->(g4)

// MERGE de tags
MERGE (t1:Tag {name: 'Star Wars'})
MERGE (t2:Tag {name: 'Jedi'})
MERGE (t3:Tag {name: 'Galactic Empire'})
MERGE (t4:Tag {name: 'Space Adventure'})
MERGE (t5:Tag {name: 'Lightsaber'})
MERGE (t6:Tag {name: 'Force'})
// Relacionar tags
MERGE (s)-[:HAS_TAG]->(t1)
MERGE (s)-[:HAS_TAG]->(t2)
MERGE (s)-[:HAS_TAG]->(t3)
MERGE (s)-[:HAS_TAG]->(t4)
MERGE (s)-[:HAS_TAG]->(t5)
MERGE (s)-[:HAS_TAG]->(t6)

// MERGE de idioma
MERGE (l:Language {name: 'English'})
MERGE (s)-[:IS_IN_LANGUAGE]->(l)
// MERGE de país
MERGE (c:Country {name: 'United States'})
MERGE (s)-[:PRODUCED_IN]->(c)

// MERGE de director
MERGE (d:Director {name: 'Dave Filoni'})
MERGE (s)-[:DIRECTED_BY]->(d)

// MERGE de actores
MERGE (a1:Actor {name: 'Rosario Dawson'})
MERGE (a2:Actor {name: 'Natasha Liu Bordizzo'})
MERGE (a3:Actor {name: 'Mary Elizabeth Winstead'})
MERGE (a4:Actor {name: 'Ray Stevenson'})
MERGE (a5:Actor {name: 'Ivanna Sakhno'})
MERGE (a6:Actor {name: 'Diana Lee Inosanto'})
MERGE (a7:Actor {name: 'David Tennant'})
MERGE (a8:Actor {name: 'Eman Esfandi'})
MERGE (a9:Actor {name: 'Hayden Christensen'})
MERGE (a10:Actor {name: 'Lars Mikkelsen'})
MERGE (a11:Actor {name: 'Genevieve O\'Reilly'})
MERGE (a12:Actor {name: 'Ariana Greenblatt'})
// Relacionar actores
MERGE (s)-[:HAS_ACTOR]->(a1)
MERGE (s)-[:HAS_ACTOR]->(a2)
MERGE (s)-[:HAS_ACTOR]->(a3)
MERGE (s)-[:HAS_ACTOR]->(a4)
MERGE (s)-[:HAS_ACTOR]->(a5)
MERGE (s)-[:HAS_ACTOR]->(a6)
MERGE (s)-[:HAS_ACTOR]->(a7)
MERGE (s)-[:HAS_ACTOR]->(a8)
MERGE (s)-[:HAS_ACTOR]->(a9)
MERGE (s)-[:HAS_ACTOR]->(a10)
MERGE (s)-[:HAS_ACTOR]->(a11)
MERGE (s)-[:HAS_ACTOR]->(a12)
