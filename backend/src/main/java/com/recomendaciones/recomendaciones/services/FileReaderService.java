package com.recomendaciones.recomendaciones.services;

import org.springframework.stereotype.Service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.io.IOException;

@Service
public class FileReaderService {

    private static final String QUERY_DIRECTORY = "src/main/resources/queries/"; //direccion donde estaran los queries
    //segun documentacion de spring boot acceder a archivos fuera de los directorios definidos puede dificultar el acceso y es mala practica

    public String readQueryFile(String fileName) {
        //construye la ruta completa del archivo
        Path filePath = Paths.get(QUERY_DIRECTORY + fileName + ".cypher");

        try {
            //lee el contenido del archivo como un String
            return new String(Files.readAllBytes(filePath));
        } catch (IOException e) {
            e.printStackTrace();
            return "Error reading file: " + fileName;
        }
    }
}
