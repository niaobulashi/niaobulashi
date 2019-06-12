package com.niaobulashi.modules.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.niaobulashi.common.utils.PageUtils;
import com.niaobulashi.modules.sys.entity.SysDictEntity;

import java.util.Map;

/**
 * @program: niaobulashi
 * @description: 数字字典
 * @author: hulang  hulang6666@qq.com
 * @create: 2019-06-12 20:20
 */
public interface SysDictService extends IService<SysDictEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

