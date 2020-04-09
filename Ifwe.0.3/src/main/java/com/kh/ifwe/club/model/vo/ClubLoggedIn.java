package com.kh.ifwe.club.model.vo;

import java.io.Serializable;
import java.sql.Date;

import com.kh.ifwe.member.model.vo.MemberLoggedIn;

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
public class ClubLoggedIn extends MemberLoggedIn implements Serializable {

	
	private static final long serialVersionUID = 1L;
	
	private String clubGrade;
	private Date clubEnrolldate;
	
	
	public ClubLoggedIn(int memberCode, String memberId, String memberPwd, String memberName, String memberPhone,
			String memberLoc, String memberEmail, Date memberBirth, String memberGender, String memberAddr,
			Date memberEnrolldate, String memberSuspension, String memberRole, int memberMsg, String memberLike,
			String profileName, String profileImgRe, String clubGrade, Date clubEnrolldate) {
		super(memberCode, memberId, memberPwd, memberName, memberPhone, memberLoc, memberEmail, memberBirth,
				memberGender, memberAddr, memberEnrolldate, memberSuspension, memberRole, memberMsg, memberLike,
				profileName, profileImgRe);
		this.clubGrade = clubGrade;
		this.clubEnrolldate = clubEnrolldate;
	}
	
	
	
	
}
