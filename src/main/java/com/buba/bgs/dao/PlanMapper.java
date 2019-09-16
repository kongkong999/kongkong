package com.buba.bgs.dao;

import com.buba.bgs.bean.Plan;

import java.util.List;

/**
 * @program: wineparty
 * @description:
 * @author: 孔祥鹏
 * @create: 2019-08-29 17:10
 **/
public interface PlanMapper {
    List<Plan> allplan();
    int addPlan(Plan plan);
    Plan findoneplan(int id);
    int updaplan(int id);
}
