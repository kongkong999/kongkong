package com.buba.bgs.controller;

import com.buba.bgs.bean.Attachment;
import com.buba.bgs.service.AttachmentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * @program: wineparty
 * @description:
 * @author: 孔祥鹏
 * @create: 2019-09-03 10:55
 **/
@RequestMapping("atta")
@Controller
public class AttachmentController {
    @Resource
    private AttachmentService attachmentService;

    @RequestMapping("addlist")
    @ResponseBody
    public int addList(Attachment attachments, @RequestParam("files")MultipartFile[] files, int itemId)throws Exception {
        List<Attachment> list = new ArrayList<Attachment>();
        for (int i = 0; i < files.length; i++) {

            String newName=UUID.randomUUID().toString().toUpperCase().replace("-", "");

            //后缀
            String oldName=files[i].getOriginalFilename();
            String imgSuffix=oldName.substring(oldName.lastIndexOf("."));

            //上传
            files[i].transferTo(new File("D:\\image\\"+newName+imgSuffix));

            //设置到实体类,保存到数据库
            attachments.setFileextensions(imgSuffix);
            attachments.setItemId(itemId);
            attachments.setSize(files[i].getSize());
            attachments.setUrl(newName+imgSuffix);
            list.add(attachments);
        }
        int addList = attachmentService.addList(list);

        return addList;

    }
}

