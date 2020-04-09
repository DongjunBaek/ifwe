package com.kh.ifwe.friend.model.vo;

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
public class Friend implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private int memberCode;
	private String memberId;
	private String memberPname;
	private int friendCode;


}
