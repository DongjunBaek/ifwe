package com.kh.ifwe.clubBoard.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor

public class BoardImg implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int boardNo;
	private String imgOri;
	private String imgRe;
	
	
	
}
