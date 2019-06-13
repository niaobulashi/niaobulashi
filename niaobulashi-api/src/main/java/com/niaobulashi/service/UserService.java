package com.niaobulashi.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.niaobulashi.entity.UserEntity;
import com.niaobulashi.form.LoginForm;

import java.util.Map;

/**
 * @program: niaobulashi
 * @description: 用户
 * @author: hulang
 * @create: 2019-06-12 19:38
 */
public interface UserService extends IService<UserEntity> {

	UserEntity queryByMobile(String mobile);

	/**
	 * 用户登录
	 * @param form    登录表单
	 * @return        返回登录信息
	 */
	Map<String, Object> login(LoginForm form);
}
