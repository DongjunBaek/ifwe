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
public class ClubBoard implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int boardNo;
	private int clubCode;
	private int memberCode;
	private int boardlistNo;
	private String boardTitle;
	private String boardContent;
	private Date boardDate;
	private int boardHeart;
	private String[] boardCateCode; 
	private String boardDel;
	private String boardReport;
	private String boardName;
	
	
	
	
	
	

}
