package com.paic.ai.service.serviceImpl;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("simpleService")
public class SimpleService {

    private static Logger log = Logger.getLogger(SimpleService.class);
    
    public void testJob1(){
        //这里执行定时调度任务
        log.info("testJob1......1");
        System.out.println("2--testJob1...." + System.currentTimeMillis()/1000);
    }
    
    public void testJob2(){
        log.info("testJob2.......2");
    }
}
