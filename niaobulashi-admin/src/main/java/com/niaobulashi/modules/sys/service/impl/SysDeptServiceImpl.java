package com.niaobulashi.modules.sys.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.niaobulashi.common.annotation.DataFilter;
import com.niaobulashi.common.utils.Constant;
import com.niaobulashi.modules.sys.dao.SysDeptDao;
import com.niaobulashi.modules.sys.entity.SysDeptEntity;
import com.niaobulashi.modules.sys.service.SysDeptService;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @program: niaobulashi
 * @description: 部门管理
 * @author: hulang  hulang6666@qq.com
 * @create: 2019-06-12 20:21
 */
@Service("sysDeptServiceImpl")
public class SysDeptServiceImpl extends ServiceImpl<SysDeptDao, SysDeptEntity> implements SysDeptService {

    @Override
    @DataFilter(subDept = true, user = false, tableAlias = "t1")
    public List<SysDeptEntity> queryList(Map<String, Object> params) {
        return baseMapper.queryList(params);
    }
    /**
     * 查询子部门ID列表
     */
    @Override
    public List<Long> queryDetpIdList(Long deptId) {
        return baseMapper.queryDeptIdList(deptId, Constant.CODE_DELETE_NO);
    }

    /**
     * 获取子部门ID，用于数据过滤
     */
    @Override
    public List<Long> getSubDeptIdList(Long deptId) {
        List<Long> deptIdList = new ArrayList<>();

        // 获取子部门ID
        List<Long> subIdList = queryDetpIdList(deptId);
        getDeptTreeList(subIdList, deptIdList);
        return deptIdList;
    }

    /**
     * 递归
     */
    private void getDeptTreeList(List<Long> subIdList, List<Long> deptIdList) {
        for (Long deptId : subIdList) {
            List<Long> list = queryDetpIdList(deptId);
            if (list.size() > 0) {
                getDeptTreeList(list, deptIdList);
            }
            deptIdList.add(deptId);
        }
    }
}

