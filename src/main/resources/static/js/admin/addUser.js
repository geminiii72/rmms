


$(function ($) {

    //为按钮添加修改验证事件
    $("[name='u_phone']").change(function () {
        isExistPhone($(this).val());
    });

});

//判断输入的联系方式是否已经存在
function isExistPhone(phone) {

    //判断是否为空
    if(phone == null || phone == "") { return;}

    $.ajax({
        type: "POST",
        url: "/admin/phoneIsExist",
        data: {
            u_phone: phone
        },
        success (isExist) {
            if(isExist) {
                $("#msg").html("该用户已经存在");
            }else {
                $("#msg").html("");
            }

        }
    });
}

//验证表单输入内容，显示提示，决定是否上传
function verify() {
    let u_name = $("[name='u_name']").val();
    let u_phone = $("[name='u_phone']").val();
    let u_class = $("[name='u_class']").val();
    let u_type = $("[name='u_type'] option:selected").val();
    let list = [u_name, u_phone, u_class, u_type];
    for(let item of list) {
        if (item == null || item == "" || item == undefined) {
            $("#msg").html("请输入内容");
            return false;
        }
    }
    $("#msg").html("");

    return true;
}