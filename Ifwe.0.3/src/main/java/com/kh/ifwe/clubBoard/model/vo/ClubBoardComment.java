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
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ClubBoardComment implements Serializable {

	private static final long serialVersionUID = 1L;

	private int comentNo;
	private int boardRef;
	private int memberCode;
	private String commentContent;
	private Date commentDate;
	private String commentDel;
	private String commentReport;
	private String profileName;
	private String profileImgRe;
	
	
	
}
