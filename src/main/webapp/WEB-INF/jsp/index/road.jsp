<%--
  Created by IntelliJ IDEA.
  User: Husming
  Date: 2020/5/29
  Time: 1:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>道路信息</title>
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
                        <li><a href="#" class="active">道路信息</a></li>
                    </ul>
                    <hr />
                </div>

                <div class="article">

                    <div>
                        <form  method="post" action="addRoad" onsubmit="return verify()" role="form">

                            <lable class="form-lable pull-left">道路名称：</lable>
                            <input class="form-control" type="text" name="r_name" required/>

                            <lable class="form-lable pull-left">道路类型：</lable>
                            <input class="form-control" type="text" name="r_type" required/>

                            <lable class="form-lable pull-left">道路长度：</lable>
                            <input class="form-control" type="text" name="r_length" required/>

                            <lable class="form-lable pull-left">道路宽度：</lable>
                            <input class="form-control" type="text" name="r_width" required/>

                            <lable class="form-lable pull-left">损坏类型：</lable>
                            <input class="form-control" type="text" name="r_m_type" required/>

                            <lable class="form-lable pull-left">损坏密度：</lable>
                            <input class="form-control" type="text" name="r_m_density" requiredty/>

                            <lable class="form-lable pull-left">损坏长度：</lable>
                            <input class="form-control" type="text" name="r_m_length" requiredh/>

                            <lable class="form-lable pull-left">损坏宽度：</lable>
                            <input class="form-control" type="text" name="r_m_width" required/>

                            <lable class="form-lable pull-left">维护评级：</lable>
                            <input class="form-control" type="text" name="r_m_grade" required/>

                            <lable class="form-lable pull-left">备注：</lable>
                            <textarea class="form-control" type="text" name="r_note" required></textarea>

                            <div>
                                <button class="btn btn-default" type="submit">提交</button>
                                <button class="btn btn-default" type="button">定位</button>
                                <div>
                                    <span id="tip"></span>
                                </div>
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
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>

</body>
</html>
