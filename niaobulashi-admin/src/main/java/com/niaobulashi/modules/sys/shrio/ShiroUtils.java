package com.niaobulashi.modules.sys.shrio;


import com.niaobulashi.common.exception.RRException;
import com.niaobulashi.modules.sys.entity.SysUserEntity;
import org.apache.catalina.security.SecurityUtil;
import org.apache.commons.lang.SystemUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

/**
 * @program: niaobulashi
 * @description: shiro工具类
 * @author: hulang
 * @create: 2019-06-06 15:24
 */
public class ShiroUtils {

    // 加密算法名称
    public final static String hashAlgorithmName = "SHA-256";

    // 循环次数
    public final static int hashIterations = 16;

    // 加密算法
    public static String sha256(String password, String salt) {
        return new SimpleHash(hashAlgorithmName, password, salt, hashIterations).toString();
    }

    // 获取session
    public static Session getSession() {
        return SecurityUtils.getSubject().getSession();
    }

    // 获取对象
    public static Subject getSubject() {
        return SecurityUtils.getSubject();
    }

    // 获取用户Entity
    public static SysUserEntity getUserEntity() {
        return (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
    }

    // 获取用户Id
    public static Long getUserId() {
        return getUserEntity().getUserId();
    }

    // 存放key-value到session中
    public static void setSessionAttribute(Object key, Object value) {
        getSession().setAttribute(key, value);
    }

    // 获取session中的值
    public static Object getSessionAttribute(Object key) {
        return getSession().getAttribute(key);
    }

    // 判断是否登录
    public static boolean isLogin() {
        return SecurityUtils.getSubject().getPrincipal() != null;
    }

    // 登出
    public static void logout() {
        SecurityUtils.getSubject().logout();
    }

    // 获取验证码
    public static String getKaptcha(String key) {
        Object keptcha = getSessionAttribute(key);
        if (keptcha == null) {
            throw new RRException("验证码已经失效");
        }
        getSession().removeAttribute(key);
        return keptcha.toString();
    }
}

