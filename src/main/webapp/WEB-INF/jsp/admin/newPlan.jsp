<%--
  Created by IntelliJ IDEA.
  User: Husming
  Date: 2020/5/27
  Time: 14:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>发布新项目</title>
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
							<li><a href="#" class="active">发布新项目</a></li>
						</ul>
						<hr />
					</div>
	
					<div class="article">
					
					    <form class="form-horizontal detial-form" role="form">
					        <div class="form-group">
					            <label class="control-label col-xm-3 col-md-2" for="p_type">项目类型：</label>
								<div class="col-xm-5 col-md-4">
									<select class="form-control" name="p_type" id="p_type">
									    <option selected value="">请选择</option>
									    <option value="勘察">勘察</option>
									    <option value="维修">维修</option>
									</select>
								</div>
					        </div>
					        <div class="form-group">
					            <label class="control-label col-xm-3 col-md-2">选择人员：</label>
								<div class="col-xm-3 col-md-2">
									<button class="btn btn-default" type="button" data-toggle="modal" data-target="#div_user" >选择人员</button>
								</div>	
					        </div>
					        <div class="form-group">
					            <label class="control-label col-xm-3 col-md-2">选择设备：</label>
								<div class="col-xm-3 col-md-2">
									<button class="btn btn-default" type="button" data-toggle="modal" data-target="#div_tool" >选择设备</button>
								</div>	
					        </div class="form-group">
					        <div class="form-group" id="div-btn-road">
					            <label class="control-label col-xm-3 col-md-2">选择道路：</label>
								<div class="col-xm-3 col-md-2">
									<button class="btn btn-default" type="button" data-toggle="modal" data-target="#div_road" >选择道路</button>
								</div>	
					        </div>
					        <div class="form-group">
					            <label class="control-label col-xm-3 col-md-2" for="p_note">项目备注：</label>
								<div class="col-xm-9 col-md-10">
									<textarea class="form-control" name="p_note" id="p_note"></textarea>
								</div>
					        </div>
					        <div class="col-md-offset-2">
					            <button class="btn btn-default" type="button" onclick="verify()">提交</button>
					        </div>
					        <p id="tip"></p>
					    </form>
					
					</div>
					
				</div>
				<jsp:include page="foot.jsp"></jsp:include>
			</div>
			
			</div>
		</div>
	</div>
	
<%--  用户列表  --%>
	<div id="div_user" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="userModal
" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="userModal">用户列表</h4>
				</div>
				<div class="modal-body">
					<div id="table-body-user">
					    <table class="table table-condensed .table-hover .table-bordered">
							<tbody>
								
							</tbody>
						</table>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button onclick="confirmUser()"type="button" class="btn btn-primary">确认</button>
				</div>
			</div>
		</div>
	</div>
	
<%--  设备列表  --%>
	<div id="div_tool" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="toolModal
" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="toolModal">设备列表</h4>
				</div>
				<div class="modal-body">
					<div id="table-body-tool">
						<table class="table table-condensed .table-hover .table-bordered">
							<tbody>
								
							</tbody>
						</table>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button onclick="confirmTool()"type="button" class="btn btn-primary">确认</button>
				</div>
			</div>
		</div>
	</div>
		
<%--  道路列表  --%>
	<div id="div_road" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="roadModal
" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="roadModal">通道列表</h4>
				</div>
				<div class="modal-body">
					<div id="table-body-road">
					    <table class="table table-condensed .table-hover .table-bordered">
							<tbody>
								
							</tbody>
					    </table>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button onclick="confirmRoad()"type="button" class="btn btn-primary">确认</button>
				</div>
			</div>
		</div>
	</div>
	
	
</div>

<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    let userList = new Array({});
    let toolList = new Array({});
    let roadId = null;
</script>
<script src="${pageContext.request.contextPath}/static/js/admin/newplan.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
 crossorigin="anonymous">
</script>

</body>
</html>
