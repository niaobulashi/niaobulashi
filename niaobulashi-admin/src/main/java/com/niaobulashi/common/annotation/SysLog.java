package com.niaobulashi.common.annotation;

import java.lang.annotation.*;

/**
 * @program: niaobulashi
 * @description: 数据过滤
 * @author: hulang
 * @create: 2019-06-12 19:38
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface SysLog {
    String value() default "";
}
