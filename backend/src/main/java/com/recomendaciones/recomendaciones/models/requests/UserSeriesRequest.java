package com.recomendaciones.recomendaciones.models.requests;

public class UserSeriesRequest {
    private String userId;
    private String seriesId;

    // Getters y setters
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getSeriesId() {
        return seriesId;
    }

    public void setSeriesId(String seriesId) {
        this.seriesId = seriesId;
    }
}
