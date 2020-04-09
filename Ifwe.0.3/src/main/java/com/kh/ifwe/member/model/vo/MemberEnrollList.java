package com.kh.ifwe.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


/**
 * 
 * @author 장여주
 * 0409 회원 회원가입 날짜/해당 날짜 가입한 수 
 * 관리자 통계 전용 객체 생성
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MemberEnrollList implements Serializable {
	
	private static final long serialVersionUID = 1L;
		
	/*
	 * private int memberCode; private String memberId; private String memberPwd;
	 * private String memberName; private String memberPhone; private String
	 * memberLoc; private String memberEmail; private Date memberBirth; private
	 * String memberGender; private String memberAddr; private Date
	 * memberEnrolldate; private String memberSuspension; private String memberRole;
	 * private int memberMsg; private String memberLike;
	 */
	private int num;

	@JsonFormat(pattern="yyyy-MM-dd")
	private Date Day;
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
