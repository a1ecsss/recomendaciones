package com.recomendaciones.recomendaciones.controllers;

import com.recomendaciones.recomendaciones.models.HttpResponse;
import com.recomendaciones.recomendaciones.models.LoginUserInfo;
import com.recomendaciones.recomendaciones.models.Series;
import com.recomendaciones.recomendaciones.models.User;
import com.recomendaciones.recomendaciones.models.requests.UserSeriesRequest;
import com.recomendaciones.recomendaciones.services.FileReaderService;
import com.recomendaciones.recomendaciones.services.RecommendationService;
import org.springframework.web.bind.annotation.RequestBody;


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

    @PostMapping("/initializeDatabase")
    public HttpResponse<String> initializeDatabase() {
        // Llamar a servicio para inicializar la base de datos
        return recommendationService.initializeDatabase();
    }

    @PostMapping("/hasLiked")
    public HttpResponse<Void> toggleHasLiked(@RequestBody UserSeriesRequest info) {
        return recommendationService.toggleWatchedOrLiked(info, true);
    }

    @PostMapping("/hasWatched")
    public HttpResponse<Void> toggleHasWatched(@RequestBody UserSeriesRequest info) {
        return recommendationService.toggleWatchedOrLiked(info, false);
    }

    @PostMapping("/createUser")
    public HttpResponse<Void> createUser(@RequestBody User user) {
        return recommendationService.createUser(user);
    }

    @GetMapping("/login")
    public HttpResponse<LoginUserInfo> logIn(
        @RequestParam("username") String username,
        @RequestParam("password") String password
    ) {
        return recommendationService.logIn(username, password);
    }

    @GetMapping("/recomendedSeries")
    public HttpResponse<Series[]> recomendedSeries(
        @RequestParam("userId") String userId
    ) {
        return recommendationService.recomendedSeries(userId);
    }

    @GetMapping("/getAllSeries")
    public HttpResponse<Series[]> getAllSeries(
        @RequestParam("userId") String userId
    ) {
        return recommendationService.getAllSeries(userId);
    }
}
