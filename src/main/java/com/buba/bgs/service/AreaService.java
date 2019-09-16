package com.buba.bgs.service;

import com.buba.bgs.bean.Area;
import com.buba.bgs.bean.Dept;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @program: wineparty
 * @description:
 * @author: 孔祥鹏
 * @create: 2019-09-04 14:40
 **/
public interface AreaService {


    List<Dept> getQuyu1(int areaId);

    List<Area> getQuyu();

    int updaArea(int id,String name);

    int updaDept(int id,String name);

    int addArea(Area area);

    int addDept(Dept dept);

    int delDept(int id);

}
