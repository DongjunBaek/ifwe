package com.kh.ifwe.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Utils {
	
	public static String getRenamedFileName(String originalFileName) {

		//파일명생성코드
		//기존파일의 확장자
		String ext = "";
		int dotIndex = originalFileName.lastIndexOf(".");
		if(dotIndex > -1) {
			ext = originalFileName.substring(dotIndex);  //.txt
		}
		//새파일명 : yyyyMMdd_HHmmssSSS_rnd.확장자
		String renamedFileName = new SimpleDateFormat("yyyyMMdd_HHmmssSSS")
					.format(new Date())+"_"+(int)(Math.random()*1000)
					+ext;
		
		//새파일객체생성
		return renamedFileName;
		
	}
}
