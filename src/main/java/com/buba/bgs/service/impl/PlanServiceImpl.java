package com.buba.bgs.service.impl;

import com.buba.bgs.bean.Plan;
import com.buba.bgs.dao.PlanMapper;
import com.buba.bgs.service.PlanService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @program: wineparty
 * @description:
 * @author: 孔祥鹏
 * @create: 2019-08-29 17:12
 **/
@Service
public class PlanServiceImpl implements PlanService{
    @Resource
    private PlanMapper planMapper;

    @Override
    public List<Plan> allplan() {
        return planMapper.allplan();
    }

    @Override
    public int addPlan(Plan plan) {
        return planMapper.addPlan(plan);
    }

    @Override
    public Plan findoneplan(int id) {
        return planMapper.findoneplan(id);
    }

    @Override
    public int updaplan(int id) {
        return planMapper.updaplan(id);
    }
}

