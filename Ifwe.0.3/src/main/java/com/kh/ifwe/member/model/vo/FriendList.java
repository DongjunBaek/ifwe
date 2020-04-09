package com.kh.ifwe.member.model.vo;

import java.io.Serializable;

import com.kh.ifwe.friend.model.vo.Friend;

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
public class FriendList extends Friend implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String profileImgRe;

	public FriendList(int memberCode, String memberId, String memberPname, int friendCode, String profileImgRe) {
		super(memberCode, memberId, memberPname, friendCode);
		this.profileImgRe = profileImgRe;
	}


		
		
	
	

}
