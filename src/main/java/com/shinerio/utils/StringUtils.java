package com.shinerio.utils;

/**
 * Created by jstxzhangrui on 2016/12/22.
 */
public class StringUtils {
    public static boolean isEmpty(String s){
        if(s==null) {
            return true;
        }else if("".equals(s)){
            return true;
        }
        return false;
    }
}
