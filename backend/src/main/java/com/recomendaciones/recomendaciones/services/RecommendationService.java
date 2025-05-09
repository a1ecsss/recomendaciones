package com.recomendaciones.recomendaciones.services;

import com.recomendaciones.recomendaciones.models.HttpResponse;
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

    public HttpResponse<String> getRecommendedSeries(String name) {
        try {
            //leer el archivo query correspondiente que esta en queries
            String cypherQuery = fileReaderService.readQueryFile("knn-algorithm");  // Reemplaza con el nombre adecuado

            //Reemplazar $name en el query con el parámetro recibido
            cypherQuery = cypherQuery.replace("$name", name);

            //Ejecutar la consulta en Neo4j
            try (Session session = neo4jDriver.session()) {
                Result result = session.run(cypherQuery);

                //procesar el resultado
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
