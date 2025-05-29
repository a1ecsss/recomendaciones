MERGE (s:Series {
    seriesId: '27',
    name: 'Peacemaker'
})
ON CREATE SET s.rating = 8.5,
              s.numOfRatings = 65260,
              s.description = 'Después de recuperarse de sus heridas tras los eventos de The Suicide Squad, Christopher Smith, alias Peacemaker, se ve obligado a unirse a un equipo de operaciones encubiertas para eliminar una amenaza alienígena conocida como "Project Butterfly".',
              s.year = 2022,
              s.duration = 45,
              s.totalSeasons = 1,
              s.totalEpisodes = 8,
              s.image = 'peacemaker.png'

// MERGE de géneros
MERGE (g1:Genre {name: 'Action'})
MERGE (g2:Genre {name: 'Comedy'})
MERGE (g3:Genre {name: 'Drama'})
MERGE (g4:Genre {name: 'Superhero'})
// Relacionar géneros
MERGE (s)-[:BELONGS_TO]->(g1)
MERGE (s)-[:BELONGS_TO]->(g2)
MERGE (s)-[:BELONGS_TO]->(g3)
MERGE (s)-[:BELONGS_TO]->(g4)

// MERGE de tags
MERGE (t1:Tag {name: 'DC Comics'})
MERGE (t2:Tag {name: 'Antihero'})
MERGE (t3:Tag {name: 'Black Ops'})
MERGE (t4:Tag {name: 'Alien Invasion'})
MERGE (t5:Tag {name: 'Vigilante'})
MERGE (t6:Tag {name: 'Dark Humor'})
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
MERGE (d:Director {name: 'James Gunn'})
MERGE (s)-[:DIRECTED_BY]->(d)

// MERGE de actores
MERGE (a1:Actor {name: 'John Cena'})
MERGE (a2:Actor {name: 'Danielle Brooks'})
MERGE (a3:Actor {name: 'Freddie Stroma'})
MERGE (a4:Actor {name: 'Jennifer Holland'})
MERGE (a5:Actor {name: 'Steve Agee'})
MERGE (a6:Actor {name: 'Chukwudi Iwuji'})
MERGE (a7:Actor {name: 'Robert Patrick'})
MERGE (a8:Actor {name: 'Annie Chang'})
MERGE (a9:Actor {name: 'Nhut Le'})
MERGE (a10:Actor {name: 'Elizabeth Ludlow'})
MERGE (a11:Actor {name: 'Rizwan Manji'})
MERGE (a12:Actor {name: 'Christopher Heyerdahl'})
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
