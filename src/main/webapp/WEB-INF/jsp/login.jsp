<%--
  Created by IntelliJ IDEA.
  User: Husming
  Date: 2020/5/19
  Time: 18:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>道路养护管理系统-登录</title>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<style>
    .bg {
        background: url('${pageContext.request.contextPath}/static/img/loginbg.jpg');
        height:100%;
		width: 100%;
        text-align: center;
        line-height: auto;
		overflow: hidden;
    }
    .bg-blur {
        float: left;
        background-repeat: no-repeat;
        background-position: left top;
        background-size: cover;
        -webkit-filter: blur(5px);
        -moz-filter: blur(5px);
        -o-filter: blur(5px);
        -ms-filter: blur(5px);
        filter: blur(5px);
    }
    .content-front {
		margin: auto;
        position:absolute;
		width: 300px;
		height:auto;
        left: 10px;
        right: 10px;
		top: 25%;
		box-shadow: 0px 0px 20px 3px #666;
		padding: 50px;
		line-height: 30px;
    }
	.label-pwd {
		word-spacing: 20px;
	}
</style>
<body>
	<div class="bg bg-blur">
	</div>
	<div class="container">
		<div class="content-front">
			<form action="/user/login.do" method="post" role="form" class="form-horizontal">
				<div class="form-heading">
					<h3>道路养护管理系统</h3>
					<hr />
				</div>
				<div class="form-group">
					<label for="username" class="sr-only control-label" required>用户名</label>
					<input id="username" name="username" type="text" class="form-control" placeholder="请输入工号或者手机号" required>
					<label for="password" class="sr-only control-label label-pwd">密码</label>
					<input id="password" name="password" type="password" class="form-control" placeholder="请输入密码" required>
				</div>
				<div class="form-group">
						<button type="submit"class="btn btn-lg btn-primary btn-block">登录</button>
						<small >
							<a href="#">忘记密码？</a>
						</small>
				</div>
			</form>
		</div>
	</div>
</body>

<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
		integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous">
</script>

<script>
	if ("${msg}" != ""){
		window.alert("${msg}");
	}
	
	$("a").click(function () {
		window.alert("请联系管理员");
	});
</script>

</html>
