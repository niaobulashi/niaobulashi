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
public @interface DataFilter {

    // 表的别名
    String tableAlias() default "";

    // true:没有本部门数据权限，也能查询本人数据
    boolean user() default true;

    // true:拥有子部门数据权限
    boolean subDept() default true;

    // 部门ID
    String deptId() default "dept_id";

    // 用户ID
    String userId() default "user_id";
}

