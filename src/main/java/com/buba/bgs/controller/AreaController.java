package com.buba.bgs.controller;

import com.buba.bgs.bean.Area;
import com.buba.bgs.bean.Dept;
import com.buba.bgs.service.AreaService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * @program: wineparty
 * @description:
 * @author: 孔祥鹏
 * @create: 2019-09-04 14:44
 **/
@RequestMapping("area")
@Controller
public class AreaController {
    @Resource
    private AreaService areaService;

    @ResponseBody
    @RequestMapping("getQuyu1")
    public List<Dept> getQuYu1(int areaId){
        System.out.println(areaId+"pppppppppppppppppppppppppppppppppppppppp");
        return areaService.getQuyu1(areaId);
    }

    @ResponseBody
    @RequestMapping("quyu")
    public List<Area> getquyu(){
        List<Area> list = areaService.getQuyu();
        System.out.println(list+"1211111111");
        return list;
    }

    @RequestMapping("reName")
    @ResponseBody
    public int reName(int id,String name,String type){
        System.out.println("type"+type+name+id);
        if(type.equals("shi")){
            int area =  areaService.updaArea(id,name);
            return area;
        }else{

            int dept =  areaService.updaDept(id,name);
            return dept;
        }

    }

    @RequestMapping("add")
    @ResponseBody
    public int add(int pId,String type,String name,String code){
        if(type=="shi"){
            Area area =new Area();
            area.setAreaCode(code);
            area.setAreaName(name);
            area.setType1("shi");
            area.setIsParent("true");
            area.setpId(pId);
           int a =  areaService.addArea(area);
           return a;
        }else {
            Dept dept = new Dept();
            dept.setDeptName(name);
            dept.setDeptCode(code);
            dept.setAreaId(pId);
            dept.setType("xian");
            dept.setIsParent("false");
            int d = areaService.addDept(dept);
            return d;
        }

    }

    @ResponseBody
    @RequestMapping("del")
    public int del(int id){

        return areaService.delDept(id);
    }
}

