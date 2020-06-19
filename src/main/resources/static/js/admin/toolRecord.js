$(function ($) {

    //载入第一页记录
    loadRecord(1, page_size);

    //载入数据后在所有表格行前添加删除复选框
    loadChecked();

})

//载入记录
function loadRecord(page, size) {
    $.ajax({
        type: "GET",
        url: "/admin/toolRecord",
        async: false,
        data: {
            page: page,
            pageSize: size
        },
        success(pageInfo) {
            let str = "<tr><th>记录编号</th><th>记录人</th><th>设备名称</th>" +
                "<th>存储位置</th><th>流通类型</th><th>流通数量</th>" +
                "<th>添加时间</th><th>所属计划编号</th><th>备注</th></tr>";
            let tbody = $("#table-body table:first tbody");
            tbody.html(str);
            $.each(pageInfo.list, function (index, item) {
                tbody.append("<tr><td>" + item.tr_id
                    + "</td><td>" + item.u_name
                    + "</td><td>" + item.t_name
                    + "</td><td>" + item.w_place
                    + "</td><td>" + item.tr_type
                    + "</td><td>" + item.tr_num
                    + "</td><td>" + item.tr_date
                    + "</td><td>" + item.p_id
                    + "</td><td>" + item.tr_note
                    + "</td></tr>");
            });

            //加载页数
            loadPage(pageInfo);

            $("#page a").click(function () {
                loadRecord($(this).attr("val"), page_size);
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
    let  tr = $("#table-body table:first tr:not(:first)");
    tr.append("<td><input type='checkbox' name='deleteBox' ></td>");
    $("#table-body table:first tr:first").append("<td>" +
        "<input type='checkbox' onchange='allChecked()' id='allChecked'/></td>");
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