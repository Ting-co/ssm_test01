package com.ssmtest01.util;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.swing.plaf.synth.SynthOptionPaneUI;
import java.io.File;
import java.io.IOException;
import java.util.Date;

public class UploadUtils {
    //获取target的路径
    private static final String path = UploadUtils.class.getClassLoader().getResource("").getPath();

    //切割路径，从target切，制作成绝对路径
    private static final String BASE_PATH = path.substring(0, path.indexOf("/target/")) + "/src/main/webapp/static/images/headImg/";
    private static final String TARGETBASE_PATH = path.substring(0, path.indexOf("/WEB-INF/"))+"/static/images/headImg/";

    private static final String sBASE_PATH = path.substring(0, path.indexOf("/target/")) + "/src/main/webapp/static/images/commoditys/";
    private static final String sTARGETBASE_PATH = path.substring(0, path.indexOf("/WEB-INF/"))+"/static/images/commoditys/";

    public static String upload(MultipartFile file) {
        System.out.println(path);
        System.out.println(TARGETBASE_PATH);
         /*
         /C:/Users/Administrator/IdeaProjects/ssm_test03/target/ssm_test01/WEB-INF/classes/
        /C:/Users/Administrator/IdeaProjects/ssm_test03/target/ssm_test01/static/images/headImg/
        */




        //获得上传文件的名称,并把文件名修改为时间戳.后缀
        String filename = file.getOriginalFilename();
        String prefix = filename.substring(filename.lastIndexOf(".") + 1);
        Date date = new Date();
        String dateStr = "" + date.getTime();
        String newFileName = dateStr + "." + prefix;
        //创建文件实例对象
        File uploadFile = new File(BASE_PATH + newFileName);
        File uploadFile2 = new File(TARGETBASE_PATH + newFileName);
        //判断当前文件是否存在
        if (!uploadFile.exists()) {
            //如果不存在就创建一个文件夹
            uploadFile.mkdirs();
        }
        //执行文件上传的命令
        try {
            file.transferTo(uploadFile);
            file.transferTo(uploadFile2);
        } catch (IOException e) {
            return null;
        }
        return newFileName;
    }

    public static String supload(MultipartFile file) {

        //获得上传文件的名称,并把文件名修改为时间戳.后缀
        String filename = file.getOriginalFilename();
        String prefix = filename.substring(filename.lastIndexOf(".") + 1);
        Date date = new Date();
        String dateStr = "" + date.getTime();
        String newFileName = dateStr + "." + prefix;
        //创建文件实例对象
        File uploadFile = new File(sBASE_PATH + newFileName);
        File uploadFile2 = new File(sTARGETBASE_PATH + newFileName);
        //判断当前文件是否存在
        if (!uploadFile.exists()) {
            //如果不存在就创建一个文件夹
            uploadFile.mkdirs();
        }
        //执行文件上传的命令
        try {
            file.transferTo(uploadFile);
            file.transferTo(uploadFile2);
        } catch (IOException e) {
            return null;
        }
        return newFileName;
    }

    public static void deleteimage(String delfilename) {

        String delpathStr = sBASE_PATH + delfilename;
        String sdelpathStr = sTARGETBASE_PATH + delfilename;
        //创建文件实例对象


        //判断当前文件是否存在
        if (delpathStr != null && !delpathStr.equals("")){
            File uploadFile = new File(sBASE_PATH + delpathStr);
            System.out.println(uploadFile);
            if (uploadFile.exists()){
                uploadFile.delete();
            }
        }
        if (sdelpathStr != null && !sdelpathStr.equals("")){
            File uploadFile2 = new File(sTARGETBASE_PATH + sdelpathStr);
            System.out.println(uploadFile2);
            if (uploadFile2.exists()){
                uploadFile2.delete();
            }
        }

    }

}
