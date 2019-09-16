package com.buba.bgs.service.impl;

import com.buba.bgs.bean.Attachment;
import com.buba.bgs.dao.AttachmentMapper1;
import com.buba.bgs.service.AttachmentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @program: wineparty
 * @description:
 * @author: 孔祥鹏
 * @create: 2019-09-03 10:54
 **/
@Service
public class AttachmentServiceImpl implements AttachmentService {
    @Resource
    private AttachmentMapper1 attachmentMapper;
    @Override
    public int addList(List<Attachment> attachment) {
        return attachmentMapper.addList(attachment);
    }
}

