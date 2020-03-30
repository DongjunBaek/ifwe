package com.kh.ifwe.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * @2020-03-28
 * board_comment vo 생성
 * 게시판 댓글 테이블
 * 장여주
 * 
 */
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class BoardComment {
	
	private int commentNo;
	private int memberCode;
	private int boardNo;
	private String commentContent;
	private Date commentDate;
	private int commentLevel;
	private int commnetNoRef;
	
}
