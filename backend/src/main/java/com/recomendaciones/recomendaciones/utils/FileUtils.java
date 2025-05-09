package com.recomendaciones.recomendaciones.utils;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class FileUtils {

    public static boolean doesFileExist(String fileName) {
        Path filePath = Paths.get("src/main/resources/queries/" + fileName + ".cypher");
        return Files.exists(filePath);
    }
}
