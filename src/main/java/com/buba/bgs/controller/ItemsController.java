package com.buba.bgs.controller;

import com.buba.bgs.bean.Items;
import com.buba.bgs.bean.User;
import com.buba.bgs.service.ItemsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @program: wineparty
 * @description:
 * @author: 孔祥鹏
 * @create: 2019-08-30 09:37
 **/
@Controller
@RequestMapping("items")
public class ItemsController {
    @Resource
    private ItemsService itemsService;

    @RequestMapping("finditems")
    @ResponseBody
    public List<Items> findItems(String begin, String end){
        if(begin==null){
            begin="2019-01-01";
        }
        if(end==null){
            end="2019-12-31";
        }
        System.out.println(begin+"and"+end);
        List<Items> itemsList =  itemsService.finditems(begin,end);
        return itemsList;
    }

    @RequestMapping("additems")
    @ResponseBody
    public int addItems(HttpSession session,Items items){

        User user = (User) session.getAttribute("user");
        items.setDeptId(user.getDeptId());
        items.setUserCode(user.getUsercode());
        items.setAreaId(user.getAreaId());
        items.setAreaCode(user.getAreaCode());
        items.setUserId(user.getId());


        int b = itemsService.addItems(items);
        System.out.println("11111111111111111111111111111111111");
        int id = items.getId();
        System.out.println(id);
        session.setAttribute("itemId",id);
        return b;
    }
}

