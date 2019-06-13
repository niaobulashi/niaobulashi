package com.niaobulashi.modules.oss.controller;

import com.google.gson.Gson;
import com.niaobulashi.common.exception.RRException;
import com.niaobulashi.common.utils.ConfigConstant;
import com.niaobulashi.common.utils.Constant;
import com.niaobulashi.common.utils.PageUtils;
import com.niaobulashi.common.utils.ResponseVo;
import com.niaobulashi.common.validator.ValidatorUtils;
import com.niaobulashi.common.validator.group.AliyunGroup;
import com.niaobulashi.common.validator.group.QcloudGroup;
import com.niaobulashi.common.validator.group.QiniuGroup;
import com.niaobulashi.modules.oss.cloud.CloudStorageConfig;
import com.niaobulashi.modules.oss.cloud.OSSFactory;
import com.niaobulashi.modules.oss.entity.SysOssEntity;
import com.niaobulashi.modules.oss.service.SysOssService;
import com.niaobulashi.modules.sys.service.SysConfigService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.Arrays;
import java.util.Date;
import java.util.Map;

/**
 * @program: niaobulashi
 * @description: 阿里云存储
 * @author: hulang    hulang6666@qq.com
 * @create: 2019-06-13 21:19
 */
@RestController
@RequestMapping("sys/oss")
public class SysOssController {
	@Autowired
	private SysOssService sysOssService;
    @Autowired
    private SysConfigService sysConfigService;

    private final static String KEY = ConfigConstant.CLOUD_STORAGE_CONFIG_KEY;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("sys:oss:all")
	public ResponseVo list(@RequestParam Map<String, Object> params){
		PageUtils page = sysOssService.queryPage(params);

		return ResponseVo.ok().put("page", page);
	}


    /**
     * 云存储配置信息
     */
    @RequestMapping("/config")
    @RequiresPermissions("sys:oss:all")
    public ResponseVo config(){
        CloudStorageConfig config = sysConfigService.getConfigObject(KEY, CloudStorageConfig.class);

        return ResponseVo.ok().put("config", config);
    }


	/**
	 * 保存云存储配置信息
	 */
	@RequestMapping("/saveConfig")
	@RequiresPermissions("sys:oss:all")
	public ResponseVo saveConfig(@RequestBody CloudStorageConfig config){
		//校验类型
		ValidatorUtils.validateEntity(config);

		if(config.getType() == Constant.CloudService.QINIU.getValue()){
			//校验七牛数据
			ValidatorUtils.validateEntity(config, QiniuGroup.class);
		}else if(config.getType() == Constant.CloudService.ALIYUN.getValue()){
			//校验阿里云数据
			ValidatorUtils.validateEntity(config, AliyunGroup.class);
		}else if(config.getType() == Constant.CloudService.QCLOUD.getValue()){
			//校验腾讯云数据
			ValidatorUtils.validateEntity(config, QcloudGroup.class);
		}

        sysConfigService.updateValueByKey(KEY, new Gson().toJson(config));

		return ResponseVo.ok();
	}
	

	/**
	 * 上传文件
	 */
	@RequestMapping("/upload")
	@RequiresPermissions("sys:oss:all")
	public ResponseVo upload(@RequestParam("file") MultipartFile file) throws Exception {
		if (file.isEmpty()) {
			throw new RRException("上传文件不能为空");
		}

		//上传文件
		String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		String url = OSSFactory.build().uploadSuffix(file.getBytes(), suffix);

		//保存文件信息
		SysOssEntity ossEntity = new SysOssEntity();
		ossEntity.setUrl(url);
		ossEntity.setCreateDate(new Date());
		sysOssService.save(ossEntity);

		return ResponseVo.ok().put("url", url);
	}


	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("sys:oss:all")
	public ResponseVo delete(@RequestBody Long[] ids){
		sysOssService.removeByIds(Arrays.asList(ids));

		return ResponseVo.ok();
	}

}
