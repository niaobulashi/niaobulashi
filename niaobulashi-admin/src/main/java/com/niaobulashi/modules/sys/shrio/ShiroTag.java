package com.niaobulashi.modules.sys.shrio;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Component;

/**
 * @program: niaobulashi
 * @description: Shiro权限标签
 * @author: hulang
 * @create: 2019-06-10 10:32
 */
@Component
public class ShiroTag {

    /**
     * 是否拥有该权限
     * @param premission 权限标志
     * @return  true:是  false:否
     */
    public boolean hasPermission(String premission) {
        Subject subject = SecurityUtils.getSubject();
        return subject != null && subject.isPermitted(premission);
    }
}

