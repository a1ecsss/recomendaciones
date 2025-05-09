package com.recomendaciones.recomendaciones.models;

import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Id;
import org.springframework.data.neo4j.core.schema.Property;

@Node
public class Series {

    @Id
    private Long id;

    @Property
    private String name;

    @Property
    private String genre;

    // Otros atributos que quieras agregar

    // Getters y setters

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    // Otros getters y setters
}
