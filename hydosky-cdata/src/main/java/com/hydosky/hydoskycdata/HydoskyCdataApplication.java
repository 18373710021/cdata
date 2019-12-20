package com.hydosky.hydoskycdata;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 启动类
 */
@SpringBootApplication
@MapperScan(basePackages = {"com.hydosky.**.mapper.**"})
public class HydoskyCdataApplication {

    public static void main(String[] args) {
        SpringApplication.run(HydoskyCdataApplication.class, args);

    }

}
