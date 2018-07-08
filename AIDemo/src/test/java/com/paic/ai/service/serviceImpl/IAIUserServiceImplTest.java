package com.paic.ai.service.serviceImpl;

import java.util.List;

import javax.xml.rpc.ServiceException;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.alibaba.fastjson.JSON;
import com.paic.ai.dto.AiUser;
import com.paic.ai.service.IAIUserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class IAIUserServiceImplTest {

    private static Logger log = Logger.getLogger(IAIUserServiceImplTest.class);
    
    @Autowired
    private IAIUserService IAIUserService;
    
    @Test
    public void testSelectByPrimaryKey() {
        try {
//            AiUser user = IAIUserService.selectByPrimaryKey(1);
//            log.info(JSON.toJSONString(user));
            List<AiUser> list = IAIUserService.selectAll();
            log.info(JSON.toJSONString(list));
        } catch (ServiceException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

}
