package com.niaobulashi.modules.sys.controller;

import com.niaobulashi.modules.sys.entity.SysUserEntity;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @program: niaobulashi
 * @description: Controller公共组件
 * @author: hulang    hulang6666@qq.com
 * @create: 2019-06-12 21:19
 */
public abstract class AbstractController {

    protected Logger logger = LoggerFactory.getLogger(AbstractController.class);

    protected SysUserEntity getUser() {
        return (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
    }

    protected Long getUserId() {
        return getUser().getUserId();
    }

    protected Long getDeptId() {
        return getUser().getDeptId();
    }
}
