package com.ifwe.test;

public class myTest {
	private int myTestNo;
	private String myTestComment;
	public myTest() {
		super();
	}
	public myTest(int myTestNo, String myTestComment) {
		super();
		this.myTestNo = myTestNo;
		this.myTestComment = myTestComment;
	}
	public int getMyTestNo() {
		return myTestNo;
	}
	public void setMyTestNo(int myTestNo) {
		this.myTestNo = myTestNo;
	}
	public String getMyTestComment() {
		return myTestComment;
	}
	public void setMyTestComment(String myTestComment) {
		this.myTestComment = myTestComment;
	}
	public void showMyTest() {
		myTestNo = 1;
		myTestComment = "3월 11일";
		System.out.println(myTestNo);
		System.out.println(myTestComment);
	}
	//작업1
}
