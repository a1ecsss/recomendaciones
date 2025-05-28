package com.recomendaciones.recomendaciones.services;

import com.recomendaciones.recomendaciones.models.HttpResponse;
import com.recomendaciones.recomendaciones.models.LoginUserInfo;
import com.recomendaciones.recomendaciones.models.Series;
import com.recomendaciones.recomendaciones.models.User;
import com.recomendaciones.recomendaciones.models.requests.UserSeriesRequest;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.neo4j.driver.Driver;
import org.neo4j.driver.Session;
import org.neo4j.driver.Result;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.neo4j.driver.Record;


@Service
public class RecommendationService {

    @Autowired
    private FileReaderService fileReaderService; //inyeccion del servicio de lectura

    @Autowired
    private Driver neo4jDriver;  //driver Neo4j para interactuar con la base de datos

    public HttpResponse<String> initializeDatabase() {
        List<String> queryFiles = List.of(
            "creation-queries/series-creation/arcane",
            "creation-queries/series-creation/breaking-bad",
            "creation-queries/series-creation/chernobyl",
            "creation-queries/series-creation/daredevil",
            "creation-queries/series-creation/fall-out",
            "creation-queries/series-creation/friends",
            "creation-queries/series-creation/got",
            "creation-queries/series-creation/hawkeye",
            "creation-queries/series-creation/invincible",
            "creation-queries/series-creation/loki",
            "creation-queries/series-creation/peaky-blinders",
            "creation-queries/series-creation/penny-dreadful",
            "creation-queries/series-creation/star-wars-the-clone-wars",
            "creation-queries/series-creation/the-boys",
            "creation-queries/series-creation/the-dark-crystal",
            "creation-queries/series-creation/the-last-of-us",
            "creation-queries/series-creation/the-mandalorian",
            "creation-queries/series-creation/the-queens-gambit",
            "creation-queries/series-creation/the-walking-dead",
            "creation-queries/series-creation/x-men-97"
        );

        for (String fileName : queryFiles) {
            try {
                String cypherQuery = fileReaderService.readQueryFile(fileName);
                try (Session session = neo4jDriver.session()) {
                    session.run(cypherQuery);
                    System.out.println("Query from " + fileName + " executed successfully 🚀");
                }
            } catch (Exception e) {
                return new HttpResponse<>(HttpResponse.Status.ERROR, "Error executing the query ("+fileName+"): " + e.getMessage(), null);
            }
        }

        return new HttpResponse<>(HttpResponse.Status.SUCCESS, "Database Initialized", null);
    }

    public HttpResponse<String> getRecommendedSeries(String name) {
        try {
            String cypherQuery = fileReaderService.readQueryFile("knn-algorithm");

            try (Session session = neo4jDriver.session()) {
                Map<String, Object> params = Map.of("name", name);
                Result result = session.run(cypherQuery, params);
                if (result.hasNext()) {
                    String recommendedSeries = result.next().get("RecommendedSeries").asString();
                    return new HttpResponse<>(HttpResponse.Status.SUCCESS, "Recommendations found", recommendedSeries);
                } else {
                    return new HttpResponse<>(HttpResponse.Status.FAIL, "No recommendations found", null);
                }
            }

        } catch (Exception e) {
            return new HttpResponse<>(HttpResponse.Status.ERROR, "Error executing the query: " + e.getMessage(), null);
        }
    }

    public HttpResponse<Void> toggleWatchedOrLiked(UserSeriesRequest info, boolean type) { // true para HAS_LIKED, false para HAS_WATCHED
        try {
            String cypherQuery = type
                ? fileReaderService.readQueryFile("toggleLiked")
                : fileReaderService.readQueryFile("toggleWatched");

            try (Session session = neo4jDriver.session()) {

                Map<String, Object> params = Map.of(
                    "userId", info.getUserId(),
                    "seriesId", info.getSeriesId()
                );

                Result result = session.run(cypherQuery, params);

                if (result.hasNext()) {
                    return new HttpResponse<>(HttpResponse.Status.SUCCESS, "Relationship toggled successfully", null);
                } else {
                    return new HttpResponse<>(HttpResponse.Status.FAIL, "Couldn't toggle the relationship", null);
                }
            }

        } catch (Exception e) {
            return new HttpResponse<>(HttpResponse.Status.ERROR, "Error executing the query: " + e.getMessage(), null);
        }
    }

    public HttpResponse<Void> createUser(User user) {
        try {
            // Generar UUID para el userId
            user.setUserId(UUID.randomUUID().toString());
            String cypherQuery = fileReaderService.readQueryFile("creation-queries/user");
            try (Session session = neo4jDriver.session()) {
                // Mapear los parámetros
                Map<String, Object> params = Map.ofEntries(
                    Map.entry("userId", user.getUserId()),
                    Map.entry("username", user.getUsername()),
                    Map.entry("password", user.getPassword()),
                    Map.entry("importanceGenre", user.getImportanceGenre()),
                    Map.entry("importanceActor", user.getImportanceActor()),
                    Map.entry("importanceDirector", user.getImportanceDirector()),
                    Map.entry("importanceRating", user.getImportanceRating()),
                    Map.entry("importanceLanguage", user.getImportanceLanguage()),
                    Map.entry("importanceCountry", user.getImportanceCountry()),
                    Map.entry("importanceYear", user.getImportanceYear()),
                    Map.entry("importanceDuration", user.getImportanceDuration())
                );

                session.run(cypherQuery, params);
                return new HttpResponse<>(HttpResponse.Status.SUCCESS, "User created successfully", null);
            }
        } catch (Exception e) {
            // Manejar errores
            return new HttpResponse<>(HttpResponse.Status.ERROR,
            "Error executing the query: " + e.getClass().getName() + " - " + e.getMessage(), null);
        }
    }

    public HttpResponse<LoginUserInfo> logIn(String username, String password) {
        try {
            String cypherQuery = fileReaderService.readQueryFile("login");

            try (Session session = neo4jDriver.session()) {
                Map<String, Object> params = Map.of(
                    "username", username,
                    "password", password
                );

                Result result = session.run(cypherQuery, params);

                if (result.hasNext()) {
                    Record record = result.next();

                    LoginUserInfo loginUserInfo = new LoginUserInfo();
                    loginUserInfo.setUserId(record.get("userId").asString());
                    loginUserInfo.setUsername(record.get("username").asString());

                    return new HttpResponse<>(HttpResponse.Status.SUCCESS, "Login successful", loginUserInfo);
                } else {
                    return new HttpResponse<>(HttpResponse.Status.FAIL, "Invalid username or password", null);
                }
            }

        } catch (Exception e) {
            return new HttpResponse<>(HttpResponse.Status.ERROR, "Error executing the query: " + e.getMessage(), null);
        }
    }

    public HttpResponse<Series[]> recomendedSeries(String userId) {
        try {
            String cypherQuery = fileReaderService.readQueryFile("knn-algorithm");
            try (Session session = neo4jDriver.session()) {
                Map<String, Object> params = Map.of("userId", userId);
                Result result = session.run(cypherQuery, params);
                List<Series> seriesList = new ArrayList<>();
                while (result.hasNext()) {
                    Record record = result.next();
                    Series series = new Series();
                    series.setSeriesId(record.get("seriesId").asString());
                    series.setName(record.get("name").asString());
                    series.setRating(record.get("rating").asDouble());
                    series.setNumOfRatings(record.get("numOfRatings").asInt());
                    series.setDescription(record.get("description").asString());
                    series.setYear(record.get("year").asInt());
                    series.setDuration(record.get("duration").asInt());
                    series.setTotalSeasons(record.get("totalSeasons").asInt());
                    series.setTotalEpisodes(record.get("totalEpisodes").asInt());
                    series.setImage(record.get("image").asString());
                    if (record.containsKey("totalScore")) {
                        series.setTotalScore(record.get("totalScore").asDouble());
                    }
                    seriesList.add(series);
                }
                Series[] seriesArray = seriesList.toArray(new Series[0]);

                return new HttpResponse<>(HttpResponse.Status.SUCCESS, "Recommended series retrieved successfully", seriesArray);
            }

        } catch (Exception e) {
            return new HttpResponse<>(HttpResponse.Status.ERROR, "Error executing the query: " + e.getMessage(), null);
        }
    }

    public HttpResponse<Series[]> getAllSeries() {
        try {
            String cypherQuery = fileReaderService.readQueryFile("selectAllSeries");
            try (Session session = neo4jDriver.session()) {
                Result result = session.run(cypherQuery);
                List<Series> seriesList = new ArrayList<>();
                while (result.hasNext()) {
                    Record record = result.next();
                    Series series = new Series();
                    series.setSeriesId(record.get("seriesId").asString());
                    series.setName(record.get("name").asString());
                    series.setRating(record.get("rating").asDouble());
                    series.setNumOfRatings(record.get("numOfRatings").asInt());
                    series.setDescription(record.get("description").asString());
                    series.setYear(record.get("year").asInt());
                    series.setDuration(record.get("duration").asInt());
                    series.setTotalSeasons(record.get("totalSeasons").asInt());
                    series.setTotalEpisodes(record.get("totalEpisodes").asInt());
                    series.setImage(record.get("image").asString());
                    seriesList.add(series);
                }
                Series[] seriesArray = seriesList.toArray(new Series[0]);

                return new HttpResponse<>(HttpResponse.Status.SUCCESS, "Series retrieved successfully", seriesArray);
            }

        } catch (Exception e) {
            return new HttpResponse<>(HttpResponse.Status.ERROR, "Error executing the query: " + e.getMessage(), null);
        }
    }

}
