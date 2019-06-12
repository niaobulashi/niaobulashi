package com.niaobulashi.common.utils;

/**
 * @program: niaobulashi
 * @description: Redis所有Keys
 * @author: hulang
 * @create: 2019-06-12 19:56
 */
public class RedisKeys {

    public static String getSysConfigKey(String key){
        return "sys:config:" + key;
    }

    public static String getShiroSessionKey(String key){
        return "sessionid:" + key;
    }
}
