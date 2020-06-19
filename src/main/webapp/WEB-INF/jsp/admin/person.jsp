<%--
  Created by IntelliJ IDEA.
  User: Husming
  Date: 2020/5/24
  Time: 13:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<head>
		<title>个人信息</title>
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
								<li><a href="#" class="active">个人信息</a></li>
							</ul>
							<hr />
						</div>

						<div class="article">
							<form id="formPerson" class="form-horizontal detial-form" role="form">
								<div class="form-group">
									<label for="u_id" class="control-label col-xm-3 col-md-2">ID</label>
									<div class="col-md-10 col-xm-9">
										<input class="form-control" type="text" name="u_id" id="u_id" disabled value="${user.u_id}" required>
									</div>
								</div>
								<div class="form-group">
									<label for="u_id" class="control-label col-xm-3 col-md-2">姓名</label>
									<div class="col-md-10 col-xm-9">
										<input class="form-control" type="text" name="u_name" id="u_name" disabled value="${user.u_name}" required>
									</div>
								</div>
								<div class="form-group">
									<label for="u_id" class="control-label col-xm-3 col-md-2">联系电话</label>
									<div class="col-md-10 col-xm-9">
										<input ty class="form-control" pe="text" name="u_phone" id="u_phone" disabled value="${user.u_phone}"
										 required>
									</div>
								</div>
								<div class="form-group">
									<label for="u_id" class="control-label col-xm-3 col-md-2">职称</label>
									<div class="col-md-10 col-xm-9">
										<input class="form-control" type="text" name="u_class" id="u_class" disabled value="${user.u_type}" required>
									</div>
								</div>
								<div id="div-btn-detial">
									<button class="btn btn-default" type="button" data-toggle="modal" data-target="#div-pwd" id="btn-show-pwd">修改密码</button>
									<button class="btn btn-default" type="button" id="btn-show-submit">修改资料</button>
								</div>
								<div id="div-btn-submit">
									<button class="btn btn-default" type="reset" id="btn-reset">重置</button>
									<button class="btn btn-default" type="button" id="btn-submit" onclick="alterDetial()" >提交</button>
									<button class="btn btn-default" type="button" id="btn-submit-concel">取消</button>
								</div>
							</form>

							<%--  修改密码容器  --%>
							<div id="div-pwd" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="pwdModal
					" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
											<h4 class="modal-title" id="pwdModal">修改密码</h4>
										</div>
										<div class="modal-body">
											<form id="changpwd" role="form">
												<div class="form-group">
													<label for="originPwd">原密码：</label>
													<div class="">
														<input id="originPwd" class="form-control" type="password">
													</div>
												</div>
												<div class="form-group">
													<label>新密码：</label>
													<div class="newPwd">
														<input id="newPwd" class="form-control" type="password">
													</div>
												</div>
												<div class="form-group">
													<label>确认密码：</label>
													<div class="newPwdTwo">
														<input id="newPwdTwo" class="form-control" type="password">
													</div>
												</div>
												<label class="text-danger" id="pwd-msg"></label>
											</form>
										</div>
										<div class="modal-footer">
											<button id="btn-pwd-concel" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
											<button id="btn-pwd" onclick="alterPwd()" form="changpwd" type="button" class="btn btn-primary">确认</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<jsp:include page="foot.jsp"></jsp:include>
				</div>
			</div>
		</div>


		<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/static/js/admin/person.js"></script>
		<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
		 crossorigin="anonymous">
		</script>

	</body>
</html>
