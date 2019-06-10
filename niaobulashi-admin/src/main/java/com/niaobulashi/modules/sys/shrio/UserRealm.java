package com.niaobulashi.modules.sys.shrio;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.niaobulashi.common.utils.Constant;
import com.niaobulashi.modules.sys.dao.SysMenuDao;
import com.niaobulashi.modules.sys.dao.SysUserDao;
import com.niaobulashi.modules.sys.entity.SysMenuEntity;
import com.niaobulashi.modules.sys.entity.SysUserEntity;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authc.credential.CredentialsMatcher;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.*;

/**
 * @program: niaobulashi
 * @description: 用户认证
 * @author: hulang
 * @create: 2019-06-10 10:53
 */
@Component
public class UserRealm extends AuthorizingRealm {

    @Resource
    private SysUserDao sysUserDao;

    @Resource
    private SysMenuDao sysMenuDao;

    /**
     * 授权(验证权限时调用)
     * @param principals
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        SysUserEntity user = (SysUserEntity)principals.getPrimaryPrincipal();
        // 获取用户ID
        Long userId = user.getUserId();
        List<String> permsList;
        // 系统管理员拥有最高权限
        if (userId.equals(Constant.SUPER_ADMIN)) {
            List<SysMenuEntity> menuList = sysMenuDao.selectList(null);
            permsList = new ArrayList<>(menuList.size());
            for (SysMenuEntity menu : menuList) {
                permsList.add(menu.getPerms());
            }
        } else {
            permsList = sysUserDao.queryAllPerms(userId, Constant.CODE_DELETE_NO);
        }

        // 用户权限列表
        Set<String> permsSet = new HashSet<>();
        for (String perms : permsList) {
            if (StringUtils.isBlank(perms)) {
                continue;
            }
            permsSet.addAll(Arrays.asList(perms.trim().split(",")));
        }

        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.setStringPermissions(permsSet);
        return info;
    }

    /**
     * 认证(登录时调用)
     * @param authenticationToken
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;

        // 查询用户信息
        SysUserEntity user = sysUserDao.selectOne(new QueryWrapper<SysUserEntity>().eq("username", token.getUsername()));

        // 账号不存在
        if (user == null) {
            throw new UnknownAccountException("账号密码不正确");
        }

        // 账号锁定
        if (user.getStatus() == Constant.CODE_USER_STATUS_LOCK) {
            throw new LockedAccountException("账号已被锁定，请联系管理员");
        }

        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user, user.getPassword(), ByteSource.Util.bytes(user.getSalt()), getName());

        return info;
    }

    public void setCredentialMatcher(CredentialsMatcher credentialMatcher) {
        HashedCredentialsMatcher shaCredentialsMatcher = new HashedCredentialsMatcher();
        shaCredentialsMatcher.setHashAlgorithmName(ShiroUtils.hashAlgorithmName);
        shaCredentialsMatcher.setHashIterations(ShiroUtils.hashIterations);
        super.setCredentialsMatcher(shaCredentialsMatcher);
    }
}

