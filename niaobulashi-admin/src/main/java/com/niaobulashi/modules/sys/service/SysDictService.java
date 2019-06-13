package com.niaobulashi.modules.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.niaobulashi.common.utils.PageUtils;
import com.niaobulashi.modules.sys.entity.SysDictEntity;

import java.util.Map;

/**
 * @program: niaobulashi
 * @description: 系统配置信息
 * @author: hulang    hulang6666@qq.com
 * @create: 2019-06-13 21:19
 */
public interface SysDictService extends IService<SysDictEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

