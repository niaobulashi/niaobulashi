package com.niaobulashi.common.validator;

import com.niaobulashi.common.exception.RRException;
import org.apache.commons.lang.StringUtils;

/**
 * @program: 数据校验
 * @description: Spring Context 工具类
 * @author: hulang
 * @create: 2019-06-13 15:24
 */
public abstract class Assert {

    public static void isBlank(String str, String message) {
        if (StringUtils.isBlank(str)) {
            throw new RRException(message);
        }
    }

    public static void isNull(Object object, String message) {
        if (object == null) {
            throw new RRException(message);
        }
    }
}
