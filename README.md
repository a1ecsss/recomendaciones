
# **Sistema de Recomendación de Series de Televisión** 📺

## **Descripción del Proyecto** 💡

Este proyecto tiene como objetivo desarrollar un sistema de **recomendación de series de televisión**. Utilizando una base de datos de grafos (**Neo4j**), se crearán relaciones entre las **series** y sus atributos (géneros, actores, directores, etc.) para poder recomendar nuevas series basadas en preferencias de los usuarios, como los géneros favoritos, los actores preferidos, las calificaciones y otras características clave.

El sistema es diseñado para **recomendar series** utilizando un modelo de base de datos de grafos, en el que las **relaciones** entre los nodos de las series, géneros, actores, y otros factores se utilizan para crear recomendaciones personalizadas. 🔄

Por defecto, el backend corre en el puerto:  
`http://localhost:8080`

---

## **Estructura de la Base de Datos** 🗄️

### **Nodos Utilizados** 🔘

A continuación se describen los **nodos** y sus respectivos **atributos** que se almacenarán en la base de datos para construir el sistema de recomendación.

### **1. User (Usuario de la Plataforma)** 👤
- **userId**: ID único del usuario (puede ser un UUID o un número secuencial único).
- **username**: Nombre de usuario utilizado para el inicio de sesión.
- **password**: Contraseña del usuario (debe almacenarse de forma segura, preferiblemente hasheada).
- **importanceGenre**: Peso o importancia que el usuario le da al género de las series (puede ser un número de 1 a 5, donde 1 es "poco importante" y 5 es "muy importante").
- **importanceActor**: Peso que el usuario le asigna a los actores en sus preferencias de visualización.
- **importanceDirector**: Nivel de importancia que el usuario le da al director en la elección de las series.
- **importanceRating**: Valor que indica cuánto le importa al usuario la calificación promedio de las series.
- **importanceLanguage**: Importancia que el usuario le da al idioma en el que está disponible la serie.
- **importanceCountry**: Peso asignado por el usuario al país de origen de la serie.
- **importanceYear**: Preferencia del usuario por el año de estreno de las series.
- **importanceDuration**: Nivel de importancia que el usuario le asigna a la duración promedio de los episodios.

### **2. Series (Serie de Televisión)** 🎬
- **seriesId**: ID único de la serie (por ejemplo, un número o un código único).
- **name**: Nombre de la serie.
- **rating**: Calificación promedio de la serie (puede ser entre 1 y 5 o entre 0 y 10, dependiendo de cómo manejes las calificaciones).
- **numOfRatings**: Número de calificaciones que la serie ha recibido (esto indica la popularidad de la serie).
- **description**: Descripción breve de la serie.
- **year**: Año de estreno de la serie.
- **duration**: Duración promedio de cada episodio (en minutos).
- **totalSeasons**: Número total de temporadas de la serie.
- **totalEpisodes**: Número total de episodios de la serie.

### **3. Género (Genre)** 🎭
- **genreId**: ID único del género.
- **name**: Nombre del género (por ejemplo, Comedy, Drama, Action, etc.).

### **4. Actor (Actor)** 🎤
- **actorId**: ID único del actor.
- **name**: Nombre del actor.
- **birthDate**: Fecha de nacimiento del actor (opcional).
- **nationality**: Nacionalidad del actor (opcional).

### **5. Director (Director)** 🎬
- **directorId**: ID único del director.
- **name**: Nombre del director.
- **birthDate**: Fecha de nacimiento del director (opcional).
- **nationality**: Nacionalidad del director (opcional).

### **6. Tag (Etiquetas Temáticas)** 🏷️
- **tagId**: ID único de la etiqueta.
- **name**: Nombre de la etiqueta (por ejemplo, Thriller, Romance, Sci-Fi, Historical, etc.).

### **7. Idioma (Language)** 🌐
- **languageId**: ID único del idioma.
- **name**: Nombre del idioma (por ejemplo, English, Spanish, French).

### **8. País (Country)** 🌍
- **countryId**: ID único del país.
- **name**: Nombre del país (por ejemplo, USA, UK, Spain, etc.).


---

## **Relaciones entre los Nodos** 🔗

Las relaciones entre los nodos serán clave para el sistema de recomendaciones. Algunas de las relaciones que se utilizarán en el modelo incluyen:

- **Series-[:BELONGS_TO]->Genre**: Relaciona una serie con su género.
- **Series-[:HAS_ACTOR]->Actor**: Relaciona una serie con los actores que participan en ella.
- **Series-[:DIRECTED_BY]->Director**: Relaciona una serie con el director que la dirige.
- **Series-[:HAS_TAG]->Tag**: Relaciona una serie con una o más etiquetas temáticas.
- **Series-[:IS_IN_LANGUAGE]->Language**: Relaciona una serie con el idioma en el que está disponible.
- **Series-[:PRODUCED_IN]->Country**: Relaciona una serie con el país donde fue producida.
- **User-[:HAS_WATCHED]->Series**: Relaciona un usuario con una serie para no volver a recomednarla.
- **User-[:HAS_LIKED]->Series**: Relaciona un usuario con una serie, para determinar series gustadas y a partir de aqui hacer las recomendaciones.

---

## **Tecnologías Utilizadas** ⚙️

- **Neo4j**: Base de datos de grafos para almacenar y gestionar los nodos y relaciones.
- **Cypher**: Lenguaje de consulta utilizado para interactuar con la base de datos Neo4j.
- **Backend (Java/Spring Boot)**: Desarrollo del backend para manejar la lógica del sistema de recomendaciones.
- **Frontend (Angular)**: Desarrollo de la interfaz de usuario para interactuar con el sistema de recomendaciones.

---

## **Patrón de Respuesta del Backend** 🔄

Todas las respuestas del backend siguen el mismo patrón de respuesta, utilizando la siguiente interfaz (ejemplo en TypeScript para mayor comprensión, aunque el backend esté en Spring Boot Java):

```typescript
export class HttpResponse<T> { 
    static Status = {
        SUCCESS: 'SUCCESS',
        FAIL: 'FAIL',
        ERROR: 'ERROR'
    };

    status: string;    // Uno de los valores definidos en Status
    message: string;   // Mensaje o null
    value: T;          // Valor de tipo T o null

    constructor(status: string, message: string, value: T) {
        this.status = status;
        this.message = message;
        this.value = value;
    }

    toString(): string {
        return `HttpResponse { status: ${this.status}, message: ${this.message}, value: ${this.value} }`;
    }
}
```

- Si todo se procesa correctamente, el `status` será `"SUCCESS"` y el `message` será un mensaje describiendo la acción.
- Las respuestas de las queries que no retornan valores específicos (como toggle de likes o creación de usuarios) tendrán `value` como `null`.
- Las solicitudes **GET** siempre reciben los parámetros como `RequestParam`, mientras que las solicitudes **POST** envían y reciben datos en `RequestBody` en formato **JSON**.

---

## **Endpoints del Backend** 🚀

### Inicialización de la Base de Datos

- **POST /initializeDatabase**
    - Crea los nodos iniciales en la base de datos.
    - No requiere body.

---

### Endpoints para Interacción del Usuario

- **POST /hasLiked**
    - Marca o desmarca una serie como "like" para el usuario.
    - Body (`JSON`):
    ```json
    {
      "userId": "string",
      "seriesId": "string"
    }
    ```

- **POST /hasWatched**
    - Marca o desmarca una serie como "watched" para el usuario.
    - Body (`JSON`):
    ```json
    {
      "userId": "string",
      "seriesId": "string"
    }
    ```

- **POST /createUser**
    - Crea un nuevo usuario.
    - Body (`JSON`):
    ```json
    {
      "userId": "string",
      "username": "string",
      "password": "string",
      "importanceGenre": 1-5,
      "importanceActor": 1-5,
      "importanceDirector": 1-5,
      "importanceRating": 1-5,
      "importanceLanguage": 1-5,
      "importanceCountry": 1-5,
      "importanceYear": 1-5,
      "importanceDuration": 1-5
    }
    ```

- **GET /login**
    - Permite al usuario iniciar sesión.
    - RequestParam:
        - `username`: nombre de usuario
        - `password`: contraseña

- **GET /recomendedSeries**
    - Devuelve las series recomendadas para el usuario.
    - RequestParam:
        - `userId`: ID del usuario

- **GET /getAllSeries**
    - Devuelve todas las series disponibles.
    - RequestParam:
        - `userId`: ID del usuario

---

## **Configuración de la Base de Datos** 🛠️

Para conectar el backend con su base de datos Neo4j, debes modificar el archivo `application.properties` en el backend, ajustando los siguientes datos con los de tu entorno:

```properties
spring.neo4j.uri=bolt://localhost:7687
spring.neo4j.database=neo4j
spring.neo4j.authentication.username=neo4j
spring.neo4j.authentication.password=neo4j123456
```

---

## **Objetivo del Proyecto** 🎯

El objetivo principal del proyecto es crear un **sistema de recomendaciones de series de televisión** que, utilizando la información sobre géneros, actores, directores, calificaciones y otras características clave de las series, pueda sugerir nuevas series que se ajusten a los gustos del usuario.

---

Este archivo README proporciona una visión general del proyecto, la estructura de la base de datos, la configuración del backend y las rutas principales para el desarrollo del sistema de recomendaciones.
