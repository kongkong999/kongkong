package com.buba.bgs.service.impl;

import com.buba.bgs.bean.Items;
import com.buba.bgs.dao.ItemsMapper;
import com.buba.bgs.service.ItemsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @program: wineparty
 * @description:
 * @author: 孔祥鹏
 * @create: 2019-08-30 09:36
 **/
@Service
public class ItemsServiceImpl implements ItemsService {
    @Resource
    private ItemsMapper itemsMapper;

    @Override
    public List<Items> finditems(String begin, String end) {
        return itemsMapper.finditems(begin,end);
    }

    @Override
    public int addItems(Items items) {
        return itemsMapper.addItems(items);
    }
}

