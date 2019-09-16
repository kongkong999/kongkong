package com.buba.bgs.service.impl;

import com.buba.bgs.bean.Area;
import com.buba.bgs.bean.Dept;
import com.buba.bgs.dao.AreaMapper;
import com.buba.bgs.service.AreaService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @program: wineparty
 * @description:
 * @author: 孔祥鹏
 * @create: 2019-09-04 14:40
 **/
@Service
public class AreaServiceImpl implements AreaService {
    @Resource
    private AreaMapper areaMapper;

    @Override
    public List<Dept> getQuyu1(int areaId) {
        return areaMapper.getQuyu1(areaId);
    }

    @Override
    public List<Area> getQuyu() {
        return areaMapper.getQuyu();
    }

    @Override
    public int updaArea(int id, String name) {
        return areaMapper.updaArea(id,name);
    }

    @Override
    public int updaDept(int id, String name) {
        return areaMapper.updaDept(id,name);
    }

    @Override
    public int addArea(Area area) {
        return areaMapper.addArea(area);
    }

    @Override
    public int addDept(Dept dept) {
        return areaMapper.addDept(dept);
    }

    @Override
    public int delDept(int id) {
        return areaMapper.delDept(id);
    }
}

