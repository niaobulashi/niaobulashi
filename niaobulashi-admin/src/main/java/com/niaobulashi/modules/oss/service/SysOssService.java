package com.niaobulashi.modules.oss.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.niaobulashi.common.utils.PageUtils;
import com.niaobulashi.modules.oss.entity.SysOssEntity;

import java.util.Map;

/**
 * @program: niaobulashi
 * @description: 阿里云存储
 * @author: hulang    hulang6666@qq.com
 * @create: 2019-06-13 21:19
 */
public interface SysOssService extends IService<SysOssEntity> {

	PageUtils queryPage(Map<String, Object> params);
}
