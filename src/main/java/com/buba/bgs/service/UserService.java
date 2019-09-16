package com.buba.bgs.service;

import com.buba.bgs.bean.User;

import java.util.List;

/**
 * @program: wineparty
 * @description:
 * @author: 孔祥鹏
 * @create: 2019-08-28 21:02
 **/
public interface UserService {
    User login(String usercode,String password);

    List<User> findUser(int deptId);
}
