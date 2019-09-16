package com.buba.bgs.dao;

import com.buba.bgs.bean.Area;
import com.buba.bgs.bean.Dept;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @program: wineparty
 * @description:
 * @author: 孔祥鹏
 * @create: 2019-09-04 14:35
 **/
public interface AreaMapper {
    List<Dept> getQuyu1(int areaId);

    List<Area> getQuyu();

    int updaArea(@Param("id")int id,@Param("name")String name);

    int updaDept(@Param("id")int id,@Param("name")String name);

    int addArea(Area area);

    int addDept(Dept dept);

    int delDept(Integer id);


}

