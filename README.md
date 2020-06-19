## 道路养护管理系统

### 简介

该项目是为了提交道路养护工作效率及管理效率而开发的管理系统。由于本人对相关道路的管理或者养护工作并非非常了解，系统功能也仅做参考。同时由于时间的关系，本项目的功能只完成部分，以后有时间再补上。

### 相关技术

主要有

+ Spring + Spring MVC + Mybatis 的框架集
+ 数据库采用Mysql
+ 采用Spring Boot 和Maven 对项目进行管理
+ 前端部分比较混杂，部分采用JSP实现动态，另一部分采用AJAX +JQuery的方式
+ 前端页面直接使用了bootstrap3的前端框架，也是由于时间问题，部分动画还未实现

### 结尾

如果需要的使用的话，请使用IDEA打开，在`application.properties`文件内修改数据库的连接配置，文件在`rmms/src/main/resources/`下。修改完成后，运行java文件夹下的RmmsApplication.java，在浏览器中输入`localost:8080`即可。

