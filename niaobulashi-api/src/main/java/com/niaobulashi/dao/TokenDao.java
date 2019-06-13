package com.niaobulashi.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.niaobulashi.entity.TokenEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * @program: niaobulashi
 * @description: 用户Token
 * @author: hulang
 * @create: 2019-06-12 19:38
 */
@Mapper
public interface TokenDao extends BaseMapper<TokenEntity> {
	
}
