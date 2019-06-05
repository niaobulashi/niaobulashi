**项目说明** 
- 采用SpringBoot、MyBatis、Shiro框架，开发的一套权限系统，极低门槛，拿来即用。设计之初，就非常注重安全性，为企业系统保驾护航，让一切都变得如此简单。
- 提供了代码生成器，只需编写30%左右代码，其余的代码交给系统自动生成，可快速完成开发任务
- 支持MySQL、Oracle、SQL Server、PostgreSQL等主流数据库
<br>


**项目结构** 
```
niaobulashi
├─niaobulashi-admin      管理后台
│    ├─db  数据库SQL脚本
│    │ 
│    ├─modules  模块
│    │    ├─job 定时任务
│    │    ├─oss 文件存储
│    │    └─sys 系统管理(核心)
│    │ 
│    └─resources 
│        ├─mapper   MyBatis文件
│        ├─statics  静态资源
│        ├─template 系统页面
│        │    ├─modules      模块页面
│        │    ├─index.html   AdminLTE主题风格（默认主题）
│        │    └─index1.html  Layui主题风格
│        └─application.yml   全局配置文件
├─niaobulashi-api        API服务
├─niaobulashi-common     公共模块
├─niaobulashi-dynamic-datasource     多数据源
├─niaobulashi-generator  代码生成器
│             └─resources 
│                   ├─mapper   MyBatis文件
│                   ├─template 代码生成器模板（可增加或修改相应模板）
│                   ├─application.yml    全局配置文件
│                   └─generator.properties   代码生成器，配置文件
│
```


开发中...