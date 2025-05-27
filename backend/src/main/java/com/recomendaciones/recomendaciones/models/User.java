package com.recomendaciones.recomendaciones.models;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class User {
    private String userId;
    private String username;
    private String password;

    private double importanceGenre;
    private double importanceActor;
    private double importanceDirector;
    private double importanceRating;
    private double importanceLanguage;
    private double importanceCountry;
    private double importanceYear;
    private double importanceDuration;

    // Getters y setters
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public double getImportanceGenre() {
        return importanceGenre;
    }

    public void setImportanceGenre(double importanceGenre) {
        this.importanceGenre = importanceGenre;
    }

    public double getImportanceActor() {
        return importanceActor;
    }

    public void setImportanceActor(double importanceActor) {
        this.importanceActor = importanceActor;
    }

    public double getImportanceDirector() {
        return importanceDirector;
    }

    public void setImportanceDirector(double importanceDirector) {
        this.importanceDirector = importanceDirector;
    }

    public double getImportanceRating() {
        return importanceRating;
    }

    public void setImportanceRating(double importanceRating) {
        this.importanceRating = importanceRating;
    }

    public double getImportanceLanguage() {
        return importanceLanguage;
    }

    public void setImportanceLanguage(double importanceLanguage) {
        this.importanceLanguage = importanceLanguage;
    }

    public double getImportanceCountry() {
        return importanceCountry;
    }

    public void setImportanceCountry(double importanceCountry) {
        this.importanceCountry = importanceCountry;
    }

    public double getImportanceYear() {
        return importanceYear;
    }

    public void setImportanceYear(double importanceYear) {
        this.importanceYear = importanceYear;
    }

    public double getImportanceDuration() {
        return importanceDuration;
    }

    public void setImportanceDuration(double importanceDuration) {
        this.importanceDuration = importanceDuration;
    }
}