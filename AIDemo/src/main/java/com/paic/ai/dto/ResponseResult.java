package com.paic.ai.dto;

import java.util.Collection;

/**
 * 对返回结果进行封装
 * @author Administrator
 *
 * @param <T>
 */
public class ResponseResult<T> {

    public Collection<T> data;
    
    public String message;
    
    public boolean success;
    
    public int total = 0;

    public Collection<T> getData() {
        return data;
    }

    public void setData(Collection<T> data) {
        this.data = data;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
    
    public ResponseResult(){
        this.data = null;
        success = false;
    }
    
    public ResponseResult(Collection<T> data){
        this.data = data;
        success = true;
    }
    public ResponseResult(Collection<T> data,int total){
        this.data = data;
        success = true;
        this.total = total;
    }
    public ResponseResult(Collection<T> data,boolean success,String message){
        this.data = data;
        this.success = success;
        this.message = message;
    }
    public ResponseResult(Collection<T> data,String message,int total){
        this.data = data;
        this.total = total;
        this.message = message;
    }
    public ResponseResult(Collection<T> data,String message,int total,boolean success){
        this.data = data;
        this.total = total;
        this.message = message;
        this.success = success;
    }
    
    
}
