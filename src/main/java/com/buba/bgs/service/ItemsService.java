package com.buba.bgs.service;

import com.buba.bgs.bean.Items;

import java.util.List;

/**
 * @program: wineparty
 * @description:
 * @author: 孔祥鹏
 * @create: 2019-08-30 09:35
 **/
public interface ItemsService {
    List<Items> finditems(String begin, String end);
    int addItems(Items items);
}

