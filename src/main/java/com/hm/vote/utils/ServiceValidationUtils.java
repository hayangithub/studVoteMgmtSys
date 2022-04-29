package com.hm.vote.utils;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.util.StringUtils;

public class ServiceValidationUtils extends StringUtils {

	
	 public static String returnEmptyIfNull(String str) {
	        if (str == null) return "";
	        return str;
	    }
	    public static boolean isEmptyStringTrim(String str) {
	        if (str == null) return true;
	        else if ("".equals(str.trim())) return true;
	        return false;
	    }
	    public static boolean isEmptyInteger(Integer str) {
	        if (str == null) return true;
	        else 
	        return false;
	    }
	    
	    public static boolean isEmptyBigDecimal(BigDecimal str) {
	        if (str == null) return true;
	        else 
	        return false;
	    }
	    
	    public static boolean isEmptyLong(Long str) {
	        if (str == null) return true;
	        else 
	        return false;
	    }
	    
	    public static boolean isEmptyDate(Date date) {
	        if (date == null) return true;
	        else 
	        return false;
	    }
}
