package com.kh.ifwe.member.model.vo;

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

public class MsgPro extends Message implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String profileImgRe;

	public MsgPro(int msgCode, int memberCode, String msgCateCode, String msgContent, Date msgDate, String msgView,
			int memberFrom, int clubCode, String memberName, String memberId) {
		super(msgCode, memberCode, msgCateCode, msgContent, msgDate, msgView, memberFrom, clubCode, memberName, memberId);
		this.profileImgRe = profileImgRe;
	}
	
}
