package com.recomendaciones.recomendaciones.models;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class LoginUserInfo {
    private String userId;
    private String username;

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

}