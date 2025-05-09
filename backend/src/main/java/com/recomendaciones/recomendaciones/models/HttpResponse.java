package com.recomendaciones.recomendaciones.models;


public class HttpResponse<T> {

    //definir el tipo de status para el endpoint
    public enum Status {
        SUCCESS, FAIL, ERROR
    }

    private Status status;   //status será solo uno de los valores de la enumeración Status
    private String message;  //message será un String o null
    private T value;         //value puede ser de tipo T o null, para las consultas sin respuestas

    public HttpResponse(Status status, String message, T value) {
        this.status = status;
        this.message = message;
        this.value = value;
    }

    // Getters y setters
    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getValue() {
        return value;
    }

    public void setValue(T value) {
        this.value = value;
    }

    // Método toString() para representar el objeto como String
    @Override
    public String toString() {
        return "HttpResponse{" +
               "status=" + status +
               ", message='" + message + '\'' +
               ", value=" + value +
               '}';
    }
}