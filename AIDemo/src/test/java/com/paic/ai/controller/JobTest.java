package com.paic.ai.controller;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class JobTest {
    
    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext(
                new String[]{"classpath:spring-mybatis.xml","classpath:applicationContext-quartz.xml"});
    }

}
