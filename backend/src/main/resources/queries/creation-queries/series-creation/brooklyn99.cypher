// Crear la serie (MERGE para evitar duplicados)
MERGE (s:Series {
    seriesId: '22',
    name: 'Brooklyn Nine-Nine'
})
ON CREATE SET s.rating = 8.4,
              s.numOfRatings = 350000,
              s.description = 'Comedia policial que sigue las desventuras de un grupo de detectives en la comisaría 99 de Brooklyn.',
              s.year = 2013,
              s.duration = 22,
              s.totalSeasons = 8,
              s.totalEpisodes = 153,
              s.image = 'brooklyn99.png'

// MERGE de géneros
MERGE (g1:Genre {name: 'Comedy'})
MERGE (g2:Genre {name: 'Crime'})
MERGE (g3:Genre {name: 'Sitcom'})
MERGE (g4:Genre {name: 'Police Procedural'})
// Relacionar géneros
MERGE (s)-[:BELONGS_TO]->(g1)
MERGE (s)-[:BELONGS_TO]->(g2)
MERGE (s)-[:BELONGS_TO]->(g3)
MERGE (s)-[:BELONGS_TO]->(g4)

// MERGE de tags
MERGE (t1:Tag {name: 'Comedy'})
MERGE (t2:Tag {name: 'Police'})
MERGE (t3:Tag {name: 'Brooklyn'})
MERGE (t4:Tag {name: 'Sitcom'})
MERGE (t5:Tag {name: 'Detectives'})
MERGE (t6:Tag {name: 'NYPD'})
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
MERGE (d:Director {name: 'Michael Schur'})
MERGE (s)-[:DIRECTED_BY]->(d)

// MERGE de actores
MERGE (a1:Actor {name: 'Andy Samberg'})
MERGE (a2:Actor {name: 'Stephanie Beatriz'})
MERGE (a3:Actor {name: 'Terry Crews'})
MERGE (a4:Actor {name: 'Melissa Fumero'})
MERGE (a5:Actor {name: 'Joe Lo Truglio'})
MERGE (a6:Actor {name: 'Chelsea Peretti'})
MERGE (a7:Actor {name: 'Andre Braugher'})
MERGE (a8:Actor {name: 'Dirk Blocker'})
MERGE (a9:Actor {name: 'Joel McKinnon Miller'})
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
