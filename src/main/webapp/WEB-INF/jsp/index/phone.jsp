<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Husming
  Date: 2020/5/21
  Time: 22:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<head>
		<title>通讯录</title>

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
		
				<div>
					<div class="main">
						<div>
							<ul class="breadcrumb">
								<li><a href="#">道路养护管理系统</a></li>
							</ul>
							<hr />
						</div>
						
						<div>
							<table class="table table-condensed">
								<tr>
									<th>
										姓名
									</th>
									<th>
										联系方式
									</th>
									<th>
										职称
									</th>
								</tr>
								<c:forEach items="${users}" var="user">
									<tr>
										<td>${user.u_name}</td>
										<td>${user.u_phone}</td>
										<td>${user.u_class}</td>
									</tr>
								</c:forEach>
							</table>
						</div>
		
					</div>
					<jsp:include page="foot.jsp"></jsp:include>
				</div>
			</div>
		</div>

		<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
		 crossorigin="anonymous">
		</script>
	</body>
</html>
