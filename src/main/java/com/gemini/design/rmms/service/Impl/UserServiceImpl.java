package com.gemini.design.rmms.service.Impl;

import com.gemini.design.rmms.entity.User;
import com.gemini.design.rmms.mapper.UserMapper;
import com.gemini.design.rmms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

    @Service("userService")
    public class UserServiceImpl implements UserService {
        @Autowired
        private UserMapper mapper;

        /* 登录使用，根据id和电话号码查找 */
        @Override
        public User findUser(User user) {
            User userTmp = mapper.findUser(user);
            if (userTmp == null) {
                //当userid查找不到时，切换为电话号码查询
                user.exchangPhoneAdndId();
                userTmp = mapper.findUser(user);
            }

            return userTmp;
        }

        /* 根据联系方式查找用户 */
        @Override
        public User findUserForPhone(String u_phone) {
            return mapper.findUserForPhone(u_phone);
        }

    /* 返回所有用户 联系方式、职位、姓名 */
    @Override
    public List<User> getAllPhone() {
        List<User> list = mapper.getAllUser();

        //提取 联系方式、职位、姓名
        List<User> users = new ArrayList<User>();
        for (User item : list) {
            User user = new User();

            user.setU_name(item.getU_name());//姓名
            user.setU_class(item.getU_class());//职位
            user.setU_phone(item.getU_phone());//联系方式

            users.add(user);
        }

        return users;
    }

    /* 根据用户ID获取该用户信息 */
    @Override
    public User getUser(String u_id) {
        User user = mapper.getUser(u_id);

        return user;
    }

    /* 修改用户的信息 */
    @Override
    public Boolean alterUser(User user) {
        if (mapper.alterUser(user) > 0) {
            return true;
        }

        return false;
    }

    /* 获取所有用户信息 */
    @Override
    public List<User> getAllUser() {
        return mapper.getAllUser();
    }

    /* 添加用户 */
    @Override
    public Boolean addUser(User user) {
        if (mapper.insertUser(user) > 0) {
            return true;
        }
        return false;
    }

    /* 删除列表内ID的信息 */
    @Override
    public Boolean deleteUser(List list) {
        if (mapper.deleteUser(list) > 0) {
            return true;
        }

        return false;
    }

    /* 根据项目类型获取对应的用户列表 */
    @Override
    public List<User> getUserList(String type) {
        return mapper.getUserList(type);
    }

}
