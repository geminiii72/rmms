
//导入参与用户列表
function loadUserInfo (p_id) {
    $.ajax({
        type: "GET",
        url: "/employ/planUSer",

        data: {
            p_id: p_id
        },
        success (data) {
            // console.log("UserList:" + data);
            let thead = $("#userInfo thead");
            thead.append("<tr><th>姓名</th><th>职称</th><th>是否为负责人</th></tr>");
			let tbody = $("#userInfo tbody");
            for (let item of data) {
                tbody.append("<tr><td>" + item.u_name + "</td><td>" + item.u_class + "</td><td>" + item.pu_isadmin +"</td></tr>");
            }
        }
    });
}

//导入分配设备列表
function loadToolInfo (p_id) {
    $.ajax({
        type: "GET",
        url: "/employ/planTool",

        data: {
            p_id: p_id
        },
        success (data) {
            // console.log("ToolList:" + data);
			let thead = $("#toolInfo thead");
            thead.append("<tr><th>设备名</th><th>数量</th><th>备注</th></tr>");
			let tbody = $("#toolInfo tbody");
            for (let item of data) {
                tbody.append("<tr><td>" + item.t_name + "</td><td>" + item.tr_num + "</td><td>" + item.t_note +"</td></tr>");
            }
        }
    });
}

//导入道路

//导入当前选择的项目信息
function loadPlan (p_id) {
    $.ajax({
        type: "GET",
        url: "/employ/planData",
        async: false,
        data: {
            p_id: p_id
        },
        success(data) {
            // console.log("data:" + data.p_id);
            //为表单注入信息
            let contains = $("#myPlan input[type='text']");
            contains.eq(0).val(data.p_id);
            contains.eq(1).val(data.p_type);
			plan_type = data.p_type;
            contains.eq(2).val(data.u_id);
            contains.eq(3).val(data.p_date);
            contains.eq(4).val(data.p_note);
            contains.eq(5).val(data.p_state);

            r_id = data.r_id;
        }
    });
}


$(function ($) {


    //载入<select>项目列表
    $.ajax({
        type: "GET",
        url: "/employ/planList",
        async: false,
        success(data) {
            if(data[0] != null){
                for (let i of data) {
                    $("#planList").append("<option value='" + i + "'>" + i + "</option>");
                }
            }else {
                $("#planList").append("<option>无</option>");
            }
        }
    });


    //判断该用户是否含有项目，并载入项目、用户列表、设备信息
    let first_plan = $("#planList:first").val();
    if (first_plan != "无") {
        let p_id = getQueryString("p_id");
        if (p_id == null) {p_id = first_plan;}//判断是否有从GET中传入p_id

        $("#planList option[value=" + p_id + "]").prop({checked: true});
        loadPlan(p_id);
        loadUserInfo(p_id);
        loadToolInfo(p_id);
		
    }else {
        $("#myPlan").hide().after("您暂时未被分配计划");
    }

    //判断用户类型并选择[道路详情]或[上传道路]按钮

	let btn = $("#btn_road");
	if (plan_type == "勘察"){
	   btn.html("道路上传");
	   btn.attr("href", "/employ/toAddRoad");
	}
	else if (plan_type == "维修") {
	   btn.html("道路详情");
	   btn.attr("href", "/employ/roadDetial?r_id=" + r_id);
	}
})