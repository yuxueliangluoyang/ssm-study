package com.paic.ai.utils;

import java.io.IOException;
import java.util.Properties;

import org.apache.log4j.Logger;




public class ConfigUtil {

    private static Logger log = Logger.getLogger(ConfigUtil.class);
   /* redis.ip=127.0.0.1
    redis.port=6379
    redis.key=SOA
    redis.password=
    #是否启用redis？true启用，false不启用。
    redis.switch=true
    
    jedis.pool.maxActive=3000
    jedis.pool.maxIdle=1000
    jedis.pool.maxWait=1500
    jedis.pool.testOnBorrow=true
    jedis.pool.testOnReturn=true
    jedis.pool.timeout=5000*/
     
    public static boolean redisSwitch;
    public static int maxIdle;
    public static boolean testOnBorrow;
    public static boolean testOnReturn;
    public static String ip;
    public static int port;
    public static String key;
    public static String password;
    public static int timeout;
    public static int fail_count=0;
    
    static {
        Properties p = new Properties();
        try {
            p.load(JedisUtil.class.getResourceAsStream("/redis.properties"));
            redisSwitch = Boolean.valueOf(p.getProperty("redis.switch"));
            maxIdle = Integer.valueOf(p.getProperty("jedis.pool.maxIdle"));
            testOnBorrow = Boolean.valueOf(p.getProperty("jedis.pool.testOnBorrow"));
            testOnReturn = Boolean.valueOf(p.getProperty("jedis.pool.testOnReturn"));
            ip = p.getProperty("redis.ip");
            port = Integer.valueOf(p.getProperty("redis.port"));
            key = p.getProperty("redis.key");
            password = p.getProperty("redis.password");
            timeout = Integer.valueOf(p.getProperty("jedis.pool.timeout"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    /*
     * 对redis开关进行设置，分三种情况：
     * 1:如果现在开关是打开的，则关闭redispool
     * 2：如果现在开关是关闭的，则打开redispool
     * 3：如果现在开关状态与配置状态一致，则不做操作
     */
    public static void setSwitch(boolean redisSwitch){
        if (true == ConfigUtil.redisSwitch && false == redisSwitch) {
            log.info("switch:open-->close");
            JedisUtil.closeJedisPool();
        } else if (false == ConfigUtil.redisSwitch && true == redisSwitch) {
            log.info("switch:close-->open");
            JedisUtil.getInstence();
        } 
        ConfigUtil.redisSwitch = redisSwitch;
    }
    
    //当redis连接异常数量超过一定数值后，不再走redis，但是没有一个机制，当redis恢复后，重新走redis
    public static void setFail(){
        if (redisSwitch) {
            fail_count = fail_count + 1;
            if (fail_count > 10) {
                log.info("redis连接异常超过10次，不再走redis");
                setSwitch(false);
            }
        }
    }
    
    //重新恢复走redis连接
    public static void setSucc(){
        if (fail_count > 0) {
            fail_count = 0;
        }
        if (!redisSwitch) {
            setSwitch(true);
        }
    }
    
    public static void main(String[] args) {
        System.out.println(redisSwitch);
    }
}
