package com.kh.baseball.configuration;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
@ConfigurationProperties(prefix = "custom.email")
@PropertySource("classpath:application.properties")
public class EmailProperties {
	private String host;
	private int port;
	private String username, password;
}
