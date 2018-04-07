package com.hafiz;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Desc:主类
 * Created by hafiz.zhang on 2018/4/07.
 */
public class Runner {
    public static void main(String[] args) {
        ApplicationContext context
                = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        System.out.println("context:" + context.getClass());
        System.out.println("The Main Class Is Running....");
    }
}
