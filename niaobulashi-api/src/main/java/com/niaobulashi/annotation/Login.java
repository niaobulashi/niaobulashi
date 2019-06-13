package com.niaobulashi.annotation;

import java.lang.annotation.*;

/**
 * @program: niaobulashi
 * @description: 登录效验
 * @author: hulang
 * @create: 2019-06-12 19:38
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Login {
}
