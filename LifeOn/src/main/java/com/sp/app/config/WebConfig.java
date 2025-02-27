package com.sp.app.config;

import org.springframework.boot.web.servlet.ServletListenerRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.sp.app.admin.service.VisitorCounter;

import jakarta.servlet.http.HttpSessionListener;

@Configuration
public class WebConfig {
	@Bean
	 public ServletListenerRegistrationBean<HttpSessionListener> sessionListenerRegistration(VisitorCounter visitorCounter) {
        ServletListenerRegistrationBean<HttpSessionListener> listenerBean =
                new ServletListenerRegistrationBean<>();
        listenerBean.setListener(visitorCounter);
        return listenerBean;
    }
}
