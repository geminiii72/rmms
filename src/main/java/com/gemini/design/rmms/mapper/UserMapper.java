package com.gemini.design.rmms.mapper;

import com.gemini.design.rmms.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface UserMapper {

    /*
     * 登录使用
     * 根据id或电话号码查找
     */
    public User findUser(User user);

    /* 根据电话号码查找用户 */
    public User findUserForPhone(String u_phone);

    /*
     * 获取所有人信息
     */
    public List<User> getAllUser();

    /*
     * 根据ID获取单人信息
     */
    public User getUser(@Param("u_id") String u_id);

    /*
     * 更新用户信息
     */
    public int alterUser(User user);

    /*
     * 根据计划ID获取藏于人员
     */
    public List<User> getUserForPlan (String p_id);

    /* 添加用户信息 */
    public int insertUser(User user);


    /* 删除列表内iD的信息 */
    public int deleteUser (List list);

    /* 根据项目类型获取对应的用户列表 */
    public List<User> getUserList(String type);
}
