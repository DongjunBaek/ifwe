package com.kh.ifwe.fullcalendar.model.vo;



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
public class Fullcalendar {

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
	String clubCode;
}
