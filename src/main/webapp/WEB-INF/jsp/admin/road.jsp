<%--
  Created by IntelliJ IDEA.
  User: Husming
  Date: 2020/5/27
  Time: 13:29
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
							<li><a class="active">道路详细表</a></li>
						</ul>
						<hr />
					</div>
					
					<div class="article">
						<divc class="row">
							<div class="col-md-10 col-md-offset-1">
								<form  method="post" action="roadAlter" onsubmit="return verify()" role="form">
									<table class="table table-bordered">
										
										<tr class="row">
											<td class="col-md-2">
												<lable class="form-lable">ID：</lable>
											</td>
											<td class="col-md-4">
												<input class="form-control" type="text" name="r_id" disabled value="${road.r_id}"/>
											</td>
											<td class="col-md-2">
												<lable class="form-lable">道路名称：</lable>
											</td>
											<td class="col-md-4">
												<input class="form-control" type="text" name="r_name" value="${road.r_name}"/>
											</td>
										</tr>
										
										<tr class="row">
											<td class="col-md-2">
												<lable class="form-lable">添加时间：</lable>
											</td>
											<td class="col-md-4">
												<input class="form-control" type="text" name="r_date" value="${road.r_date}"/>
											</td>
											<td class="col-md-2">
												<lable class="form-lable">道路类型：</lable>
											</td>
											<td class="col-md-4">
												<input class="form-control" type="text" name="r_type" value="${road.r_type}"/>
											</td>
										</tr>
										
										<tr class="row">
											<td class="col-md-2">
												<lable class="form-lable">道路长度：</lable>
											</td>
											<td class="col-md-4">
												<input class="form-control" type="text" name="r_length" value="${road.r_length}"/>
											</td>
											<td class="col-md-2">
												<lable class="form-lable">道路宽度：</lable>
											</td>
											<td class="col-md-4">
												<input class="form-control" type="text" name="r_width" value="${road.r_width}"/>
											</td>
										</tr>
										
										<tr class="row">
											<td class="col-md-2">
												<lable class="form-lable">损坏类型：</lable>
											</td>
											<td class="col-md-4">
												<input class="form-control" type="text" name="r_m_type" value="${road.r_m_type}"/>
											</td>
											<td class="col-md-2">
												<lable class="form-lable">损坏密度：</lable>
											</td>
											<td class="col-md-4">
												<input class="form-control" type="text" name="r_m_density" value="${road.r_m_density}"/>
											</td>
										</tr>
										
										<tr class="row">
											<td class="col-md-2">
												<lable class="form-lable">损坏长度：</lable>
											</td>
											<td class="col-md-4">
												<input class="form-control" type="text" name="r_m_length" value="${road.r_m_length}"/>
											</td>
											<td class="col-md-2">
												<lable class="form-lable">损坏宽度：</lable>
											</td>
											<td class="col-md-4">
												<input class="form-control" type="text" name="r_m_width" value="${road.r_m_width}"/>
											</td>
										</tr>
										
										<tr class="row">
											<td class="col-md-2">
												<lable class="form-lable">当前状态：</lable>
											</td>
											<td class="col-md-4">
												<input class="form-control" type="text" name="r_state" value="${road.r_state}"/>
											</td>
											<td class="col-md-2">
												<lable class="form-lable">维护评级：</lable>
											</td>
											<td class="col-md-4">
												<input class="form-control" type="text" name="r_m_grade" value="${road.r_m_grade}"/>
											</td>
										</tr>
										
										<tr class="row">
											<td class="col-md-2">
												<lable class="form-lable">备注：</lable>
											</td>
											<td class="col-md-6" colspan="3">
												<textarea class="form-control" type="text" name="r_note" value="${road.r_note}"></textarea>
											</td>
										</tr>
									</table>
									<div>
										<button class="btn btn-default" type="submit">修改</button>
										<a class="btn btn-default" href="/admin/totable?table_type=road">返回</a>
										<div>
										    <span id="tip"></span>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					
				</div>
				<jsp:include page="foot.jsp"></jsp:include>
			</div>
		</div>
	</div>
	

<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

</script>
<script src="${pageContext.request.contextPath}/static/js/admin/road.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
 crossorigin="anonymous">
</script>

</body>
</html>
