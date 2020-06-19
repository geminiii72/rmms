


$(function ($) {

    //根据get类型判断页面数据类型
    switch (page_type) {
        case "user": $("#btn-add").attr("href","/admin/toAddUser");loadUser(1, page_size);break;
        case "tool": loadTool(1, page_size);break;
        case "road": loadRoad(1, page_size);break;
        case "plan": loadPlan(1, page_size);break;
        default:window.alert("输入类型有误!");
    }

    //载入数据后在所有表格行前添加删除复选框
    loadChecked();

})


//载入用户表格
function loadUser(page, size) {
    $.ajax({
        type: "GET",
        url: "/admin/userInfo",
        async: false,
        data: {
            page: page,
            pageSize: size
        },
        success(pageInfo) {
            $("#table-body caption lable").html("系统用户表");
            let str = "<tr><th>用户编号</th><th>用户姓名</th><th>联系方式</th><th>职称</th><th>系统身份</th></tr>";
            let thead = $("#table-body thead:first");
            thead.html(str);
			let tbody = $("#table-body tbody:first");
            $.each(pageInfo.list, function (index, item) {
                tbody.append("<tr><td>" + item.u_id
                    + "</td><td>" + item.u_name
                    + "</td><td>" + item.u_phone
                    + "</td><td>" + item.u_class
                    + "</td><td>" + item.u_type
                    + "</td></tr>");

                $("#table-body tbody:first tr:last").click(function () {
                    location.href = "/admin/userDetial?u_id=" + item.u_id;
                });
            });

            //加载页数
            loadPage(pageInfo);

            $("#page a").click(function () {
                loadUser($(this).attr("val"), page_size);
            });
        }
    });
}

//载入设备表格
function loadTool(page, size) {
    $.ajax({
        type: "GET",
        url: "/admin/toolInfo",
        async: false,
        data: {
            page: page,
            pageSize: size
        },
        success(pageInfo) {
            $("#table-body caption lable").html("剩余设备表");
            let str = "<tr><th>设备编号</th><th>设备名称</th><th>设备类型</th><th>存放位置</th><th>剩余数量</th><th>备注</th></tr>";
            let thead = $("#table-body thead:first");
            thead.html(str);
			let tbody = $("#table-body tbody:first");
            $.each(pageInfo.list, function (index, item) {
                tbody.append("<tr><td>" + item.t_id
                    + "</td><td>" + item.t_name
                    + "</td><td>" + item.t_type
                    + "</td><td>" + item.w_place
                    + "</td><td>" + item.tr_num
                    + "</td><td>" + item.t_note3
                    + "</td></tr>");

                $("#table-body tbody:first tr:last").click(function () {
                    location.href = "/admin/toolDetial?t_id=" + item.u_id;
                });
            });

            //加载页数
            loadPage(pageInfo);

            $("#page a").click(function () {
                loadUser($(this).attr("val"), page_size);
            });
        }
    });
}

//载入道路表格
function loadRoad(page, size) {
    $.ajax({
        type: "GET",
        url: "/admin/roadInfo",
        async: false,
        data: {
            page: page,
            pageSize: size
        },
        success(pageInfo) {
            $("#table-body caption lable").html("上报道路表");
            let str = "<tr><th>道路编号</th><th>道路名称</th><th>道路类型</th><th>上报时间</th><th>当前状态</th><th>损坏评级</th></tr>";
            let thead = $("#table-body thead:first");
            thead.html(str);
			let tbody = $("#table-body tbody:first");
            $.each(pageInfo.list, function (index, item) {
                tbody.append("<tr><td>" + item.r_id
                    + "</td><td>" + item.r_name
                    + "</td><td>" + item.r_type
                    + "</td><td>" + item.r_date
                    + "</td><td>" + item.r_state
                    + "</td><td>" + item.r_m_grade
                    + "</td></tr>");

                $("#table-body tbody:first tr:last").click(function () {
                    location.href = "/admin/roadDetial?r_id=" + item.r_id;
                });
            });

            //加载页数
            loadPage(pageInfo);

            $("#page a").click(function () {
                loadUser($(this).attr("val"), page_size);
            });
        }
    });
}

//载入计划表格
function loadPlan(page, size) {
    $.ajax({
        type: "GET",
        url: "/admin/planInfo",
        async: false,
        data: {
            page: page,
            pageSize: size
        },
        success(pageInfo) {
            $("#table-body caption lable").html("维护计划表");
            let str = "<tr><th>计划编号</th><th>计划类型</th><th>道路名称</th><th>开始时间</th><th>当前状态</th><th>负责人</th></tr>";
            let thead = $("#table-body thead:first");
            thead.html(str);
			let tbody = $("#table-body tbody:first");
            $.each(pageInfo.list, function (index, item) {
                tbody.append("<tr><td>" + item.p_id
                    + "</td><td>" + item.p_type
                    + "</td><td>" + item.r_name
                    + "</td><td>" + item.p_date
                    + "</td><td>" + item.p_state
                    + "</td><td>" + item.u_name
                    + "</td></tr>");
            });

            //加载页数
            loadPage(pageInfo);

            $("#page a").click(function () {
                loadUser($(this).attr("val"), page_size);
            });
        }
    });
}

//刷新表格下部 分页数链接 @pageInfo 页数据
function loadPage (pageInfo) {
    let page = $("#page ul");//链接容器
    let index = pageInfo.pageNum;//当前页
    //清空容器
    page.html("");

    //添加链接
    page.append("<li><a val='1'>&laquo;</a></li>");

    let list = pageInfo.navigatepageNums;
    $.each(list, function (i, item) {
		if(index == item)
		{
			page.append("<li class='active'><a val='" + item + "'>" + item + "</a></li>");
		}else {
			page.append("<li><a val='" + item + "'>" + item + "</a></li>");
		}
    })

    page.append("<li><a val='" + pageInfo.pages + "'>&raquo;</a></li>");
}

//载入删除复选框
function loadChecked() {
    let  tres = $("#table-body table:first tr:not(:first)");
    tres.append("<td><input type='checkbox' name='deleteBox' ></td>");
    $("#table-body table:first tr:first").append("<th>" +
        "<input type='checkbox' onchange='allChecked()' id='allChecked'/></th>");
    //载入后隐藏复选框 和 确认按钮
    $("#table-body table:first tr input[type='checkbox']").hide();
    $("#btn-submit").hide();
    $("#btn-concel").hide();
}

//全选按钮事件
function allChecked() {
    if($("#allChecked").prop("checked")) {
        $("input[name='deleteBox']").prop({checked:true});
    }else {
        $("input[name='deleteBox']").prop({checked:false});
    }
}
function deleteToggle() {
    $("#table-body table:first tr input[type='checkbox']").toggle();
    $("#btn-submit").toggle();
    $("#btn-concel").toggle();
    $("#btn-toggle").toggle();
}


//触发删除事件
function deleteData() {
    let checkBox = $("#table-body table:first td:last-child input");
    let dataId =  $("#table-body table:first td:first-child");
    let list = new Array();

    $.each(checkBox, function (index, item) {
        if(this.checked) {
            list.push(dataId.eq(index).html());
        }
    });

    console.log(list);

    $.ajax({
        type: "POST",
        url: "/admin/deleteData",
        async:false,
        data: {
            idList: list,
            type: page_type
        },
        success(success) {
            if (!success) {
                window.alert("删除失败，出现错误");
            }
            location.href="/admin/totable?table_type=" + page_type;
        }
    });


}
