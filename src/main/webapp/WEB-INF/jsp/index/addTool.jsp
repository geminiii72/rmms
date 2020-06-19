<%--
  Created by IntelliJ IDEA.
  User: Husming
  Date: 2020/5/29
  Time: 12:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>设备登记</title>
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
                        <li><a href="#" class="active">设备登记</a></li>
                    </ul>
                    <hr />
                </div>

                <div class="article">

                    <div>
                        <form name="form-tool" role="form">
                            <div class="form-group">
                                <label class="control-label pull-left">选择设备</label>
                                <select class="form-control">
                                    <option>请选择</option>
                                </select>
                                <small>
                                    <a href="">登记新设备</a>
                                </small>
                            </div>
                            <div class="form-group">
                                <label class="pull-left">选择仓库</label>
                                <input class="form-control" type="text" disabled value="${user.u_name}" name="u_name" id="u_name" />
                            </div>
                            <div class="form-group">
                                <label class="pull-left">联系方式</label>
                                <input class="form-control" type="text" disabled value="${user.u_phone}" name="u_phone" id="u_phone" />
                            </div>
                            <div>
                                <input class="btn btn-default" type="button" value="修改" name="submit" id="submit" />
                            </div>
                        </form>
                    </div>

                </div>

            </div>
            <jsp:include page="foot.jsp"></jsp:include>
        </div>
    </div>
</div>


<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/person.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous">
</script>

</body>
</html>
