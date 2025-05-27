MATCH (u:User {username: $username, password: $password})
RETURN u.userId AS userId, u.username AS username