package com.kh.ifwe.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString

public class Message implements Serializable {

	/**
	 * 
	 * msg_code 	NUMBER		NOT NULL,
	 member_code 	NUMBER		NOT NULL,
	 msg_cate_code 	CHAR(10)		NOT NULL,  --소모임가입메세지:c1
	 msg_content 	VARCHAR2(300)		NULL,
	 msg_date 	DATE		default sysdate,
	 msg_view 	CHAR(1)		default 'n' ,
	 member_from 	NUMBER		NOT NULL,
     club_code number ,
	 */
	
	private static final long serialVersionUID = 1L;
	private int msgCode;
	private int memberCode;
	private String msgCateCode;
	private String msgContent;
	private Date msgDate;
	private String msgView;
	private int memberFrom;
	private int clubCode;
	private String memberName;
	private String memberId;
	
	
	
	

}
