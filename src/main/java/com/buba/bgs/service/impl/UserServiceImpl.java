package com.buba.bgs.service.impl;

import com.buba.bgs.bean.User;
import com.buba.bgs.dao.UserMapper;
import com.buba.bgs.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @program: wineparty
 * @description:
 * @author: 孔祥鹏
 * @create: 2019-08-28 21:04
 **/
@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper userMapper;
    @Override
    public User login(String usercode, String password) {
        return userMapper.login(usercode,password);
    }

    @Override
    public List<User> findUser(int deptId) {
        return userMapper.findUser(deptId);
    }
}

