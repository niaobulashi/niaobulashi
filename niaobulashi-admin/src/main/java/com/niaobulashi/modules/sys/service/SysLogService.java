
package com.niaobulashi.modules.sys.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.niaobulashi.common.utils.PageUtils;
import com.niaobulashi.modules.sys.entity.SysLogEntity;

import java.util.Map;


/**
 * @program: niaobulashi
 * @description: 系统日志
 * @author: hulang  hulang6666@qq.com
 * @create: 2019-06-12 20:20
 */
public interface SysLogService extends IService<SysLogEntity> {

    PageUtils queryPage(Map<String, Object> params);

}
