package com.kh.ifwe.scheduler.model.vo;

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
public class MemberLoginRecord {

	private int memberCode;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String memberPhone;
	private String memberLoc;
	private String memberEmail;
	private Date memberBirth;
	private String memberGender;
	private String memberAddr;
	private Date memberEnrolldate;
	private String memberSuspension;
	private String memberRole;
	private int memberMsg;
	private String memberLike;
	private String loginrecordLastlogin;
	private String loginrecordLogout;
}
