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


public class Count implements Serializable {


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int clubCode;
	private int maleCount;
	private int age;
	

	public Count(int age,int clubCode) {
		super();
		this.age = age;
		this.clubCode = clubCode;
	}
	

	
}
