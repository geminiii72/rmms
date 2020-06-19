<%--
  Created by IntelliJ IDEA.
  User: Husming
  Date: 2020/5/25
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加新用户</title>
	<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	 crossorigin="anonymous">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/util.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/detial.css">
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<div class="container-fluid">
		<div class="row">
			<jsp:include page="nav.jsp"></jsp:include>
			
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2">
				<div class="main">
					<div>
						<ul class="breadcrumb">
							<li><a href="#">道路养护管理系统</a></li>
							<li><a href="#" class="active">添加新用户</a></li>
						</ul>
						<hr />
					</div>
					
					<div class="article">
						<form method="post" action="/admin/addUser" onsubmit="return verify()" 
						class="form-horizontal detial-form" role="form">
									
						    <div class="form-group">
						        <label class="control-label col-xm-3 col-md-2" for="u_name">用户名：</label>
								<div class="col-md-10 col-xm-9">
									<input class="form-control" type="text" name="u_name" id="u_name" value="${user.u_name}"/>
								</div>	
						    </div>
						    <div class="form-group">
						        <label class="control-label col-xm-3 col-md-2" for="u_phone">联系电话：</label>
								<div class="col-md-10 col-xm-9">
									<input class="form-control" type="text" name="u_phone" id="u_phone" value="${user.u_phone}"/>
								</div>	
						    </div>
						    <div class="form-group">
						        <label class="control-label col-xm-3 col-md-2" for="u_class">职称：</label>
								<div class="col-md-10 col-xm-9">
									<input class="form-control" type="text" name="u_class" id="u_class" value="${user.u_class}"/>
								</div>	
						    </div>
						    <div class="form-group">
						        <label class="control-label col-xm-3 col-md-2" for="u_type">系统身份：</label>
								<div class="col-md-10 col-xm-9">
									<select class="form-control" name="u_type" id="u_type">
										<option value="管理员">管理员</option>
										<option value="维护人员">维护人员</option>
										<option value="资料人员">资料人员</option>
									</select>
								</div>
						    </div>
							<div class="col-md-offset-2">
								<button class="btn btn-default" type="reset">重置</button>
								<button class="btn btn-default" type="submit">提交</button>
								<small>默认密码:123456，请及时更改</small>
							</div>
									
						    
						    <div>
						        <span id="tip"></span>
						    </div>
						</form>
					</div>
					
					
				</div>
				<jsp:include page="foot.jsp"></jsp:include>
			</div>
		</div>
	</div>


<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/admin/addUser.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
 crossorigin="anonymous">
</script>

</body>
</html>
