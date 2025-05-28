package com.recomendaciones.recomendaciones.config; // Cambia el package según tu estructura

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class CorsConfig implements WebMvcConfigurer {

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**") // Permite todas las rutas
            .allowedOrigins("*")    // Permite cualquier origen
            .allowedMethods("*")    // Permite cualquier método (GET, POST, PUT, DELETE)
            .allowedHeaders("*")    // Permite cualquier header
            .allowCredentials(false); // Si no necesitas cookies/sesiones, esto puede ir en false
    }
}
