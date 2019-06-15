package com.niaobulashi;

import org.apache.commons.configuration.ConfigurationException;
import org.apache.commons.configuration.PropertiesConfiguration;
import org.apache.commons.configuration.reloading.FileChangedReloadingStrategy;

/**
 * @program: niaobulashi
 * @description: 测试类
 * @author: hulang    hulang6666@qq.com
 * @create: 2019-06-15 17:48
 */
public class test {
    public static final String fileName = "generator.properties";

    public static PropertiesConfiguration cfg = null;

    static {
        try {
            cfg = new PropertiesConfiguration(fileName);
            System.out.printf(cfg.getHeader());
        } catch (ConfigurationException e) {
            e.printStackTrace();
        }
        // 当文件的内容发生改变时，配置对象也会刷新
        cfg.setReloadingStrategy(new FileChangedReloadingStrategy());
    }
    // 读String
    public static String getStringValue(String key) {
        return cfg.getString(key);
    }

    public static void main(String[] args) {
        String mainPath = test.getStringValue("mainPath");
        System.out.println("mainPath:" + mainPath);
    }
}
