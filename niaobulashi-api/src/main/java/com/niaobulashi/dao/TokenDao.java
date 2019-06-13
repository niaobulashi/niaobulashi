package com.niaobulashi.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.niaobulashi.entity.TokenEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 用户Token
 *
 * @author Mark sunlightcs@gmail.com
 */
@Mapper
public interface TokenDao extends BaseMapper<TokenEntity> {
	
}
