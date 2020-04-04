package com.kh.ifwe.mian.model.vo;

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
@ToString(callSuper = true)
public class SearchKeyword implements Serializable {

	
	private static final long serialVersionUID = 1L;
	
	private int searchCode;
	private String searchKeyword;
	private Date searchDate;
	private int memberCode;
	private int RANK;

	
}
