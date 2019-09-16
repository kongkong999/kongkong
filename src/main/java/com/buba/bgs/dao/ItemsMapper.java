package com.buba.bgs.dao;

import com.buba.bgs.bean.Items;
import org.apache.ibatis.annotations.Param;


import java.util.List;

/**
 * @program: wineparty
 * @description:
 * @author: 孔祥鹏
 * @create: 2019-08-30 09:23
 **/
public interface ItemsMapper {
   List<Items> finditems(@Param("begin")String begin,@Param("end")String end);
   int addItems(Items items);

}
