package com.niaobulashi.common.xss;

import com.niaobulashi.common.exception.RRException;
import org.apache.commons.lang.StringUtils;

/**
 * @program: niaobulashi
 * @description: SQL过滤
 * @author: hulang
 * @create: 2019-06-12 20:03
 */
public class SQLFilter {

    /**
     * SQL注入过滤
     * @param str   待验证的字符串
     * @return
     */
    public static String sqlInject(String str) {
        if (StringUtils.isBlank(str)) {
            return null;
        }
        // 去掉'|";\/字符
        str = StringUtils.replace(str, "'", "");
        str = StringUtils.replace(str, "\"", "");
        str = StringUtils.replace(str, ";", "");
        str = StringUtils.replace(str, "\\", "");

        // 转换为小写
        str = str.toLowerCase();

        // 非法字符
        String[] keywords = {"master", "truncate", "insert", "delete", "update", "select", "drop", "declare", "alter"};

        // 判断是否包含非法字符
        for (String keyword : keywords) {
            if (str.indexOf(keyword) != -1) {
                throw new RRException("包含非法字符");
            }
        }
        return str;
    }
}

