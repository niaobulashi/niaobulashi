package com.niaobulashi.modules.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.niaobulashi.common.utils.PageUtils;
import com.niaobulashi.common.utils.Query;
import com.niaobulashi.modules.sys.dao.SysLogDao;
import com.niaobulashi.modules.sys.entity.SysLogEntity;
import com.niaobulashi.modules.sys.service.SysLogService;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * @program: niaobulashi
 * @description: 系统日志
 * @author: hulang    hulang6666@qq.com
 * @create: 2019-06-13 21:19
 */
@Service("sysLogService")
public class SysLogServiceImpl extends ServiceImpl<SysLogDao, SysLogEntity> implements SysLogService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String key = (String)params.get("key");

        IPage<SysLogEntity> page = this.page(
            new Query<SysLogEntity>().getPage(params),
            new QueryWrapper<SysLogEntity>().like(StringUtils.isNotBlank(key),"username", key)
        );

        return new PageUtils(page);
    }
}
