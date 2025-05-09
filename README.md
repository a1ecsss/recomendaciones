# **Sistema de Recomendación de Series de Televisión** 📺

## **Descripción del Proyecto** 💡

Este proyecto tiene como objetivo desarrollar un sistema de **recomendación de series de televisión**. Utilizando una base de datos de grafos (**Neo4j**), se crearán relaciones entre las **series** y sus atributos (géneros, actores, directores, etc.) para poder recomendar nuevas series basadas en preferencias de los usuarios, como los géneros favoritos, los actores preferidos, las calificaciones y otras características clave.

El sistema es diseñado para **recomendar series** utilizando un modelo de base de datos de grafos, en el que las **relaciones** entre los nodos de las series, géneros, actores, y otros factores se utilizan para crear recomendaciones personalizadas. 🔄

---

## **Estructura de la Base de Datos** 🗄️

### **Nodos Utilizados** 🔘

A continuación se describen los **nodos** y sus respectivos **atributos** que se almacenarán en la base de datos para construir el sistema de recomendación.

### **1. Series (Serie de Televisión)** 🎬
- **seriesId**: ID único de la serie (por ejemplo, un número o un código único).
- **name**: Nombre de la serie.
- **rating**: Calificación promedio de la serie (puede ser entre 1 y 5 o entre 0 y 10, dependiendo de cómo manejes las calificaciones).
- **numOfRatings**: Número de calificaciones que la serie ha recibido (esto indica la popularidad de la serie).
- **description**: Descripción breve de la serie.
- **year**: Año de estreno de la serie.
- **duration**: Duración promedio de cada episodio (en minutos).
- **totalSeasons**: Número total de temporadas de la serie.
- **totalEpisodes**: Número total de episodios de la serie.

### **2. Género (Genre)** 🎭
- **genreId**: ID único del género.
- **name**: Nombre del género (por ejemplo, Comedy, Drama, Action, etc.).

### **3. Actor (Actor)** 🎤
- **actorId**: ID único del actor.
- **name**: Nombre del actor.
- **birthDate**: Fecha de nacimiento del actor (opcional).
- **nationality**: Nacionalidad del actor (opcional).

### **4. Director (Director)** 🎬
- **directorId**: ID único del director.
- **name**: Nombre del director.
- **birthDate**: Fecha de nacimiento del director (opcional).
- **nationality**: Nacionalidad del director (opcional).

### **5. Tag (Etiquetas Temáticas)** 🏷️
- **tagId**: ID único de la etiqueta.
- **name**: Nombre de la etiqueta (por ejemplo, Thriller, Romance, Sci-Fi, Historical, etc.).

### **6. Idioma (Language)** 🌐
- **languageId**: ID único del idioma.
- **name**: Nombre del idioma (por ejemplo, English, Spanish, French).

### **7. País (Country)** 🌍
- **countryId**: ID único del país.
- **name**: Nombre del país (por ejemplo, USA, UK, Spain, etc.).

### **8. Rating (Calificación)** ⭐
- **ratingId**: ID único de la calificación.
- **ratingValue**: Calificación otorgada (puede ser un valor numérico de 1 a 5 o de 0 a 10).
- **ratingSource**: Fuente de la calificación (por ejemplo, User, Critic).

---

## **Relaciones entre los Nodos** 🔗

Las relaciones entre los nodos serán clave para el sistema de recomendaciones. Algunas de las relaciones que se utilizarán en el modelo incluyen:

- **Series-[:BELONGS_TO]->Genre**: Relaciona una serie con su género.
- **Series-[:HAS_ACTOR]->Actor**: Relaciona una serie con los actores que participan en ella.
- **Series-[:DIRECTED_BY]->Director**: Relaciona una serie con el director que la dirige.
- **Series-[:HAS_TAG]->Tag**: Relaciona una serie con una o más etiquetas temáticas.
- **Series-[:IS_IN_LANGUAGE]->Language**: Relaciona una serie con el idioma en el que está disponible.
- **Series-[:PRODUCED_IN]->Country**: Relaciona una serie con el país donde fue producida.
- **Series-[:HAS_RATING]->Rating**: Relaciona una serie con las calificaciones que ha recibido.

---

## **Tecnologías Utilizadas** ⚙️

- **Neo4j**: Base de datos de grafos para almacenar y gestionar los nodos y relaciones.
- **Cypher**: Lenguaje de consulta utilizado para interactuar con la base de datos Neo4j.
- **Backend (Java/Spring Boot)**: Desarrollo del backend para manejar la lógica del sistema de recomendaciones.
- **Frontend (Angular)**: Desarrollo de la interfaz de usuario para interactuar con el sistema de recomendaciones.

---

## **Objetivo del Proyecto** 🎯

El objetivo principal del proyecto es crear un **sistema de recomendaciones de series de televisión** que, utilizando la información sobre géneros, actores, directores, calificaciones y otras características clave de las series, pueda sugerir nuevas series que se ajusten a los gustos del usuario. Las recomendaciones estarán basadas en los géneros preferidos, actores y directores que el usuario haya mostrado interés en ver, utilizando una base de datos de grafos que aproveche las relaciones entre estos atributos.

---

Este archivo README proporciona una visión general del proyecto, la estructura de la base de datos y las tecnologías utilizadas.

## **Notas** 📝

En el futuro se podrá explorar la idea de almacenar información del usuario para recomendaciones más precisas.