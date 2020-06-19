package com.gemini.design.rmms.controller;

import com.gemini.design.rmms.entity.User;
import com.gemini.design.rmms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;


/*
 * 登录控制器
 * @Author Gemini
 * @Time 2020.05.18
 */
@Controller
@RequestMapping(value = {"/", "", "/user"})
public class LoginController {
    @Autowired
    private UserService userService;

    /* 默认跳转到登录界面 */
    @GetMapping
    public String toLogin() { return "login";}


    /*
     * 登录
     * @Param username 从表单获取的用户ID或者电话号码
     * @Param password 登录密码
     */
    @PostMapping("/login.do")
    public String login(String username, String password,
                        Model model, HttpSession session) {

        /* 第一次，检测用户是否存在 */
        User user = new User();
        user.setU_id(username);

        if (userService.findUser(user) == null) {
            model.addAttribute("msg", "用户不存在");
            return "login";
        }

        /* 第二次，检测密码是否正确 */
        user.setU_pwd(password);
        if(userService.findUser(user) == null) {
            model.addAttribute("msg","密码错误");
            return "login";
        }

        user = userService.findUser(user);
        /* 登录成功 保存用户信息 跳转对应页面 */
        session.setAttribute("user_name",user.getU_name());
        session.setAttribute("user_id", user.getU_id());
        session.setAttribute("user_type",user.getU_type());

        if (user.getU_type().equals("管理员")) {//管理员跳转
            return "admin/admin";
        }


        return "index/index";
    }

    /* 注销 */
    @GetMapping("/login.out")
    public String loginOut(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }
}
