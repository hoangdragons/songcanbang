package com.dolphin.cmscore.common;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

public class CommonUtil {
	
	public static HashMap<String, Object> getTotalRecordAndListPage(int totalRecord) {
		int totalPage = (totalRecord + CommonConstants.MAX_RECORD_PER_PAGE - 1) / CommonConstants.MAX_RECORD_PER_PAGE; 
		List<Integer> lsPage = new ArrayList<>();
		for (int page = 1; page <= totalPage; page++) {
			lsPage.add(page);
		}
		
		HashMap<String, Object> paging = new HashMap<>();
		paging.put("totalRecord", totalRecord);
		paging.put("listPage", lsPage);
		
		return paging;
	}
	
	public static String getStringFromDate(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:ss");
		return sdf.format(date);
	}
}
