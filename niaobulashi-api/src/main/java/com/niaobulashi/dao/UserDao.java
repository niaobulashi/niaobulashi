package com.niaobulashi.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.niaobulashi.entity.UserEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * @program: niaobulashi
 * @description: 用户
 * @author: hulang
 * @create: 2019-06-12 19:38
 */
@Mapper
public interface UserDao extends BaseMapper<UserEntity> {

}
