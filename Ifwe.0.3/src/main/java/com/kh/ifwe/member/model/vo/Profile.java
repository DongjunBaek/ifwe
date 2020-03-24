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
@ToString
public class Profile implements Serializable {

	private int memberCode;
	private String profileName;
	private String profileImgOri;
	private String profileImgRe;
	private String profileComment;
	private int profileAge;
	private String profileGender;
	private String[] contentsCateCodes;
}
