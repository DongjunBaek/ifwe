package com.kh.ifwe.scheduler.model.vo;

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
public class LoginRecord {

	private int memberCode;
	private String loginrecordLastlogin;
	private String loginrecordLogout;
}
