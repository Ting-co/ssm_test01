package com.ssmtest01.util;

import java.util.Date;

public class format {

    public static String format(Date date){
        String dateStr=""+date.getTime();
        return dateStr;
    }

}
