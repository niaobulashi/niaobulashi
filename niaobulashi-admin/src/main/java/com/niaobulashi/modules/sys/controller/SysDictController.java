package com.niaobulashi.modules.sys.controller;

import com.niaobulashi.common.utils.PageUtils;
import com.niaobulashi.common.utils.ResponseVo;
import com.niaobulashi.common.validator.ValidatorUtils;
import com.niaobulashi.modules.sys.entity.SysDictEntity;
import com.niaobulashi.modules.sys.service.SysDictService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;

/**
 * @program: niaobulashi
 * @description: 数据字典
 * @author: hulang    hulang6666@qq.com
 * @create: 2019-06-13 21:19
 */
@RestController
@RequestMapping("sys/dict")
public class SysDictController {
    @Autowired
    private SysDictService sysDictService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("sys:dict:list")
    public ResponseVo list(@RequestParam Map<String, Object> params){
        PageUtils page = sysDictService.queryPage(params);

        return ResponseVo.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("sys:dict:info")
    public ResponseVo info(@PathVariable("id") Long id){
        SysDictEntity dict = sysDictService.getById(id);

        return ResponseVo.ok().put("dict", dict);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("sys:dict:save")
    public ResponseVo save(@RequestBody SysDictEntity dict){
        //校验类型
        ValidatorUtils.validateEntity(dict);

        sysDictService.save(dict);

        return ResponseVo.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("sys:dict:update")
    public ResponseVo update(@RequestBody SysDictEntity dict){
        //校验类型
        ValidatorUtils.validateEntity(dict);

        sysDictService.updateById(dict);

        return ResponseVo.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("sys:dict:delete")
    public ResponseVo delete(@RequestBody Long[] ids){
        sysDictService.removeByIds(Arrays.asList(ids));

        return ResponseVo.ok();
    }

}
