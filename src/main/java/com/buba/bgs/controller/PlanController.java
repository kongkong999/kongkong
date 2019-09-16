package com.buba.bgs.controller;

import com.buba.bgs.bean.Plan;
import com.buba.bgs.bean.User;
import com.buba.bgs.service.PlanService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;
import java.util.List;

/**
 * @program: wineparty
 * @description:
 * @author: 孔祥鹏
 * @create: 2019-08-29 17:13
 **/
@RequestMapping("plan")
@Controller
public class PlanController {

    @Resource
    private PlanService planService;

    @ResponseBody
    @RequestMapping("allplan")
    public List<Plan> allplan(){

        List<Plan> alplan = planService.allplan();
        return alplan;
    }

    @ResponseBody
    @RequestMapping("addplan")
    public int addplan(Plan plan, HttpSession session){

        User user = (User) session.getAttribute("user");

        plan.setDeptId(user.getDeptId());
        plan.setDeptName(user.getDeptName());
        plan.setAreaCode(user.getAreaCode());
        plan.setAreaId(user.getAreaId());

        int a = planService.addPlan(plan);
        return a;
    }
    @RequestMapping("find")
    public String find(HttpSession session,Integer id){
        session.setAttribute("id",id);
        Plan plan = planService.findoneplan(id);
        String name = plan.getNameActivities();
        session.setAttribute("name",name);
        planService.updaplan(id);
        return "additems2";
    }
}

