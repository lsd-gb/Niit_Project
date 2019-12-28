package utils;

import java.util.List;

public class ReturnInfo {
	private int count=0;
	private int code=0;
	private String msg=null	;
	private List list;
	
	public static String getLimit(Integer page,Integer max) {
		if(page==null) return "";
		return " limit "+(page*max)+","+max;
	}

}
