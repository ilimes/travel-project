package com.project.trip.member.vo;

public class TempMemberVO {
	private String tempNum;
	private String tempName;
	private String tempTell;
	private String tempBirthday;
	private String tempEmail;
	private String tempAddr;
	private String tempAddrDetail;
	private String tempZipcode;
	private String tempGender;
	private String bookNum;
	
	private String[] tempTells;
	private String[] tempEmails;
	
	
	
	public String[] getTempTells() {
		return tempTells;
	}
	public void setTempTells(String[] tempTells) {
		tempTell = tempTells[0] + "-" + tempTells[1] + "-" + tempTells[2];
	}
	public String[] getTempEmails() {
		return tempEmails;
	}
	public void setTempEmails(String[] tempEmails) {
		tempEmail = tempEmails[0] + "@" + tempEmails[1];
	}
	public String getTempNum() {
		return tempNum;
	}
	public void setTempNum(String tempNum) {
		this.tempNum = tempNum;
	}
	public String getTempName() {
		return tempName;
	}
	public void setTempName(String tempName) {
		this.tempName = tempName;
	}
	public String getTempTell() {
		return tempTell;
	}
	public void setTempTell(String tempTell) {
		this.tempTell = tempTell;
	}
	public String getTempBirthday() {
		return tempBirthday;
	}
	public void setTempBirthday(String tempBirthday) {
		this.tempBirthday = tempBirthday;
	}
	public String getTempEmail() {
		return tempEmail;
	}
	public void setTempEmail(String tempEmail) {
		this.tempEmail = tempEmail;
	}
	public String getTempAddr() {
		return tempAddr;
	}
	public void setTempAddr(String tempAddr) {
		this.tempAddr = tempAddr;
	}
	public String getTempAddrDetail() {
		return tempAddrDetail;
	}
	public void setTempAddrDetail(String tempAddrDetail) {
		this.tempAddrDetail = tempAddrDetail;
	}
	public String getTempZipcode() {
		return tempZipcode;
	}
	public void setTempZipcode(String tempZipcode) {
		this.tempZipcode = tempZipcode;
	}
	public String getBookNum() {
		return bookNum;
	}
	public void setBookNum(String bookNum) {
		this.bookNum = bookNum;
	}
	public String getTempGender() {
		return tempGender;
	}
	public void setTempGender(String tempGender) {
		this.tempGender = tempGender;
	}
	
	
	
	
	
}
