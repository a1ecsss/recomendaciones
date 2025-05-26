package com.recomendaciones.recomendaciones.controllers;

import com.recomendaciones.recomendaciones.models.HttpResponse;
import com.recomendaciones.recomendaciones.services.FileReaderService;
import com.recomendaciones.recomendaciones.services.RecommendationService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class QueryController {

    @Autowired //inyeccion del servicio de consulta a la base de datos neo4j
    private RecommendationService recommendationService;

    @GetMapping("/getRecommendedSeries")
    public HttpResponse<String> getRecommendedSeries(@RequestParam String name) {
        //llamar al servicio para obtener las recomendaciones y retornarlas
        System.out.println("name: "+ name);
        return recommendationService.getRecommendedSeries(name);
    }

     @PostMapping("/initializeDatabase")
    public HttpResponse<String> initializeDatabase() {
        // Llamar a servicio para inicializar la base de datos
        return recommendationService.initializeDatabase();
    }
}
