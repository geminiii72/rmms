<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Husming
  Date: 2020/5/20
  Time: 23:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<head>
		<title>主页</title>
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

						<div class="article">
							
							<div class="panel-group" id="accordion">
							    <div class="panel panel-primary">
							        <div class="panel-heading">
							            <h4 class="panel-title">
							                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
							                我负责的项目
							                </a>
							            </h4>
							        </div>
							        <div id="collapseOne" class="panel-collapse collapse in">
							            <div class="panel-body">
							                
											<div id="my_plan">
												<p id="my_plan_none">您还没有负责的项目</p>
											</div>
											
							            </div>
							        </div>
							    </div>
							</div>
							
							<div class="panel-group" id="accordion2">
								<div class="panel panel-primary">
								    <div class="panel-heading">
								        <h4 class="panel-title">
								            <a data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
								            我参与的项目
								            </a>
								        </h4>
								    </div>
								    <div id="collapseTwo" class="panel-collapse collapse in">
								        <div class="panel-body">
								            
											<div id="my_join">
												<p id="my_join_none">您还没有参与的项目</p>
											</div>
											
								        </div>
								    </div>
								</div>
							</div>

							<div>
								
								
							</div>

						</div>

					</div>
					<jsp:include page="foot.jsp"></jsp:include>
				</div>
			</div>
		</div>

		<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/static/js/index.js"></script>
		<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
		 crossorigin="anonymous">
		</script>

	</body>
</html>
