//修改密码
function alterPwd() {
    let controles =  $("#div-pwd input[type='password']");
    //判断输入是否为空
    for (let i=0;i<controles.length;i++) {
        if(controles.eq(i).val() == "" || controles.eq(i).val() == null || controles.eq(i) == undefined) {
            $("#pwd-msg").html("请输入内容");
            return;
        }
    }
    //判断两次新密码输入是否相同
    if (controles.eq(1).val() != controles.eq(2).val()) {
        $("#pwd-msg").html("两次密码不相同");
        return;
    }

    //传至修改密码控制器
    $.ajax({
        type: "POST",
        url: "/admin/password",
        async: false,
        data: {
            originPwd: controles.eq(0).val(),
            pwd: controles.eq(1).val()
        },
        success (data) {
            if(data.msg == "原密码错误") {
                window.alert(data.msg);
            }else {
				window.alert(data.msg);
                //修改完成 重新载入页面
                location.href="/admin/person";
            }
        }
    });


}

//修改个人资料
function alterDetial () {
    let controles = $("#formPerson input[type='text']");

    if(controles.eq(2) == "" || controles.eq(2) == null) {
        window.alert("请输入电话号码");
        return;
    }

    $.ajax({
        type: "POST",
        url: "/admin/detial",
        async: false,
        data: {
            u_id: $("#u_id").val(),
            u_name: $("#u_name").val(),
            u_class: $("#u_class").val(),
        },
        success(data) {
            if(!data.success) {//修改失败
                window.alert(data.msg);
            }else {//修改成功 重新载入界面
                window.alert(data.msg);
                location.href="/admin/person";
            }
        }
    });
}

//init
$(function ($) {
	
	$("#div-btn-submit").hide();
	


    //显示修改资料界面
    $("#btn-show-submit").click(function () {
        console.log($("#formPerson input[type='text']"));
        $("#formPerson input[type='text']:not([name='u_id'])").prop({disabled: false});;

        //隐藏修改资料按钮，显示提交&重置&取消按钮
        $("#div-btn-detial").hide();
        $("#div-btn-submit").show();
    });
    //取消修改资料界面
    $("#btn-submit-concel").click(function () {
        $("#formPerson input[type='text']:not([name='u_id'])").prop({disabled: true});;
        //显示修改资料按钮，隐藏提交&重置&取消按钮
        $("#div-btn-detial").show();
        $("#div-btn-submit").hide();
    })
});