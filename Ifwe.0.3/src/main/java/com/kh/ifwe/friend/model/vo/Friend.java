package com.kh.ifwe.friend.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class Friend {
private int memberCode;
private int friendCode;
private String memberId;
private String memberPname;

}
