function submitData() {
    let u_id = $("#u_id").val();
    let u_name = $("#u_name").val();
    let u_phone = $("#u_phone").val();

    $.ajax({
        type: "POST",
        url: "/employ/alterPerson",
        data: {
            u_id : u_id,
            u_name : u_name,
            u_phone : u_phone
        },

        success: function (data) {
            if (data.success) {
                alert(data.msg);
                location.href="/employ/person";
            }else {
                alert(data.msg);
            }

        }
    });
}

function changAbled() {
    // alert($("form input[type='text']"));
    $("form input[type='text']:not(#u_id)").prop({disabled: false});
    $("form #submit").attr("value", "提交").click(function () {
        submitData();
    });
}

$(document).ready(function (){

    $("form #submit").click(function () {
        changAbled();
    });
});