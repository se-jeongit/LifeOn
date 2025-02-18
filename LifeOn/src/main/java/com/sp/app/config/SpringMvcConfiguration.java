package com.sp.app.config;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.sp.app.interceptor.LoginCheckInterceptor;

@Configuration
public class SpringMvcConfiguration implements WebMvcConfigurer {
	
	public void addInterceptors(InterceptorRegistry registry) {
		List<String> excludePaths = new ArrayList<>();
		
		excludePaths.add("/");
		excludePaths.add("/dist/**");
		excludePaths.add("/member/login");
		excludePaths.add("/member/logout");
		excludePaths.add("/member/join");
		excludePaths.add("/member/idCheck");
		excludePaths.add("/member/nickNameCheck");
		excludePaths.add("/member/complete");
		excludePaths.add("/member/idFind");
		excludePaths.add("/member/authCodeCheckId");
		excludePaths.add("/member/idFindComplete");
		excludePaths.add("/member/pwdFind");
		excludePaths.add("/member/authCodeCheckPwd");
		excludePaths.add("/member/pwdSet");
		excludePaths.add("/member/");
		excludePaths.add("/uploads/**");
	
		
		registry.addInterceptor(new LoginCheckInterceptor())
			.excludePathPatterns(excludePaths);
		
	}
	
	
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/dist/images/**")
                .addResourceLocations("file:src/main/resources/static/dist/images/");
    }
	
}
