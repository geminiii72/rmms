<%--
  Created by IntelliJ IDEA.
  User: Husming
  Date: 2020/5/29
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>道路详情</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
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
                            <p class="form-control-static">${road.r_name}</p>

                            <lable class="form-lable pull-left">道路类型：</lable>
                            <p class="form-control-static">${road.r_type}</p>

                            <lable class="form-lable pull-left">道路长度：</lable>
                            <p class="form-control-static">${road.r_length}</p>

                            <lable class="form-lable pull-left">道路宽度：</lable>
                            <p class="form-control-static">${road.r_width}</p>

                            <lable class="form-lable pull-left">损坏类型：</lable>
                            <p class="form-control-static">${road.r_m_type}</p>

                            <lable class="form-lable pull-left">损坏密度：</lable>
                            <p class="form-control-static">${road.r_m_density}</p>

                            <lable class="form-lable pull-left">损坏长度：</lable>
                            <p class="form-control-static">${road.r_m_length}</p>

                            <lable class="form-lable pull-left">损坏宽度：</lable>
                            <p class="form-control-static">${road.r_m_width}</p>

                            <lable class="form-lable pull-left">维护评级：</lable>
                            <p class="form-control-static">${road.r_m_grade}</p>

                            <lable class="form-lable pull-left">登记人：</lable>
                            <p class="form-control-static">${road.u_id}</p>

                            <lable class="form-lable pull-left">登记时间：</lable>
                            <p class="form-control-static">${road.r_date}</p>

                            <lable class="form-lable pull-left">备注：</lable>
                            <p class="form-control-static">${road.r_note}</p>

                            <div>
                                <a class="btn btn-default" href="/employ/plan">返回</a>
                            </div>

                            <div>
                                <iframe style="width:400px; height:250px;"
                                        src="https://m.amap.com/navi/?dest=${road.r_x},${road.r_y}&destName=${road.r_name}&hideRouteIcon=1&key=e19e6c645f4940679e3885c69dac9f83">

                                </iframe>
                                <div id="container" style="width:300px; height: 180px;">

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
<script type="text/javascript" src="https://webapi.amap.com/maps?v=2.0&key=e19e6c645f4940679e3885c69dac9f83"></script>
<script src="${pageContext.request.contextPath}/static/js/index/roadDetial.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>

</body>
</html>
