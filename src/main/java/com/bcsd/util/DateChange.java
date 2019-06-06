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


    /**
     *
     * @param time  格式  HH:mm
     * @return
     * @throws ParseException
     */
    public static int changeTime(String time) throws ParseException {
        String[] split = time.split(":");
        int i = Integer.parseInt(split[0]) * 60 * 60 * 1000 + Integer.parseInt(split[1]) * 60 * 1000;
        return i;
    }

    //日期转换成字符串
    public static String date2String(Date date, String patt) {
        SimpleDateFormat sdf = new SimpleDateFormat(patt);
        String format = sdf.format(date);
        return format;
    }

    //字符串转换成日期
    public static Date string2Date(String str, String patt) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat(patt);
        Date parse = sdf.parse(str);
        return parse;
    }
}
