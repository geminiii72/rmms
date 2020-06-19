function loadPlan (plans) {
    if (plans != null) {
        for (let item of plans) {
            // console.log(item.isadmin);//测试数据用
            // console.log(item.plan);
            let plan = item.plan;

            if (item.isadmin) {
                $("#my_plan_none").remove();
                $("#my_plan").append("<a href='/employ/plan?p_id=" + plan.p_id + "'><div>" + plan.p_id + "</div></a>");
            } else {
                $("#my_join").append("<a href='/employ/plan?p_id=" + plan.p_id + "'><div>" + plan.p_id + "</div></a>");
                $("#my_join_none").remove();
            }

        }
    }
}


$(function ($) {

    $.ajax({
       type: "GET",
       url: "/employ/plans",

       success(data) {
           loadPlan(data);
       }
    });


});