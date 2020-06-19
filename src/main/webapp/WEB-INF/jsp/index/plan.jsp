<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Husming
  Date: 2020/5/23
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<head>
		<title>我的项目</title>
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
							
							<div class="panel panel-primary">
							    <div class="panel-heading">
									<div class="row">
										<label>我的项目</label>
										<div>
											<select class="form-control " id="planList">
											</select>
										</div>
									</div>
							    </div>
							    <div class="panel-body">
							        <div id="myPlan">
							        	<div class="form-group">
							        		<label class="pull-left">计划编号</label>
							        		<input class="form-control disabled" type="text" />
							        	</div>
							        	<div class="form-group">
							        		<label class="pull-left">计划类型</label>
							        		<input class="form-control disabled" type="text" />
							        	</div>
							        	<div class="form-group">
							        		<label class="pull-left">发布者</label>
							        		<input class="form-control disabled" type="text" />
							        	</div>
							        	<div class="form-group">
							        		<label class="pull-left">发布时间</label>
							        		<input class="form-control disabled" type="text" />
							        	</div>
							        	<div class="form-group">
							        		<label class="pull-left">备注</label>
							        		<textarea class="form-control disabled" type="text" ></textarea>
							        	</div>
							        	<div class="form-group">
							        		<label class="pull-left">当前状态</label>
							        		<input class="form-control disabled" type="text" />
							        	</div>
							        	<div id="planDetail" class="form-group">
							        		<button class="btn btn-default" id="btn_user" data-toggle="modal" data-target="#div-user">参与人员</button>
							        		<button class="btn btn-default" id="btn_tool" data-toggle="modal" data-target="#div-tool">可用设备</button>
							        		<a class="btn btn-default" href="#" id="btn_road">道路详情</a>
							        	</div>
							        	<div class="form-group">
							        		<label class="control-label col-sm-2">进度：</label>
							        		<div class="col-sm-10">
							        			<div class="progress">
							        			    <div class="progress-bar" role="progressbar" aria-valuenow="60" 
							        			        aria-valuemin="0" aria-valuemax="100" style="width: 40%;">
							        			        <span class="sr-only">40% 完成</span>
							        			    </div>
							        			</div>
							        		</div>
							        	</div>
							        	<div class="form-group">
							        		<label class="control-label">道路位置</label>
											<div>
												<iframe>
													????
												</iframe>
											</div>
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


		<!-- 用户表 -->
		<div class="modal fade" id="div-user" tabindex="-1" role="dialog" aria-labelledby="userModal" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <h4 class="modal-title" id="userModal">参与人员</h4>
		            </div>
		            <div class="modal-body">
						<div id="userInfo">
							<table class="table table-condensed">
								<thead>
									
								</thead>
								<tbody>
									
								</tbody>
							</table>
						</div>
					</div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-info" data-dismiss="modal">关闭</button>
		            </div>
		        </div><!-- /.modal-content -->
		    </div><!-- /.modal -->
		</div>
		
		<!-- 设备表 -->
		<div class="modal fade" id="div-tool" tabindex="-1" role="dialog" aria-labelledby="toolModal" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <h4 class="modal-title" id="toolModal">可以使用设备</h4>
		            </div>
		            <div class="modal-body">
						<div id="toolInfo">
							<table class="table table-condensed">
								<thead>
									
								</thead>
								<tbody>
									
								</tbody>
							</table>
						</div>
					</div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-info" data-dismiss="modal">关闭</button>
		            </div>
		        </div><!-- /.modal-content -->
		    </div><!-- /.modal -->
		</div>
		


		<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/static/js/util.js"></script>
		<script src="${pageContext.request.contextPath}/static/js/index/plan.js"></script>
		<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
		 crossorigin="anonymous">
		</script>
		<script>
			var road_src = null;
			var plan_type = null;
			var r_id = null;
		</script>

	</body>
</html>
