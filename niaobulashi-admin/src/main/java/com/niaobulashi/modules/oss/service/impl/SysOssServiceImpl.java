package com.niaobulashi.modules.oss.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.niaobulashi.common.utils.PageUtils;
import com.niaobulashi.common.utils.Query;
import com.niaobulashi.modules.oss.dao.SysOssDao;
import com.niaobulashi.modules.oss.entity.SysOssEntity;
import com.niaobulashi.modules.oss.service.SysOssService;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * @program: niaobulashi
 * @description: 阿里云存储
 * @author: hulang    hulang6666@qq.com
 * @create: 2019-06-13 21:19
 */
@Service("sysOssService")
public class SysOssServiceImpl extends ServiceImpl<SysOssDao, SysOssEntity> implements SysOssService {

	@Override
	public PageUtils queryPage(Map<String, Object> params) {
		IPage<SysOssEntity> page = this.page(
			new Query<SysOssEntity>().getPage(params)
		);

		return new PageUtils(page);
	}
	
}
