package com.kh.ifwe.admin.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * @2020-03-30
 * adminEvent vo 생성
 * 관리자 이벤트 테이블
 * 장여주
 * 
 */
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class AdminEvent {

	private int eventNo;
	private String eventTitle;
	private String eventContent;
	private Date eventStart;
	private Date eventEnd;
	private String eventPic;
	private String eventPid;
	
}
