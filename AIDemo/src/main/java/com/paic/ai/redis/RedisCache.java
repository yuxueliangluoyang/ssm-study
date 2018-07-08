package com.paic.ai.redis;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

import org.apache.ibatis.cache.Cache;
import org.apache.log4j.Logger;

import com.paic.ai.utils.ConfigUtil;
import com.paic.ai.utils.JedisUtil;

public class RedisCache implements Cache{
    
    private static Logger log = Logger.getLogger(RedisCache.class);
    
    private String cacheId;
    /*
     * 读写锁：分为读锁和写锁，多个读锁不互斥，读锁与写锁互斥，这是由jvm自己控制的，你只要上好相应的锁即可。
     * 如果你的代码只读数据，可以很多人同时读，但不能同时写，那就上读锁；如果你的代码修改数据，只能有一个人在
     * 写，且不能同时读取，那就上写锁。总之，读的时候上读锁，写的时候上写锁。
     * 
     */
    private final ReadWriteLock readWriteLock = new ReentrantReadWriteLock(true);//实例化读写锁
    private final Lock read = readWriteLock.readLock();
    private final Lock write = readWriteLock.writeLock();
    
    public RedisCache(String cacheId){
        if (cacheId == null) {
            throw new IllegalArgumentException("Cache instence require an ID");
        }
        this.cacheId = ConfigUtil.key + "." + cacheId;
        log.info("查询结果存入缓存对应的缓存空间生成的名字cacheId：" + this.cacheId);
        if (ConfigUtil.redisSwitch) {
            JedisUtil.getInstence();
        }
    }
    
    @Override
    public String getId() {
        return cacheId;
    }
    
    @Override
    public void putObject(Object key, Object value) {
        // TODO 从（向）缓存中写数据，用写锁锁定，不允许读
        log.info("NTSRedisCache putObject =" + cacheId);
        if (ConfigUtil.redisSwitch) {
            //设置写锁
            write.lock();
            try {
                JedisUtil.put(cacheId, key, value);
            } catch (Exception e) {
                log.error("redisCache putObject异常【"+e.getMessage()+"】");
            } finally {
                write.unlock();
            }
        }
    }
    
    @Override
    public Object getObject(Object key) {
        // TODO 从缓存中读数据，读锁锁定，不允许写
        log.info("从缓存cacheId=" + cacheId + "中拿数据key=" + key +"的value");
        if (ConfigUtil.redisSwitch) {
            //设置读锁
            read.lock();
            try {
                return JedisUtil.get(cacheId, key);
            } catch (Exception e) {
                log.error("redisCache getObject异常【"+e.getMessage()+"】");
            } finally {
                read.unlock();
            }
        }
        return null;
    }
    
    @Override
    public Object removeObject(Object key) {
        // TODO 从缓存中改动数据，写锁锁定，不允许读，写完后释放锁
        log.info("从缓存cacheId=" + cacheId + "中删除数据key=" + key +"的value");
        if (ConfigUtil.redisSwitch) {
            write.lock();
            try {
                JedisUtil.remove(cacheId, key);
            } catch (Exception e) {
                log.error("redisCache removeObject异常【"+e.getMessage()+"】");
            } finally {
                write.unlock();
            }
        }
        return null;
    }
    
    @Override
    public void clear() {
        // TODO 从缓存中改动数据，写锁锁定，不允许读，写完后释放锁
        log.info("从缓存cacheId=" + cacheId + "中删除所有数据");
        if (ConfigUtil.redisSwitch) {
            write.lock();
            try {
                JedisUtil.removeAll(cacheId);
            } catch (Exception e) {
                log.error("redisCache clear异常【"+e.getMessage()+"】");
            } finally {
                write.unlock();
            }
        }
        
    }

    @Override
    public int getSize() {
     // TODO 从缓存中读数据数量，读锁锁定，不允许写
        log.info("从缓存cacheId=" + cacheId + "中获取其数据数量");
        if (ConfigUtil.redisSwitch) {
            //设置读锁
            read.lock();
            try {
                return JedisUtil.getSize(cacheId);
            } catch (Exception e) {
                log.error("redisCache getSize异常【"+e.getMessage()+"】");
            } finally {
                read.unlock();
            }
        }
        return -1;
    }
    
    @Override
    public ReadWriteLock getReadWriteLock() {
        return readWriteLock;
    }

}
