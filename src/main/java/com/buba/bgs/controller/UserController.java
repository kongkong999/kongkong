package com.buba.bgs.controller;

import com.buba.bgs.bean.User;
import com.buba.bgs.service.UserService;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;


/**
 * @program: wineparty
 * @description:
 * @author: 孔祥鹏
 * @create: 2019-08-28 21:06
 **/
@Controller
@RequestMapping("user")
public class UserController {
    @Resource
    private UserService userService;

    @RequestMapping("login")
    @ResponseBody
    public User login(HttpSession session, String usercode, String password){
        User user = userService.login(usercode,password);

        if (user!=null){
            session.setAttribute("user",user);
            return user;
        }else{
            return null;
        }
    }

    @RequestMapping("findUser")
    @ResponseBody
    public List<User> findUser(String deptId){
        System.out.println("11111111111111111111111111111111111111");
        List<User> user =userService.findUser(Integer.valueOf(deptId));

        System.out.println("user123"+user);
        return user;
    }
}

