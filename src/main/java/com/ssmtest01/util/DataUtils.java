package com.ssmtest01.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.regex.Pattern;

public class DataUtils {
    public static String getdata() {
        Date date = new Date();
        SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd hh:mm");

        return ft.format(date);
    }

    /*判断是否是整形*/
    public static boolean isInteger(String str) {
        Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");
        return pattern.matcher(str).matches();
    }

    /*获取时间搓*/
    public static Long getdataId() {
        Date date = new Date();
        long time = date.getTime();
        Random r = new Random();
        System.out.println(time);
        Long timeid=  (r.nextInt(800)+time);
        return timeid;
    }
}
