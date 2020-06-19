$(function ($) {

    //在选择项目类型改变载入用户表
    $("[name='p_type']").change(function () {
        let type = $("[name='p_type'] option:selected").val();
        loadUserLsit(type);
        if (type == "勘察") {
            $("#div-btn-road").hide();
        }else {
            $("#div-btn-road").show();
        }
    });
    //载入剩余设备表
    loadToolList();
    //载入道路表
    loadRoadList();
});


//表单提交前验证
function verify() {
    let type = $("[name='p_type'] option:selected").val();
    let note = $("[name='p_note']").val()

    //验证是否有空输入
    if (type == null|| type == "" || type == undefined)
    {
        $("#tip").html("请先选择项目类型");
        return false;
    }
    if (userList == null|| userList == "")
    {
        $("#tip").html("请选择负责人员");
        return false;
    }
    if ( type == "维修" && (roadId == null|| roadId == "")) {
        $("#tip").html("请选择需要维修的道路");
        return false;
    }

    $.ajax({
        type: "POST",
        url: "/admin/addPlan",
        data: {
            userList: JSON.stringify(userList),
            toolList: JSON.stringify(toolList),
            r_id: roadId,
            p_type: type,
            p_note: note
        },
        success(data) {
            if(!data.success) {
                window.alert(data.msg);
            }else{
                window.alert("项目成功发布");
                location.href="/admin/totable?table_type=plan";
            }
        }
    });

}


//载入用户列表
function loadUserLsit(type) {
    $.ajax({
        type: "GET",
        url: "/admin/userList",
        async: false,
        data: {
            type: type
        },
        success(data) {
            let tbody = $("#table-body-user table:first tbody");
            tbody.html("");
            $.each(data, function (index, item) {
                tbody.append("<tr><td>" + item.u_id
                    + "</td><td>" + item.u_name
                    + "</td><td>" + item.u_class
                    + "</td><td><input type='checkbox' name='isAdmin' >"
                    + "</td><td><input type='checkbox' name='checkBox' >"
                    + "</td></tr>");
            });
        }
    });
    

}
//确认选择人员
function confirmUser() {
    //清空原选择
    userList = [];

    let checkBox = $("#table-body-user table:first td:last-child input[name='checkBox']");
    let isAdmines = $("#table-body-user table:first input[name='isAdmin']");
    let dataId =  $("#table-body-user table:first td:first-child");

    $.each(checkBox, function (index, item) {
        if(this.checked) {
            userList.push({u_id: dataId.eq(index).html(), pu_isadmin: isAdmines.eq(index).prop("checked")});
        }
    });

    $("#div_user").hide();
}


//载入剩余设备
function loadToolList() {
    $.ajax({
        type: "GET",
        url: "/admin/toolList",
        async: false,
        success(data) {
            let tbody = $("#table-body-tool tbody:first");
            $.each(data, function (index, item) {
                tbody.append("<tr><td>" + item.t_id
                    + "</td><td>" + item.t_name
                    + "</td><td>剩余数量" + item.tr_num
                    + "</td><td>数量<input type='number' name='tr_num' value='1'>" +
                    + "</td></tr>");
            });
        }
    });


    //载入复选框
    let  tr = $("#table-body-tool table:first tr");
    tr.append("<td><input type='checkbox' name='checkBox' ></td>");

}
//确认选择设备
function confirmTool() {
    //清空原选择
    toolList = [];

    let checkBox = $("#table-body-tool table:first td:last-child input");
    let dataId =  $("#table-body-tool table:first td:first-child");
    let numes = $("#table-body-tool table:first input[name='tr_num']");

    $.each(checkBox, function (index, item) {
        if(this.checked) {
            let tool_id = dataId.eq(index).html();
            let num = numes.eq(index).val();
            toolList.push({t_id: tool_id, tr_num: num});
        }
    });

    $("#div_tool").hide();
}

//载入道路信息
function loadRoadList() {
    $.ajax({
        type: "GET",
        url: "/admin/roadList",
        async: false,
        success(data) {
            let str = "<tr><th>道路编号</th><th>道路名称</th><th>道路类型</th><th>损坏类型</th><th>损坏评级</th><th></th></tr>";
            let tbody = $("#table-body-road tbody:first");
            tbody.html(str);
            $.each(data, function (index, item) {
                tbody.append("<tr><td>" + item.r_id
                    + "</td><td>" + item.r_name
                    + "</td><td>" + item.r_type
                    + "</td><td>" + item.r_m_type
                    + "</td><td>" + item.r_m_grade
                    + "</td>" + "<td><input type='radio' name='radioBox' value='item.r_id'></td></tr>");
            });
        }
    });


}
//确认选择道路
function confirmRoad() {

    let r_id = $("#table-body-road table:first input[name='radioBox']:selected").val();

    roadId = r_id;

    $("#div_tool").hide();
}
