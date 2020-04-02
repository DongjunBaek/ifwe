package com.kh.ifwe.common.crawling;

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
public class contentsInfo implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private int contentsCode;
	private String contentsName;
	private String contentsInfo;
	private Date contentsDate;
	private String contentsHref;
	private String cateCode;
}
