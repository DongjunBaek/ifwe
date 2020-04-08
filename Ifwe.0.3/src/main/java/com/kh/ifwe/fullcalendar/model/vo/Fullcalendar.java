package com.kh.ifwe.fullcalendar.model.vo;



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
public class Fullcalendar implements Serializable {


	private static final long serialVersionUID = 1L;
	
	String fullId;
	String title;
	String   fullStart;
	String   fullEnd;
	String fullDescription;
	String fullType;
	String FullUsername;
	String fullBackgroundColor;
	String fullTextColor;
	String fullAllDay;
	String fullNo;
	int clubCode;
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
