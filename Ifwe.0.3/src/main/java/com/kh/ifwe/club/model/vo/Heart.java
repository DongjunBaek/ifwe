package com.kh.ifwe.club.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString

public class Heart implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int memberCode;
	private int boardNo;
	private String profileName;
	
	

}
