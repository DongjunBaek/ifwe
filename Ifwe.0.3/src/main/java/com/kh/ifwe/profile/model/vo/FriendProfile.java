package com.kh.ifwe.profile.model.vo;

import java.io.Serializable;

import com.kh.ifwe.friend.model.vo.Friend;

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
public class FriendProfile extends Friend implements Serializable  {


	private int ProfilememberCode;
	private String profileName;
	private String profileImgOri;
	private String profileImgRe;
	private String profileComment;
	private int profileAge;
	private String profileGender;
	private String[] contentsCateCodes;
	
}
