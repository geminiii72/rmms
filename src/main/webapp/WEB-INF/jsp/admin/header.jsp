<%--
  Created by IntelliJ IDEA.
  User: Husming
  Date: 2020/5/24
  Time: 11:41
  管理员界面头部
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
	<div class="navbar-header">
	  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
		<span class="sr-only">切换导航</span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
	  </button>
	  <a class="navbar-brand" href="#">道路养护管理系统</a>
	</div>
	<div id="navbar" class="navbar-collapse collapse">
	  <ul class="nav navbar-nav navbar-right">
		<li><a href="#">${user_name} 欢迎</a></li>
		<li class="dropdown">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown">
				<span class="glyphicon glyphicon-user"></span>
				<span class="caret"></span>
			</a>
			<ul class="dropdown-menu">
				<li><a href="/admin/person">个人信息</a></li>
				<li class="divder"></li>
				<li><a href="/user/login.out">注销</a></li>
			</ul>
		</li>
	  </ul>
	</div>
  </div>
</nav>
