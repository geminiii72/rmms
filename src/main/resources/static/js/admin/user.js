
//表单提交前验证
function verify() {
    let u_name = $("input[name='u_name']").val();
    let u_phone = $("input[name='u_phone']").val();
    let u_class = $("input[name='u_class']").val();
    let u_type = $("[name='u_type'] option:selected").val();

    //验证是否有空输入
    if (u_name == null|| u_name == "")
    {
        $("#tip").html("请输入用户名");
        return false;
    }
    if (u_phone == null|| u_phone == "")
    {
        $("#tip").html("请输入联系方式");
        return false;
    }
    if (u_class == null|| u_class == "")
    {
        $("#tip").html("请输入职称");
        return false;
    }
    if (u_type == null|| u_type == "" || u_type==undefined)
    {
        $("#tip").html("请选择系统身份");
        return false;
    }

    let success;
    //验证电话号码是否已经存在
    $.ajax({
        type: "POST",
        url: "/admin/phoneIsExist",
        async: false,
        data: {
            u_phone: u_phone
        },
        success(data) {
            success = data;
        }
    });
    if(success) {
        $("#tip").html("该电话号码已经存在");
        return false;
    }

    $("input[name='u_id']").prop({disabled: false});
    return true;

}

//还原密码
function restorePwd() {
    let u_id = $("input[name='u_id']").val();

    $.ajax({
        type: "POST",
        url: "/admin/restore",
        async: false,
        data: {
            u_id: u_id
        },
        success(data) {
            window.alert(data.msg);
        }
    });
}