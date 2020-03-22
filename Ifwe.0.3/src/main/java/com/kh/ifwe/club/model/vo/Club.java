package com.kh.ifwe.club.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Club implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int clubCode;
	private int clubMaster;  //회원코드
	private String clubTitle;
	private String clubImgOri;
	private String clubImgRe;
	private int clubCurrent;
	private int clubMax;
	private Date clubDate;
	private String clubContent;
	private String premiumCode;
	private String clubCatecode; //대분류카테코드
	private String clubLocation;
	private String[] cateCode;  //컨텐츠카테코드
	
	
	
	
	
	
	
}
