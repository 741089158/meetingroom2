package com.bcsd.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateChange {
    public static String getTime(String date,String time) throws ParseException {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date parse = sdf.parse(date);
        long times = parse.getTime();
        int min=Integer.parseInt(time.substring(0,2));
        int ms=Integer.parseInt(time.substring(3,5));
        times=times+min*60*60*1000+ms*60*1000;
        String newTime=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(times) ;
        return newTime;
    }
}
