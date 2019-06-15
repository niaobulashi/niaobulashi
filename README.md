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
│        │    └─index1.html  主题风格
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

**技术选型**

- 核心框架：Spring Boot 2.1
- 安全框架：Apache Shiro 1.4
- 视图框架：Spring MVC 5.0
- 持久层框架：MyBatis 3.5
- 定时器：Quartz 2.3
- 数据库连接池：Druid 1.1
- 日志管理：SLF4J 1.7、Log4j
- 页面交互：Vue2.x

**软件需求**

- JDK12
- MySQL5.5+
- Maven3.0+


**Linux部署**

- 打包成jar，在主项目niaobulashi上进行打包，mvn clean install
- 会生成相应项目的jar包，放在Linux目标目录下，执行java -jar 包名


**运行可能会遇到的问题**
- 启动可能报错，mysql严格区分大小写，可能找不到表，解决方案：[mysql不区分大小写](https://www.cnblogs.com/jr1260/p/6529235.html)
- 没有/tmp/spring.log目录权限，解决方案：在root用户下，添加写权限sudo chmod 777 spring.log
- 登陆页面的验证码显示乱码，原因：linux没有安装字体，解决方案：[linux安装字体](https://blog.csdn.net/wangxintong_1992/article/details/81194896)


