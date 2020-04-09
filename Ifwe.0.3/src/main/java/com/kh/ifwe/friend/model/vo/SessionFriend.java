package com.kh.ifwe.friend.model.vo;

import java.io.Serializable;

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
public class SessionFriend extends Friend implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private String profileImgRe;
	
	public SessionFriend(int memberCode, String memberId, String memberPname, int friendCode, String profileImgRe) {
		super(memberCode, memberId, memberPname, friendCode);
		this.profileImgRe = profileImgRe;
	}
	
	
}
