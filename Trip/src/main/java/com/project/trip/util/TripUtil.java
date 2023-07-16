package com.project.trip.util;

import java.util.Calendar;

public class TripUtil {
	
	// 날짜 받아오기
	private static Calendar cal = Calendar.getInstance();
	
	//오늘날짜를 문자열로 리턴 (여행 시작일)
	public static String getStartDateToString() {
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int date = cal.get(Calendar.DATE);
		
		String strMonth = "";
		if(month / 10 == 0) {
			strMonth = "0" + month;
		}
		else {
			strMonth = "" + month;
		}
		
		String strDate = "";
		if(date / 10 == 0) {
			strDate = "0" + date;
		}
		else {
			strDate = "" + date;
		}
		
		return year + "-" + strMonth + "-" + strDate;
	}
	
	//오늘날짜 + 1일 문자열로 리턴 (여행 끝나는 날)
	public static String getNowDateToString() {
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int date = cal.get(Calendar.DATE);
		
		String strMonth = "";
		if(month / 10 == 0) {
			strMonth = "0" + month;
		}
		else {
			strMonth = "" + month;
		}
		
		
		String strDate = "";
		if(date + 1 / 10 == 0) {
			strDate = "0" + (date + 1);
		}
		else {
			strDate = "" + (date + 1);
		}
		
		
		return year + "-" + strMonth + "-" + strDate;
	}
	
	//오늘 날짜에서 5년전 날짜
		public static String getDefaultDate() {
			int year = cal.get(Calendar.YEAR) - 4;
			int month = cal.get(Calendar.MONTH) + 1;
			int date = cal.get(Calendar.DATE);
			
			String strMonth = "";
			if(month / 10 == 0) {
				strMonth = "0" + month;
			}
			else {
				strMonth = "" + month;
			}
			String strDate = "";
			if(date / 10 == 0) {
				strDate = "0" + date;
			}
			else {
				strDate = "" + date;
			}
			
			return year + "-" + strMonth + "-" + strDate;
		}
	
}
