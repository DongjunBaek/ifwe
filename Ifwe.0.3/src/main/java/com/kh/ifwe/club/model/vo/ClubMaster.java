package com.kh.ifwe.club.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor

public class ClubMaster extends Club implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String memberId;
	
	
	public ClubMaster(int clubCode, int clubMaster, String clubTitle, String clubImgOri, String clubImgRe,
					  int clubCurrent, int clubMax, Date clubDate, String clubContent, String premiumCode, 
					  String clubCatecode, String clubLocation, String[] cateCode, String memberName) {
		super(clubCode,clubMaster,clubTitle,clubImgOri,clubImgRe,clubCurrent,clubMax,clubDate,clubContent,premiumCode,clubCatecode,clubLocation,cateCode);
		this.memberId = memberId;
		
		
	}

}
