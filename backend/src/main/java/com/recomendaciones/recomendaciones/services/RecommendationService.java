package com.recomendaciones.recomendaciones.services;

import com.recomendaciones.recomendaciones.models.HttpResponse;

import java.util.List;
import java.util.Map;

import org.neo4j.driver.Driver;
import org.neo4j.driver.Session;
import org.neo4j.driver.Result;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
            // Leer el archivo query correctamente (sin reemplazos)
            String cypherQuery = fileReaderService.readQueryFile("knn-algorithm");  // O el nombre que uses

            // Ejecutar la consulta en Neo4j
            try (Session session = neo4jDriver.session()) {
                // Usa parámetros en lugar de reemplazos manuales
                Map<String, Object> params = Map.of("name", name);

                Result result = session.run(cypherQuery, params);

                // Procesar el resultado
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
}
