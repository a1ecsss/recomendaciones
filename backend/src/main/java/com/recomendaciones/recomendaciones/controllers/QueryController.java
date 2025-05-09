package com.recomendaciones.recomendaciones.controllers;

import com.recomendaciones.recomendaciones.services.FileReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class QueryController {

    @Autowired //inyeccion del servicio de lector de archivos
    private FileReaderService fileReaderService;

    @GetMapping("/getRecommendedSeries") //direccion de consulta http
    public String getRecommendedSeries(@RequestParam String name) {
        // Llama al servicio para leer el archivo de query y devolverlo (de momento no hace la consulta a base de datos)
        return fileReaderService.readQueryFile(name);
    }
}
