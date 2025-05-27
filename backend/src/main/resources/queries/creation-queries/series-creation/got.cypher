// Crear la serie
MERGE (s:Series {seriesId: '7', name: 'Game of Thrones'})
ON CREATE SET s.rating = 9.3,
              s.numOfRatings = 2000000,
              s.description = 'Nueve familias nobles luchan por el control de los Siete Reinos de Westeros, mientras una antigua amenaza regresa después de estar dormida durante milenios.',
              s.year = 2011,
              s.duration = 57,
              s.totalSeasons = 8,
              s.totalEpisodes = 73,
              s.image = 'game_of_thrones.png'

// MERGE de géneros
MERGE (g1:Genre {name: 'Drama'})
MERGE (g2:Genre {name: 'Fantasy'})
MERGE (g3:Genre {name: 'Adventure'})
MERGE (g4:Genre {name: 'Action'})
MERGE (g5:Genre {name: 'Political'})
MERGE (g6:Genre {name: 'War'})
MERGE (g7:Genre {name: 'Mystery'})

// Relacionar géneros
MERGE (s)-[:BELONGS_TO]->(g1)
MERGE (s)-[:BELONGS_TO]->(g2)
MERGE (s)-[:BELONGS_TO]->(g3)
MERGE (s)-[:BELONGS_TO]->(g4)
MERGE (s)-[:BELONGS_TO]->(g5)
MERGE (s)-[:BELONGS_TO]->(g6)
MERGE (s)-[:BELONGS_TO]->(g7)

// MERGE de tags
MERGE (t1:Tag {name: 'Medieval'})
MERGE (t2:Tag {name: 'Dragons'})
MERGE (t3:Tag {name: 'Politics'})
MERGE (t4:Tag {name: 'Betrayal'})
MERGE (t5:Tag {name: 'War'})
MERGE (t6:Tag {name: 'Magic'})
MERGE (t7:Tag {name: 'Family'})

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

// MERGE de directores
MERGE (d1:Director {name: 'David Benioff'})
MERGE (d2:Director {name: 'D.B. Weiss'})
MERGE (d3:Director {name: 'Miguel Sapochnik'})
MERGE (d4:Director {name: 'David Nutter'})
MERGE (d5:Director {name: 'Alan Taylor'})
MERGE (d6:Director {name: 'Neil Marshall'})
MERGE (d7:Director {name: 'Jack Bender'})

// Relacionar directores
MERGE (s)-[:DIRECTED_BY]->(d1)
MERGE (s)-[:DIRECTED_BY]->(d2)
MERGE (s)-[:DIRECTED_BY]->(d3)
MERGE (s)-[:DIRECTED_BY]->(d4)
MERGE (s)-[:DIRECTED_BY]->(d5)
MERGE (s)-[:DIRECTED_BY]->(d6)
MERGE (s)-[:DIRECTED_BY]->(d7)

// MERGE de actores
MERGE (a1:Actor {name: 'Emilia Clarke'})
MERGE (a2:Actor {name: 'Kit Harington'})
MERGE (a3:Actor {name: 'Peter Dinklage'})
MERGE (a4:Actor {name: 'Lena Headey'})
MERGE (a5:Actor {name: 'Nikolaj Coster-Waldau'})
MERGE (a6:Actor {name: 'Sophie Turner'})
MERGE (a7:Actor {name: 'Maisie Williams'})
MERGE (a8:Actor {name: 'Sean Bean'})
MERGE (a9:Actor {name: 'Richard Madden'})
MERGE (a10:Actor {name: 'Iain Glen'})
MERGE (a11:Actor {name: 'Alfie Allen'})
MERGE (a12:Actor {name: 'Gwendoline Christie'})
MERGE (a13:Actor {name: 'John Bradley'})
MERGE (a14:Actor {name: 'Isaac Hempstead Wright'})
MERGE (a15:Actor {name: 'Carice van Houten'})
MERGE (a16:Actor {name: 'Liam Cunningham'})
MERGE (a17:Actor {name: 'Aidan Gillen'})
MERGE (a18:Actor {name: 'Natalie Dormer'})
MERGE (a19:Actor {name: 'Stephen Dillane'})
MERGE (a20:Actor {name: 'Charles Dance'})
MERGE (a21:Actor {name: 'Rory McCann'})
MERGE (a22:Actor {name: 'Rose Leslie'})
MERGE (a23:Actor {name: 'Jerome Flynn'})
MERGE (a24:Actor {name: 'Kristofer Hivju'})
MERGE (a25:Actor {name: 'Jacob Anderson'})
MERGE (a26:Actor {name: 'Conleth Hill'})
MERGE (a27:Actor {name: 'Michelle Fairley'})
MERGE (a28:Actor {name: 'Mark Addy'})
MERGE (a29:Actor {name: 'Natalia Tena'})
MERGE (a30:Actor {name: 'Tom Wlaschiha'})

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
MERGE (s)-[:HAS_ACTOR]->(a20)
MERGE (s)-[:HAS_ACTOR]->(a21)
MERGE (s)-[:HAS_ACTOR]->(a22)
MERGE (s)-[:HAS_ACTOR]->(a23)
MERGE (s)-[:HAS_ACTOR]->(a24)
MERGE (s)-[:HAS_ACTOR]->(a25)
MERGE (s)-[:HAS_ACTOR]->(a26)
MERGE (s)-[:HAS_ACTOR]->(a27)
MERGE (s)-[:HAS_ACTOR]->(a28)
MERGE (s)-[:HAS_ACTOR]->(a29)
MERGE (s)-[:HAS_ACTOR]->(a30)
