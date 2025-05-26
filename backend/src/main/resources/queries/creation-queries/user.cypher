// Crear un usuario con sus preferencias
CREATE (u:User {
  userId: $userId,
  username: $username,
  password: $password,
  importanceGenre: $importanceGenre,
  importanceActor: $importanceActor,
  importanceDirector: $importanceDirector,
  importanceRating: $importanceRating,
  importanceLanguage: $importanceLanguage,
  importanceCountry: $importanceCountry,
  importanceYear: $importanceYear,
  importanceDuration: $importanceDuration
})
RETURN u