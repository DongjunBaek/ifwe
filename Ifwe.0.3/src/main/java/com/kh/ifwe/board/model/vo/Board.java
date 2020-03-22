package com.kh.ifwe.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * 0321 insert board 
 * 게시판 객체 클래스 작성. 
 * @author dongjun
 *
 */


@ToString
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class Board {
	
	private int boardNo;
	private int memberCode;
	private String boardCate;
	private String boardTitle;
	private String boardContent;
	private String boardImgOri;
	private String boardImgRe;
	private Date boardDate;
	private int boardReadcount;
	private int boardLevel;
	private char boardDel;	
	
}
