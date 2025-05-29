// Crear la serie (MERGE para evitar duplicados)
MERGE (s:Series {
    seriesId: '26',
    name: 'Moon Knight'
})
ON CREATE SET s.rating = 7.5,
              s.numOfRatings = 131000,
              s.description = 'Marc Spector, un mercenario con trastorno de identidad disociativo, se ve envuelto en un misterio mortal que involucra a dioses egipcios con sus múltiples identidades, como Steven Grant.',
              s.year = 2022,
              s.duration = 50,
              s.totalSeasons = 1,
              s.totalEpisodes = 6,
              s.image = 'moon-knight.png'

// MERGE de géneros
MERGE (g1:Genre {name: 'Action'})
MERGE (g2:Genre {name: 'Adventure'})
MERGE (g3:Genre {name: 'Fantasy'})
MERGE (g4:Genre {name: 'Psychological Thriller'})
// Relacionar géneros
MERGE (s)-[:BELONGS_TO]->(g1)
MERGE (s)-[:BELONGS_TO]->(g2)
MERGE (s)-[:BELONGS_TO]->(g3)
MERGE (s)-[:BELONGS_TO]->(g4)

// MERGE de tags
MERGE (t1:Tag {name: 'Marvel'})
MERGE (t2:Tag {name: 'Superhero'})
MERGE (t3:Tag {name: 'Egyptian Mythology'})
MERGE (t4:Tag {name: 'Dissociative Identity Disorder'})
MERGE (t5:Tag {name: 'Mystery'})
MERGE (t6:Tag {name: 'Vigilante'})
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

// MERGE de directores
MERGE (d1:Director {name: 'Mohamed Diab'})
MERGE (d2:Director {name: 'Justin Benson'})
MERGE (d3:Director {name: 'Aaron Moorhead'})
MERGE (s)-[:DIRECTED_BY]->(d1)
MERGE (s)-[:DIRECTED_BY]->(d2)
MERGE (s)-[:DIRECTED_BY]->(d3)

// MERGE de actores
MERGE (a1:Actor {name: 'Oscar Isaac'})
MERGE (a2:Actor {name: 'May Calamawy'})
MERGE (a3:Actor {name: 'Ethan Hawke'})
MERGE (a4:Actor {name: 'F. Murray Abraham'})
MERGE (a5:Actor {name: 'Ann Akinjirin'})
MERGE (a6:Actor {name: 'David Ganly'})
MERGE (a7:Actor {name: 'Khalid Abdalla'})
MERGE (a8:Actor {name: 'Gaspard Ulliel'})
MERGE (a9:Actor {name: 'Antonia Salib'})
MERGE (a10:Actor {name: 'Fernanda Andrade'})
MERGE (a11:Actor {name: 'Rey Lucas'})
MERGE (a12:Actor {name: 'Sofia Danu'})
MERGE (a13:Actor {name: 'Saba Mubarak'})
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
MERGE (s)-[:HAS_ACTOR]->(a13)
