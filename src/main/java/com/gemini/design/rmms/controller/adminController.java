package com.gemini.design.rmms.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.gemini.design.rmms.entity.*;
import com.gemini.design.rmms.service.PlanService;
import com.gemini.design.rmms.service.RoadService;
import com.gemini.design.rmms.service.ToolService;
import com.gemini.design.rmms.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/admin")
public class adminController {
    @Autowired
    UserService userService;
    @Autowired
    ToolService toolService;
    @Autowired
    RoadService roadService;
    @Autowired
    PlanService planService;

    @GetMapping("/toIndex")
    public String toIndex() {return "index/index";};
    /* 跳转至表格页 */
    @GetMapping("/totable")
    public String toTable (@RequestParam("table_type") String type, Model model) {
        model.addAttribute("type", type);
        return "admin/table";
    }
    /* 跳转至添加页 */
    @GetMapping("/toAddUser")
    public String toAddUser () {
        return "admin/addUser";
    }
    /* 跳转至设备流通记录 */
    @GetMapping("/toToolRecord")
    public String toToolRecord () { return  "admin/toolRecord"; }
    /* 跳转新项目页 */
    @GetMapping("/toNewPlan")
    public String toNewPlan () {
        return "admin/newPlan";
    }


    /* 判断该电话号码是否存在 */
    @PostMapping("/phoneIsExist")
    @ResponseBody
    public Boolean phoneIsExist(String u_phone) {
        if (userService.findUserForPhone(u_phone) != null) {
            return true;
        }
        return false;
    }

    /*
     * 用户信息表格控制器
     * @Param page 当前页数 默认1
     * @Param pageSize 一页大小 默认10
     * @Return pageInfo 当前一页的数据
     */
    @GetMapping("/userInfo")
    @ResponseBody
    public PageInfo<User> userInfo (@RequestParam(value = "page", defaultValue = "1")
                                        int page, @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        PageHelper.startPage(page, pageSize);
        List<User> list = userService.getAllUser();
        PageInfo<User> pageInfo = new PageInfo<>(list);

        return pageInfo;
    }

    /*
     * 设备信息表格控制器
     * @Param page 当前页数 默认1
     * @Param pageSize 一页大小 默认10
     * @Return pageInfo 当前一页的数据
     */
    @GetMapping("/toolInfo")
    @ResponseBody
    public PageInfo<Tool> toolInfo (@RequestParam(value = "page", defaultValue = "1")
                                            int page, @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        PageHelper.startPage(page, pageSize);
        List<Tool> list = toolService.getAllResidueTool();
        PageInfo<Tool> pageInfo = new PageInfo<>(list);

        return pageInfo;
    }

    /*
     * 设备历史记录表格控制器
     * @Param page 当前页数 默认1
     * @Param pageSize 一页大小 默认10
     * @Return pageInfo 当前一页的数据
     */
    @GetMapping("/toolRecord")
    @ResponseBody
    public PageInfo<toolRecord> toolRecord (@RequestParam(value = "page", defaultValue = "1")
                                            int page, @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        PageHelper.startPage(page, pageSize);
        List<toolRecord> list = toolService.getAllRecord();
        PageInfo<toolRecord> pageInfo = new PageInfo<>(list);

        return pageInfo;
    }


    /*
     * 道路信息表格控制器
     * @Param page 当前页数 默认1
     * @Param pageSize 一页大小 默认10
     * @Return pageInfo 当前一页的数据
     */
    @GetMapping("/roadInfo")
    @ResponseBody
    public PageInfo<Road> roadInfo (@RequestParam(value = "page", defaultValue = "1")
                                            int page, @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        PageHelper.startPage(page, pageSize);
        List<Road> list = roadService.getAllRoad();
        PageInfo<Road> pageInfo = new PageInfo<>(list);

        return pageInfo;
    }


    /*
     * 项目信息表格控制器
     * @Param page 当前页数 默认1
     * @Param pageSize 一页大小 默认10
     * @Return pageInfo 当前一页的数据
     */
    @GetMapping("/planInfo")
    @ResponseBody
    public PageInfo<Plan> planInfo (@RequestParam(value = "page", defaultValue = "1")
                                            int page, @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        PageHelper.startPage(page, pageSize);
        List<Plan> list = planService.getAllPlan();
        PageInfo<Plan> pageInfo = new PageInfo<>(list);

        return pageInfo;
    }

    /* 更具项目类型获取对应的用户号列表 */
    @GetMapping("/userList")
    @ResponseBody
    public List<User> userList (String type) {
        if (type == "勘察") type="资料人员";
        else  type="维护人员";

        return userService.getUserList(type);
    }

    /* 获取剩余设备列表 */
    @GetMapping("/toolList")
    @ResponseBody
    public List<toolRecord> toolList () {
        List<toolRecord> list = toolService.getAllRecord();

        return list;
    }

    /* 获取未分配道路列表 */
    @GetMapping("/roadList")
    @ResponseBody
    public List<Road> roadList () {
        List<Road> list = roadService.getRoadList();

        return list;
    }

    /* 查看用户详细信息 */
    @GetMapping("/userDetial")
    public String userDetial (Model model, String u_id) {
        User user = userService.getUser(u_id);
        model.addAttribute("user", user);

        return "/admin/user";
    }

    /* 修改用户信息 */
    @PostMapping("/userAlter")
    public String userAlter (Model model, User user) {
        if (userService.alterUser(user)) {
            model.addAttribute("msg", "修改成功");
        }else {
            model.addAttribute("msg", "出现错误，修改失败 ");
        }
        model.addAttribute("next","/admin/userDetial?u_id=" + user.getU_id());
        return "/message";
    }


    /* 添加用户控制器 */
    @PostMapping("/addUser")
    public String addUser (User user, Model model) {
        try {
            if(userService.addUser(user)) {
                model.addAttribute("msg", "添加成功");
                model.addAttribute("next","/admin/totable?table_type=user");
            }else {
                model.addAttribute("msg", "添加失败");
                model.addAttribute("next","/admin/toAddUser");
            }
        }catch (Exception e) {
            model.addAttribute("msg", "添加失败:");
            model.addAttribute("next","/admin/toAddUser");
        }

        return "/message";
    }

    /* 查看道路详细信息 */
    @GetMapping("/roadDetial")
    public String roadDetial (Model model, String r_id) {
        Road road = roadService.getRoad(r_id);
        model.addAttribute("road", road);

        return "/admin/road";
    }

    /* 修改道路信息 */
    @PostMapping("/roadAlter")
    public String roadAlter (Model model, Road road) {
        if (roadService.alterRoad(road)) {
            model.addAttribute("msg", "修改成功");
        }else {
            model.addAttribute("msg", "出现错误，修改失败 ");
        }
        model.addAttribute("next","/admin/roadDetial?r_id=" + road.getR_id());
        return "/message";
    }

    /* 删除数据控制器 */
    @PostMapping("/deleteData")
    @ResponseBody
    public Boolean delete (@RequestParam("idList[]") List<String> list, String type) {
        Boolean success = false;
        switch (type) {
            case "user": success = userService.deleteUser(list);break;
            case "tool": success = toolService.deleteTool(list);break;
            case "plan": success = planService.deletePlan(list);break;
            case "road": success = roadService.deleteRoad(list);break;
        }

        return success;
    }

    /* 个人信息控制器 */
    @GetMapping("/person")
    public String person (Model model, HttpSession session) {
        String u_id = session.getAttribute("user_id").toString();//从session中提取登录用户Id
        User user = userService.getUser(u_id);

        model.addAttribute("user",user);

        return "/admin/person";
    }

    /* 修改密码控制器 */
    @PostMapping("/password")
    @ResponseBody
    public Map<String, Object> password (String originPwd, String pwd, HttpSession session) {
        String u_id = session.getAttribute("user_id").toString();//获取登录ID
        Map<String, Object> result = new HashMap<String, Object>();//存放结果
        User user = userService.getUser(u_id);

        if (!user.getU_pwd().equals(originPwd)){//验证原密码是否正确
            result.put("msg", "原密码错误");
        }else {
            user.setU_pwd(pwd);
            if(userService.alterUser(user)) {
                result.put("msg", "修改成功");
            }else {
                result.put("msg", "发生未知错误，修改失败");
            }
        }

        return result;
    }

    /* 还原密码控制器 */
    @PostMapping("/restore")
    @ResponseBody
    public Map<String, Object> restore (String u_id) {
        Map<String, Object> result = new HashMap<String, Object>();
        User user = new User();
        user.setU_id(u_id);
        user.setU_pwd("123456");

        if(userService.alterUser(user)) {
            result.put("msg", "还原成功");
        }else {
            result.put("msg", "发生未知错误，还原失败");
        }

        return result;
    }

    /* 修改个人资料控制器 */
    @PostMapping("/detial")
    @ResponseBody
    public Map<String, Object> detial (User user) {
        Map<String, Object> result = new HashMap<String, Object>();//存放结果
        User phone = new User();//单独存放电话号码
        phone.setU_phone(user.getU_phone());
        //判断电话号码是否已经存在
//        if(userService.findUser(phone) != null) {
//            result.put("success", false);
//            result.put("msg", "该联系方式已经存在");
//        }
        //修改资料
        if(!userService.alterUser(user)) {
            result.put("success", false);
            result.put("msg", "发生未知错误，修改失败");
        }else {
            result.put("success", true);
            result.put("msg", "修改成功");
        }

        return result;
    }

    /* 添加新计划 */
    @PostMapping("/addPlan")
    @ResponseBody
    public Map<String, Object> addPlan (@RequestParam("userList") String userList,
                                        @RequestParam("toolList") String toolList,
                                         String r_id, String p_type, String p_note,
                                        HttpSession session) {

        List<PlanUser> userListes = JSON.parseObject(userList, new TypeReference<List<PlanUser>>(){});
        List<toolRecord> toolRecords = JSON.parseObject(toolList, new TypeReference<List<toolRecord>>(){});

        Date dNow = new Date( );
        SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
        Map<String, Object> result = new HashMap<>();//存放返回信息

        //创建计划
        Plan plan = new Plan();
        plan.setP_type(p_type);
        plan.setP_note(p_note);
        plan.setU_id(session.getAttribute("user_id").toString());
        plan.setP_date(ft.format(dNow));
        if (r_id != "") {
            plan.setR_id(r_id);
        }
        plan.setP_state("未施工");
        if (planService.insertPlan(plan) <= 0) {
            result.put("success",false);
            result.put("msg", "计划添加出现错误，添加失败");
            return result;
        }

        //获取新添加计划的ID
        int p_id = planService.getFinalId();

        //添加计划与人员联系表
        List<PlanUser> planUsers = new ArrayList<>();
        for (PlanUser planUser: userListes) {
            planUser.setP_id(String.valueOf(p_id));

            planUsers.add(planUser);
        }
        if (planService.insertPlanUser(planUsers) <= 0) {
            result.put("success",false);
            result.put("msg", "计划与人员联系表添加出现错误，添加失败");
            return result;
        }



        //添加设备分配记录
        List<toolRecord> records = new ArrayList<>();
        for (toolRecord record: toolRecords) {
            if (record.getT_id() == null) {continue;}
            Tool tool = toolService.getTool(record.getT_id());
           record.setW_id(tool.getW_id());
            record.setP_id(String.valueOf(p_id));
            record.setU_id(session.getAttribute("user_id").toString());
            record.setTr_date(ft.format(dNow));
            record.setTr_type("分配");

            records.add(record);
        }
        if (records.size() > 0){
            if(toolService.insertToolRecordList(records) <= 0) {
                result.put("success", false);
                result.put("msg", "设备分配记录添加出现错误，添加失败");
                return result;
            }
        }

        result.put("success",true);
        return result;
    }

}
