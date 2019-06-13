package com.niaobulashi.modules.sys.controller;

import com.niaobulashi.common.utils.Constant;
import com.niaobulashi.common.utils.ResponseVo;
import com.niaobulashi.modules.sys.entity.SysDeptEntity;
import com.niaobulashi.modules.sys.service.SysDeptService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;

/**
 * @program: niaobulashi
 * @description: 部门管理
 * @author: hulang    hulang6666@qq.com
 * @create: 2019-06-13 21:19
 */
@RestController
@RequestMapping("/sys/dept")
public class SysDeptController extends AbstractController {
	@Autowired
	private SysDeptService sysDeptService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("sys:dept:list")
	public List<SysDeptEntity> list(){
		List<SysDeptEntity> deptList = sysDeptService.queryList(new HashMap<String, Object>());

		return deptList;
	}

	/**
	 * 选择部门(添加、修改菜单)
	 */
	@RequestMapping("/select")
	@RequiresPermissions("sys:dept:select")
	public ResponseVo select(){
		List<SysDeptEntity> deptList = sysDeptService.queryList(new HashMap<String, Object>());

		//添加一级部门
		if(getUserId() == Constant.SUPER_ADMIN){
			SysDeptEntity root = new SysDeptEntity();
			root.setDeptId(0L);
			root.setName("一级部门");
			root.setParentId(-1L);
			root.setOpen(true);
			deptList.add(root);
		}

		return ResponseVo.ok().put("deptList", deptList);
	}

	/**
	 * 上级部门Id(管理员则为0)
	 */
	@RequestMapping("/info")
	@RequiresPermissions("sys:dept:list")
	public ResponseVo info(){
		long deptId = 0;
		if(getUserId() != Constant.SUPER_ADMIN){
			List<SysDeptEntity> deptList = sysDeptService.queryList(new HashMap<String, Object>());
			Long parentId = null;
			for(SysDeptEntity sysDeptEntity : deptList){
				if(parentId == null){
					parentId = sysDeptEntity.getParentId();
					continue;
				}

				if(parentId > sysDeptEntity.getParentId().longValue()){
					parentId = sysDeptEntity.getParentId();
				}
			}
			deptId = parentId;
		}

		return ResponseVo.ok().put("deptId", deptId);
	}
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{deptId}")
	@RequiresPermissions("sys:dept:info")
	public ResponseVo info(@PathVariable("deptId") Long deptId){
		SysDeptEntity dept = sysDeptService.getById(deptId);
		
		return ResponseVo.ok().put("dept", dept);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("sys:dept:save")
	public ResponseVo save(@RequestBody SysDeptEntity dept){
		sysDeptService.save(dept);
		
		return ResponseVo.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("sys:dept:update")
	public ResponseVo update(@RequestBody SysDeptEntity dept){
		sysDeptService.updateById(dept);
		
		return ResponseVo.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("sys:dept:delete")
	public ResponseVo delete(long deptId){
		//判断是否有子部门
		List<Long> deptList = sysDeptService.queryDetpIdList(deptId);
		if(deptList.size() > 0){
			return ResponseVo.error("请先删除子部门");
		}

		sysDeptService.removeById(deptId);
		
		return ResponseVo.ok();
	}
	
}
