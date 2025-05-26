// Crear la serie
MERGE (s:Series {seriesId: '8', name: 'Star Wars: The Clone Wars'})
ON CREATE SET s.rating = 8.4,
              s.numOfRatings = 150000,
              s.description = 'Durante las Guerras Clon, los Caballeros Jedi lideran el Gran Ejército de la República contra la Confederación de Sistemas Independientes. La serie sigue las aventuras de Anakin Skywalker, su padawan Ahsoka Tano, y Obi-Wan Kenobi mientras luchan contra las fuerzas separatistas.',
              s.year = 2008,
              s.duration = 22,
              s.totalSeasons = 7,
              s.totalEpisodes = 133,
              s.image = 'star_wars_the_clone_wars.png'

// MERGE de géneros
MERGE (g1:Genre {name: 'Science Fiction'})
MERGE (g2:Genre {name: 'Action'})
MERGE (g3:Genre {name: 'Adventure'})
MERGE (g4:Genre {name: 'Animation'})
MERGE (g5:Genre {name: 'War'})
MERGE (g6:Genre {name: 'Drama'})

// Relacionar géneros
MERGE (s)-[:BELONGS_TO]->(g1)
MERGE (s)-[:BELONGS_TO]->(g2)
MERGE (s)-[:BELONGS_TO]->(g3)
MERGE (s)-[:BELONGS_TO]->(g4)
MERGE (s)-[:BELONGS_TO]->(g5)
MERGE (s)-[:BELONGS_TO]->(g6)

// MERGE de tags
MERGE (t1:Tag {name: 'Jedi'})
MERGE (t2:Tag {name: 'Clone Troopers'})
MERGE (t3:Tag {name: 'Galactic Republic'})
MERGE (t4:Tag {name: 'Sith'})
MERGE (t5:Tag {name: 'Space Battles'})
MERGE (t6:Tag {name: 'Lightsaber'})
MERGE (t7:Tag {name: 'Animated Series'})
MERGE (t8:Tag {name: 'Star Wars'})

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
MERGE (d:Director {name: 'Dave Filoni'})
MERGE (s)-[:DIRECTED_BY]->(d)

// MERGE de actores
MERGE (a1:Actor {name: 'Matt Lanter'})
MERGE (a2:Actor {name: 'Ashley Eckstein'})
MERGE (a3:Actor {name: 'James Arnold Taylor'})
MERGE (a4:Actor {name: 'Dee Bradley Baker'})
MERGE (a5:Actor {name: 'Tom Kane'})
MERGE (a6:Actor {name: 'Catherine Taber'})
MERGE (a7:Actor {name: 'Corey Burton'})
MERGE (a8:Actor {name: 'Matthew Wood'})
MERGE (a9:Actor {name: 'Nika Futterman'})
MERGE (a10:Actor {name: 'Ian Abercrombie'})
MERGE (a11:Actor {name: 'Terrence C. Carson'})
MERGE (a12:Actor {name: 'Anthony Daniels'})
MERGE (a13:Actor {name: 'Ahmed Best'})
MERGE (a14:Actor {name: 'Jim Cummings'})
MERGE (a15:Actor {name: 'Clancy Brown'})
MERGE (a16:Actor {name: 'Stephen Stanton'})
MERGE (a17:Actor {name: 'Jon Favreau'})
MERGE (a18:Actor {name: 'Katee Sackhoff'})
MERGE (a19:Actor {name: 'Sam Witwer'})

// Relacionar actores principales
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
MERGE (s)-[:HAS_ACTOR]->(a13)
MERGE (s)-[:HAS_ACTOR]->(a14)
MERGE (s)-[:HAS_ACTOR]->(a15)
MERGE (s)-[:HAS_ACTOR]->(a16)
MERGE (s)-[:HAS_ACTOR]->(a17)
MERGE (s)-[:HAS_ACTOR]->(a18)
MERGE (s)-[:HAS_ACTOR]->(a19)
