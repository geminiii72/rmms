
//表单提交前验证
function verify() {
    let r_id = $("input[name='r_id']").val();
    let r_name = $("input[name='r_name']").val();
    let r_type = $("input[name='r_type']").val();
    let r_length = $("input[name='r_length']").val();
    let r_width = $("input[name='r_width']").val();
    let r_date = $("input[name='r_date']").val();
    let r_state = $("input[name='r_state']").val();
    let r_m_type = $("input[name='r_m_type']").val();
    let r_m_length = $("input[name='r_m_length']").val();
    let r_m_width = $("input[name='r_m_width']").val();
    let r_m_density = $("input[name='r_m_density']").val();
    let r_m_grade = $("input[name='r_m_grade']").val();
    let r_note = $("input[name='r_note']").val();

    //验证关键参数是否有空输入
    if (r_name == null|| r_name == "")
    {
        $("#tip").html("请输入道路名称");
        return false;
    }
    if (r_type == null|| r_type == "")
    {
        $("#tip").html("请输入道路类型");
        return false;
    }
    if (r_state == null|| r_state == "")
    {
        $("#tip").html("请输入道路维修情况");
        return false;
    }
    if (r_m_type == null|| r_m_type == "")
    {
        $("#tip").html("请说明损坏类型");
        return false;
    }
    if (r_m_density == null|| r_m_density == "")
    {
        $("#tip").html("请输入损坏密度");
        return false;
    }
    if (r_m_grade == null|| r_m_grade == "")
    {
        $("#tip").html("请为损坏情况评级");
        return false;
    }

    $("input[name='r_id']").prop({disabled: false});
    return true;

}


