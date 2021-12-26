package com.ssmtest01.util;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;

public class UploadUtils {
    //获取target的路径
    private static final String path = UploadUtils.class.getClassLoader().getResource("").getPath();

    //切割路径，从target切，制作成绝对路径
    private static final String BASE_PATH = path.substring(0, path.indexOf("/target/")) + "/src/main/webapp/static/images/headImg/";


    public static String upload(MultipartFile file, HttpServletRequest request) {


        //获得上传文件的名称,并把文件名修改为时间戳.后缀
        String filename = file.getOriginalFilename();
        String prefix = filename.substring(filename.lastIndexOf(".") + 1);
        Date date = new Date();
        String dateStr = "" + date.getTime();
        String newFileName = dateStr + "." + prefix;
        //创建文件实例对象
        File uploadFile = new File(BASE_PATH + newFileName);
        //判断当前文件是否存在
        if (!uploadFile.exists()) {
            //如果不存在就创建一个文件夹
            uploadFile.mkdirs();
        }
        //执行文件上传的命令
        try {
            file.transferTo(uploadFile);
        } catch (IOException e) {
            return null;
        }
        return newFileName;
    }
}
