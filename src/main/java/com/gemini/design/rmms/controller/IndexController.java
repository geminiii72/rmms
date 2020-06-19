package com.gemini.design.rmms.controller;

import com.gemini.design.rmms.entity.*;
import com.gemini.design.rmms.mapper.RoadMapper;
import com.gemini.design.rmms.service.PlanService;
import com.gemini.design.rmms.service.RoadService;
import com.gemini.design.rmms.service.ToolService;
import com.gemini.design.rmms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.management.Attribute;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

/*
 * 员工主页控制器
 * @Author Gemini
 * @Time 2020.05.21
 */
@Controller
@RequestMapping(value = "/employ")
public class IndexController {
    @Autowired
    private PlanService planService;
    @Autowired
    private UserService userService;
    @Autowired
    private RoadService roadService;
    @Autowired
    private ToolService toolService;

    @GetMapping
    public String toIndex() {
        return "index/index";
    }
    @GetMapping("plan")
    public String toPlan() {
        return  "index/plan";
    }
    @GetMapping("toAddRoad")
    public String toAddRoad() {return  "index/road";}

    /*
     * AJAX
     * @Return 传回用户的类型
     */
    @GetMapping("userType")
    @ResponseBody
    public String userType(HttpSession session) {
        return session.getAttribute("user_type").toString();
    }

    /*
     * AJAX
     * @Return 传回指定计划的设备数据
     */
    @GetMapping("planTool")
    @ResponseBody
    public List<Tool> planTool (String p_id) {
        List<Tool> list = toolService.getToolListForPlan(p_id);

        return list;
    }

    /*
     * AJAX
     * @Return 传回指定计划的道路数据
     */
    @GetMapping("planRoad")
    @ResponseBody
    public Road planRoad (String r_id) {
        Road road = roadService.getRoad(r_id);
        return road;
    }

    /*
     * AJAX
     * @Return 传回指定计划含有的人员列表
     */
    @GetMapping("planUSer")
    @ResponseBody
    public List<User> planUserInfo(String p_id) {
        List<User> list = planService.getUserInfo(p_id);

        return list;
    }

    /*
     * AJAX
     * @Return 传回指定id的plan
     */
    @GetMapping("planData")
    @ResponseBody
    public Plan planInfo (String p_id) {
        Plan plan = planService.getPlan(p_id);

        return plan;
    }

    /*
     * AJAX
     * @Return 传回planId列表
     */
    @GetMapping("planList")
    @ResponseBody
    public List<String> planList (HttpSession session) {
        String u_id = session.getAttribute("user_id").toString();
        List<String> list = planService.getPlanList(u_id);

        return list;
    }

    /*
     * 初始化员工主页的信息
     * @Param session 提取员工ID
     * @Return 返回参与计划的数据
     */
    @GetMapping("plans")
    @ResponseBody
    public List<Map> intiPlans(HttpSession session){
        String u_id = session.getAttribute("user_id").toString();
        List<Map> plans = planService.findSelfPlans(u_id);//<是否为管理员, 项目>

        return plans;
    }


    /*
     * 通讯录控制器
     * @Return 返回到通讯录视图
     */
    @GetMapping("phone")
    public String phone(Model model) {
        List<User> users = userService.getAllPhone();
        model.addAttribute("users", users);

        return "index/phone";
    }


    /*
     * 个信息控制器
     * @Return 返回到个人信息视图
     */
    @GetMapping("person")
    public String person(Model model, HttpSession session) {
        String u_id = session.getAttribute("user_id").toString();
        User user = userService.getUser(u_id);

        model.addAttribute("user",user);

        return "index/person";
    }

    /*
     * 修改个人信息
     * @Param 从视图表单中读取的User数据
     * @Return 返回修改结果
     */
    @PostMapping("alterPerson")
    @ResponseBody
    public Map alterPerson(User user) throws Exception{
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            if (userService.alterUser(user)) {
                result.put("success", true);
                result.put("msg", "修改成功");
            }
        }catch (Exception e) {
            result.put("msg", e);
            result.put("success", false);
        }

        return result;
    }

    /* 资料人员添加道路信息 */
    @PostMapping("/addRoad")
    public String addRoad(Road road, HttpSession session, Model model) {
        String u_id = session.getAttribute("user_id").toString();
        road.setU_id(u_id);

        Date dNow = new Date( );
        SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");

        road.setR_date(ft.format(dNow));

        if (roadService.insertRoad(road)) {
            model.addAttribute("msg", "添加成功");
        }else {
            model.addAttribute("msg", "添加失败");
        }
        model.addAttribute("next","/index/index");

        return "/message";
    }


    /* 获取道路信息 */
    @GetMapping("/roadDetial")
    public String roadDetial(String r_id, Model model) {
        Road road = roadService.getRoad(r_id);
        if(road != null) {
            model.addAttribute("road", road);
            return "/index/roadDetial";
        }else {
            model.addAttribute("msg","出现错误，查询失败");
            model.addAttribute("next","/index/plan");
            return "message";
        }
    }
}
