package com.kh.ifwe.member.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;


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
public class Member implements Serializable {
	
	private static final long serialVersionUID = 1L;
		
	private int memberCode;
	private String locCode;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String memberPhone;
	private String memberEmail;
	private Date memberBirth;
	private String memberGender;
	private String memberAddr;
	private Date memberEnrolldate;
	private String memberSuspension;
	private String memberRole;
	private int memberMsg;
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}