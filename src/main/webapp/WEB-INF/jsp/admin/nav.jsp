<%--
  Created by IntelliJ IDEA.
  User: Husming
  Date: 2020/5/24
  Time: 11:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="col-sm-3 col-md-2 sidebar">
	<div class="panel-group" id="panel-nav">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<a class="panel-title" href="#">首页</a>
			</div>
		</div>
		<div class="panel panel-primary">
			<div class="panel-heading">
				<a class="panel-title" data-toggle="collapse" data-parent="panel-nav" href="#collapseOne">
					系统用户信息<span class="caret"></span>
				</a>
			</div>
			<div id="collapseOne" class="panel-collapse collapse">
				<div class="panel-body">
					<ul class="nav nav-pills nav-stacked">
						<li><a href="/admin/totable?table_type=user">用户列表</a></li>
						<li><a href="/admin/toAddUser">添加用户</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="panel panel-primary">
			<div class="panel-heading">
				<a class="panel-title" data-toggle="collapse" data-parent="panel-nav" href="#collapseTwo">
					施工项目<span class="caret"></span>
				</a>
			</div>
			<div id="collapseTwo" class="panel-collapse collapse">
				<div class="panel-body">
					<ul class="nav nav-pills nav-stacked">
						<li><a href="/admin/totable?table_type=plan">项目列表</a></li>
						<li><a href="/admin/toNewPlan">发布新项目</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="panel panel-primary">
			<div class="panel-heading">
				<a class="panel-title" data-toggle="collapse" data-parent="panel-nav" href="#collapseThree">
					设备器材<span class="caret"></span>
				</a>
			</div>
			<div id="collapseThree" class="panel-collapse collapse">
				<div class="panel-body">
					<ul class="nav nav-pills nav-stacked">
						<li><a href="/admin/totable?table_type=tool">设备剩余表</a></li>
						<li><a href="/admin/toToolRecord">历史记录表</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="panel panel-primary">
			<div class="panel-heading">
				<a class="panel-title" href="/admin/totable?table_type=road">
					道路信息
				</a>
			</div>
		</div>
	</div>
  
</div>