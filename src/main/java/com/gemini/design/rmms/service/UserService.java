package com.gemini.design.rmms.service;

import com.gemini.design.rmms.entity.User;

import java.util.List;

public interface UserService {

    public User findUser(User user);

    public User findUserForPhone(String u_phone);

    public List<User> getAllPhone();

    public User getUser(String u_id);

    public Boolean alterUser(User user);

    public List<User> getAllUser();

    public Boolean addUser(User user);

    public Boolean deleteUser(List list);

    public List<User> getUserList(String type);
}
