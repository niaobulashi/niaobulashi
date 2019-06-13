package com.niaobulashi.commons.dynamic.datasource.annotation;

import java.lang.annotation.*;

/**
 * @program: niaobulashi
 * @description: 多数据源注解
 * @author: hulang
 * @create: 2019-06-12 19:38
 */
@Target({ElementType.METHOD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Inherited
public @interface DataSource {
    String value() default "";
}
