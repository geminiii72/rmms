<%--
  Created by IntelliJ IDEA.
  User: Husming
  Date: 2020/5/19
  Time: 18:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Index</title>
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
						</ul>
						<hr />
					</div>
					
					<div class="article" style="height: 300px;"></div>
					
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
