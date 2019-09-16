package com.buba.bgs;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.buba.bgs.dao")
public class WinepartyApplication {

    public static void main(String[] args) {
        SpringApplication.run(WinepartyApplication.class, args);
    }

}
