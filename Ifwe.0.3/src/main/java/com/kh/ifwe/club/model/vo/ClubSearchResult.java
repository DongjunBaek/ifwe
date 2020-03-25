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
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ClubSearchResult extends ClubMaster implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String clubCate;

	public ClubSearchResult(int clubCode, int clubMaster, String clubTitle, String clubImgOri, String clubImgRe,
			int clubCurrent, int clubMax, Date clubDate, String clubContent, String premiumCode, String clubCatecode,
			String clubLocation, String[] cateCode, String memberName) {
		super(clubCode, clubMaster, clubTitle, clubImgOri, clubImgRe, clubCurrent, clubMax, clubDate, clubContent, premiumCode,
				clubCatecode, clubLocation, cateCode, memberName);
		this.clubCate = clubCate;
	}

}
