package com.kh.ifwe.clubBoard.model.vo;

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

public class ClubBoardProfile extends ClubBoard implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String profileName;
	private String profileImgRe;
	public ClubBoardProfile(int boardNo, int clubCode, int memberCode, int clubBoardlistNo, String boardTitle,
			String boardContent, Date boardDate, int boardHeart, String[] boardCateCode, String boardDel,
			String boardReport, String boardImgyn, String boardName, String profileName, String profileImgRe) {
		super(boardNo, clubCode, memberCode, clubBoardlistNo, boardTitle, boardContent, boardDate, boardHeart,
				boardCateCode, boardDel, boardReport, boardImgyn, boardName);
		this.profileName = profileName;
		this.profileImgRe = profileImgRe;
	}

	

}
