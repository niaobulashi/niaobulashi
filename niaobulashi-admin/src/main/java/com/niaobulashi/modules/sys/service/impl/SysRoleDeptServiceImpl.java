package com.niaobulashi.modules.sys.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.niaobulashi.modules.sys.dao.SysRoleDeptDao;
import com.niaobulashi.modules.sys.entity.SysRoleDeptEntity;
import com.niaobulashi.modules.sys.service.SysRoleDeptService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @program: niaobulashi
 * @description: 角色与部门对应关系
 * @author: hulang    hulang6666@qq.com
 * @create: 2019-06-13 21:19
 */
@Service("sysRoleDeptService")
public class SysRoleDeptServiceImpl extends ServiceImpl<SysRoleDeptDao, SysRoleDeptEntity> implements SysRoleDeptService {

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void saveOrUpdate(Long roleId, List<Long> deptIdList) {
		//先删除角色与部门关系
		deleteBatch(new Long[]{roleId});

		if(deptIdList.size() == 0){
			return ;
		}

		//保存角色与菜单关系
		for(Long deptId : deptIdList){
			SysRoleDeptEntity sysRoleDeptEntity = new SysRoleDeptEntity();
			sysRoleDeptEntity.setDeptId(deptId);
			sysRoleDeptEntity.setRoleId(roleId);

			this.save(sysRoleDeptEntity);
		}
	}

	@Override
	public List<Long> queryDeptIdList(Long[] roleIds) {
		return baseMapper.queryDeptIdList(roleIds);
	}

	@Override
	public int deleteBatch(Long[] roleIds){
		return baseMapper.deleteBatch(roleIds);
	}
}
