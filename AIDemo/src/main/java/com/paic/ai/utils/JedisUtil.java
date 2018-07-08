package com.paic.ai.utils;

import org.apache.log4j.Logger;
import org.mybatis.caches.redis.SerializeUtil;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;


public class JedisUtil {

    private static Logger log = Logger.getLogger(JedisUtil.class);
    
    private static JedisPool JEDISPOOL;
    
    public static void getInstence(){
        if (JEDISPOOL == null) {
            log.info("jedisUtil getInstence...");
            try {
                JedisPoolConfig conf = new JedisPoolConfig();
                conf.setMaxIdle(ConfigUtil.maxIdle);
                conf.setTestOnBorrow(ConfigUtil.testOnBorrow);
                //当配置文件中带密码时，则创建带密码的缓存池
                if (ConfigUtil.password != null && !"".equals(ConfigUtil.password)) {
                    JEDISPOOL = new JedisPool(conf, ConfigUtil.ip,ConfigUtil.port,ConfigUtil.timeout,ConfigUtil.password);
                } else {
                    //没有配置密码，则创建无密码的缓存池
                    JEDISPOOL = new JedisPool(conf, ConfigUtil.ip,ConfigUtil.port,ConfigUtil.timeout);
                }
            } catch (Exception e) {
                log.error("读取redis.properties异常...",e);
            }
        }
    }

    //从jedisPool池中获取一个jedis对象
    public static Jedis getJedis(){
        try {
            return JEDISPOOL.getResource();
        } catch (Exception e) {
            return null;
        }
    }
    //关闭指定的jedis对象
    public static void closeJedis(Jedis jedis){
        if (jedis != null) {
            jedis.close();
        }
    }
    //关闭jedisPool对象
    public static void closeJedisPool() {
        if (JEDISPOOL != null) {
            JEDISPOOL.close();
        }
    }
    //redis序列化存储Object
    public static void put(String id,Object key,Object value){
        Jedis jedis = getJedis();
        log.info("redis put ... key=["+key+"],value=["+value+"]");
        try {
            jedis.hset(SerializeUtil.serialize(id), SerializeUtil.serialize(key), SerializeUtil.serialize(value));
            ConfigUtil.setSucc();
        } catch (Exception e) {
            ConfigUtil.setFail();
            log.error("redis 执行序列化数据异常，【"+e.getMessage()+"】");
        }finally{
            closeJedis(jedis);
        }
    }
    
    public static Object get(String id,Object key){
        Jedis jedis = getJedis();
        try {
            Object obj = SerializeUtil.unserialize(jedis.hget(SerializeUtil.serialize(id), SerializeUtil.serialize(key)));
            log.info("redis get ... key=["+key+"],value=["+obj+"]");
            ConfigUtil.setSucc();
            return obj;
        } catch (Exception e) {
            ConfigUtil.setFail();
            log.error("redis get 异常，【"+e.getMessage()+"】");
        } finally {
            closeJedis(jedis);
        }
        return null;
    }
    
    public static Long remove(String id,Object key){
        Jedis jedis = getJedis();
        try {
            Long num = jedis.hdel(id.toString(), key.toString());
            ConfigUtil.setSucc();
            return num;
        } catch (Exception e) {
            ConfigUtil.setFail();
            log.error("redis remove 异常，【"+e.getMessage()+"】");
        } finally {
            closeJedis(jedis);
        }
        return null;
    }
    
    public static void removeAll(String id){
        Jedis jedis = getJedis();
        try {
            jedis.del(id.toString());
            ConfigUtil.setSucc();
        } catch (Exception e) {
            ConfigUtil.setFail();
            log.error("redis removeAll 异常，【"+e.getMessage()+"】");
        } finally {
            closeJedis(jedis);
        }
    }
    
    public static int getSize(String id){
        Jedis jedis = getJedis();
        try {
            return jedis.hgetAll(SerializeUtil.serialize(id)).size();  
        } catch (Exception e) {
            ConfigUtil.setFail();
            log.error("redis getSize 异常，【"+e.getMessage()+"】");
        } finally {
            closeJedis(jedis);
        }
        return -1;
    }
}
