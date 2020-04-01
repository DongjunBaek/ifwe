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
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
public class MemberLoggedIn extends Member implements Serializable{
	 
	private static final long serialVersionUID = 1L;
	
	private String profileName;
	private String profileImgRe;
	
	public MemberLoggedIn(int memberCode, String memberId, String memberPwd, String memberName, String memberPhone,
			String memberLoc, String memberEmail, Date memberBirth, String memberGender, String memberAddr,
			Date memberEnrolldate, String memberSuspension, String memberRole, int memberMsg, String memberLike,
			String profileName, String profileImgRe) {
		super(memberCode, memberId, memberPwd, memberName, memberPhone, memberLoc, memberEmail, memberBirth,
				memberGender, memberAddr, memberEnrolldate, memberSuspension, memberRole, memberMsg, memberLike);
		this.profileName = profileName;
		this.profileImgRe = profileImgRe;
	}

	
	
	
	
	
	
}
