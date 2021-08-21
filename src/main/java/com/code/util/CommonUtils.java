package com.code.util;

import java.text.SimpleDateFormat;
import java.util.Date;

//自定义开发工具类
public class CommonUtils {

    //判断字符串是否不为空
    public static boolean isNotEmpty(String str) {
        return !(null == str || "".equals(str));
    }

    //判断字符串是否为空
    public static boolean isEmpty(String str) {
        return (null == str || "".equals(str));
    }
    //获取当前系统时间
    public static String getNowDateStr() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date d = new Date();
        String str = sdf.format(d);
        return str;
    }
}
