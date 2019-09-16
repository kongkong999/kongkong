package com.buba.bgs.service;

import com.buba.bgs.bean.Plan;

import java.util.List;

/**
 * @program: wineparty
 * @description:
 * @author: 孔祥鹏
 * @create: 2019-08-29 17:11
 **/
public interface PlanService {
    List<Plan> allplan();
    int addPlan(Plan plan);
    Plan findoneplan(int id);
    int updaplan(int id);
}
