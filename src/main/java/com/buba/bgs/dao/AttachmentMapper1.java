package com.buba.bgs.dao;

import com.buba.bgs.bean.Attachment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @program: wineparty
 * @description:
 * @author: 孔祥鹏
 * @create: 2019-09-03 10:42
 **/
public interface AttachmentMapper1 {
    int addList(@Param("attachment") List<Attachment> attachment);

}
