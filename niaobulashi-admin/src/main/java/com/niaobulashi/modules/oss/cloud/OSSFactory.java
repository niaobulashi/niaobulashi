package com.niaobulashi.modules.oss.cloud;

import com.niaobulashi.common.utils.ConfigConstant;
import com.niaobulashi.common.utils.Constant;
import com.niaobulashi.common.utils.SpringContextUtils;
import com.niaobulashi.modules.sys.service.SysConfigService;

/**
 * @program: niaobulashi
 * @description: 阿里云存储
 * @author: hulang    hulang6666@qq.com
 * @create: 2019-06-13 21:19
 */
public final class OSSFactory {
    private static SysConfigService sysConfigService;

    static {
        OSSFactory.sysConfigService = (SysConfigService) SpringContextUtils.getBean("sysConfigService");
    }

    public static CloudStorageService build(){
        //获取云存储配置信息
        CloudStorageConfig config = sysConfigService.getConfigObject(ConfigConstant.CLOUD_STORAGE_CONFIG_KEY, CloudStorageConfig.class);

        if(config.getType() == Constant.CloudService.QINIU.getValue()){
            return new QiniuCloudStorageService(config);
        }else if(config.getType() == Constant.CloudService.ALIYUN.getValue()){
            return new AliyunCloudStorageService(config);
        }else if(config.getType() == Constant.CloudService.QCLOUD.getValue()){
            return new QcloudCloudStorageService(config);
        }

        return null;
    }

}
