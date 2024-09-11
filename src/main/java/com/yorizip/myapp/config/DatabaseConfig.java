package com.yorizip.myapp.config;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


import javax.sql.DataSource;

@Configuration
public class DatabaseConfig {
    @Bean
    public DataSource dataSource() {
        BasicDataSource dataSource = new BasicDataSource();
        dataSource.setDriverClassName("oracle.jdbc.driver.OracleDriver"); // Oracle 드라이버 설정
        dataSource.setUrl("jdbc:oracle:thin:@localhost:1521:xe"); // Oracle XE 버전의 기본 URL (localhost:1521과 xe)
        dataSource.setUsername("KIT5"); // 데이터베이스 사용자 이름
        dataSource.setPassword("1234"); // 데이터베이스 비밀번호
        return dataSource;
    }
}
