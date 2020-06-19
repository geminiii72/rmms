<%--
  Created by IntelliJ IDEA.
  User: Husming
  Date: 2020/5/27
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<head>
		<title>Title</title>
		<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
		 crossorigin="anonymous">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/util.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/table.css">
	</head>
	<body>

		<div>

			<jsp:include page="header.jsp"></jsp:include>

			<div class="container-fluid">
				<div class="row">
					<jsp:include page="nav.jsp"></jsp:include>

					<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2">
						<div class="main">
							<div>
								<ul class="breadcrumb">
									<li><a href="#">道路养护管理系统</a></li>
									<li><a href="#" class="active">设备流通历史记录</a></li>
								</ul>
								<hr />
							</div>

							<div>
								<div id="table-body">
									<table class="table table-striped table-bordered table-hover table-condensed">
										<caption>
											<lable>
												暂无数据
											</lable>
											<div class="pull-right">
												<button class="btn btn-default" id="btn-submit" onclick="deleteData()">确认</button>
												<button class="btn btn-default" id="btn-concel" onclick="deleteToggle()">取消</button>
												<button class="btn btn-default" onclick="deleteToggle()" id="btn-toggle">删除</button>
											</div>
										</caption>
										<thead>

										</thead>
										<tbody>

										</tbody>
									</table>
									<div id="page">
										<ul class="pagination">

										</ul>
									</div>
								</div>
							</div>

						</div>
						<jsp:include page="foot.jsp"></jsp:include>
					</div>

				</div>
			</div>
		</div>
		<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/static/js/util.js"></script>
		<script>
			var page_size = "10"; //一页数据数量
		</script>
		<script src="${pageContext.request.contextPath}/static/js/admin/toolRecord.js"></script>
		<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
		 crossorigin="anonymous">
		</script>

	</body>
</html>
