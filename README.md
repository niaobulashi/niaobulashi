# 请各位小伙伴转移至项目【ruoyi】

https://github.com/niaobulashi/ruoyi


![](https://niaobulashi.com/usr/uploads/sina/5d1c5145a776b.jpg)

github项目地址：https://github.com/niaobulashi/niaobulashi

## **在线演示**
 - 在线地址：[http://manage.niaobulashi.com][1]
 - 登录名和密码：niaobulashi/niaobulashi
 
PS:在线功能肯定不全的，建议大家clone到本地运行哦~
本地登录名和密码：admin/admin

欢迎大家star，fork，一起探讨学习

## **项目说明**

 - 采用SpringBoot、MyBatis、Shiro框架，开发的一套权限系统，极低门槛，拿来即用。设计之初，就非常注重安全性，为企业系统保驾护航，让一切都变得如此简单。
 - 提供了代码生成器，只需编写30%左右代码，其余的代码交给系统自动生成，可快速完成开发任务
 - 支持MySQL、Oracle、SQL Server、PostgreSQL等主流数据库

## **项目结构**

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
## **项目模块**

 - niaobulashi-common为公共模块，其他模块以jar包的形式引入进去，主要提供些工具类，以及renren-admin、renren-api模块公共的entity、mapper、dao、service服务，防止一个功能重复多次编写代码。
 - niaobulashi-admin为后台模块，也是系统的核心，用来开发后台管理系统，可以打包成jar，部署到服务器上运行，或者打包成war，放到Tomcat8.5+容器里运行。
 - niaobulashi-api为接口模块，主要是简化APP开发，如：为微信小程序、IOS、Android提供接口，拥有一套单独的用户体系，没有与renren-admin用户表共用，因为renren-admin用户表里存放的是企业内部人员账号，具有后台管理员权限，可以登录后台管理系统，而renren-api用户表里存放的是我们的真实用户，不具备登录后台管理系统的权限。renren-api主要是实现了用户注册、登录、接口权限认证、获取登录用户等功能，为APP接口的安全调用，提供一套优雅的解决方案，从而简化APP接口开发。
 - niaobulashi-generator为代码生成器模块，只需在MySQL数据库里，创建好表结构，就可以生成新增、修改、删除、查询、导出等操作的代码，包括entity、mapper、dao、service、controller、页面等所有代码，项目开发神器。可以作为单独的项目运行，我已经将这部分的模块移植到了niaobulashi-admin
 
## **技术选型**

核心框架：Spring Boot 2.1
安全框架：Apache Shiro 1.4
视图框架：Spring MVC 5.0
持久层框架：MyBatis 3.5
定时器：Quartz 2.3
数据库连接池：Druid 1.1
日志管理：SLF4J 1.7、Log4j
页面交互：Vue2.x

## **软件需求**

 - JDK12
 - MySQL5.5+
 - Maven3.0+

## **本地部署**

 - idea通过：https://github.com/niaobulashi/niaobulashi  进行clone到本地
 - 在项目目录：resources/db找到数据库文件，部署到本地
 - 修改配置文件application-test.yml，数据库改为本地的用户名和密码
 - 直接启动，访问：localhost:8080
 - 登录名和密码：admin/admin

## **Linux部署**

 - 打包成jar，在主项目niaobulashi上进行打包，mvn clean install
 - 会生成相应项目的jar包，放在Linux目标目录下，执行java -jar 包名

## **运行可能会遇到的问题**

 - 启动可能报错，mysql严格区分大小写，可能找不到表，解决方案：[mysql不区分大小写][2]
 - 没有/tmp/spring.log目录权限，解决方案：在root用户下，添加写权限sudo chmod 777 spring.log
 - 登陆页面的验证码显示乱码，原因：linux没有安装字体，解决方案：[linux安装字体][3]

## **根据项目信息截图**

控制台首页

![微信截图_20190704162850.png][4]

菜单管理页

![微信截图_20190704162905.png][5]
 
定时任务管理页

![微信截图_20190704162916.png][6]


ps：日报管理模块没有实际功能，知识个菜单而已，后期进行维护

本项目可能会存在一些BUG，emmmm，不要紧，小问题

欢迎star，fork一起学习。


  [1]: http://manage.niaobulashi.com
  [2]: https://www.cnblogs.com/skyessay/p/9082148.html
  [3]: https://blog.csdn.net/wangxintong_1992/article/details/81194896
  [4]: https://niaobulashi.com/usr/uploads/2019/07/2567961641.png
  [5]: https://niaobulashi.com/usr/uploads/2019/07/2782882639.png
  [6]: https://niaobulashi.com/usr/uploads/2019/07/2450900543.png