package com.project.trip.member.vo;

import java.util.Arrays;

public class MemberVO {
	private String memId;
	private String memPw;
	private String memName;
	private String memGender;
	private String memTell;
	private String memBirthday;
	private String memAddr;
	private String memRank;
	private String isAdmin;
	private String joinDate;
	private String memZipcode;
	private String memAddrDetail;
	private int memPoint;
	private String isDeactivate;
	private String[] memIdArr;
	
	private String[] memTells;
	private String[] memIds;
	
	//회원 상세조회 쿼리용
	private int buyCnt; // 구매횟수
	private int totalPrice; // 총 구매금액
	
	
	public String[] getMemIdArr() {
		return memIdArr;
	}
	public void setMemIdArr(String[] memIdArr) {
		this.memIdArr = memIdArr;
	}
	public int getMemPoint() {
		return memPoint;
	}
	public void setMemPoint(int memPoint) {
		this.memPoint = memPoint;
	}
	public int getBuyCnt() {
		return buyCnt;
	}
	public void setBuyCnt(int buyCnt) {
		this.buyCnt = buyCnt;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	public String getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	public String getMemBirthday() {
		return memBirthday;
	}
	public void setMemBirthday(String memBirthday) {
		this.memBirthday = memBirthday;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPw() {
		return memPw;
	}
	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemGender() {
		return memGender;
	}
	public void setMemGender(String memGender) {
		this.memGender = memGender;
	}
	public String getMemTell() {
		return memTell;
	}
	public void setMemTell(String memTell) {
		this.memTell = memTell;
	}
	public String getMemAddr() {
		return memAddr;
	}
	public void setMemAddr(String memAddr) {
		this.memAddr = memAddr;
	}
	public String getMemRank() {
		return memRank;
	}
	public void setMemRank(String memRank) {
		this.memRank = memRank;
	}
	public String getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}
	public String[] getMemTells() {
		return memTells;
	}
	public void setMemTells(String[] memTells) {
		memTell = memTells[0] + "-" + memTells[1] + "-" + memTells[2];
	}
	public String[] getMemIds() {
		return memIds;
	}
	public void setMemIds(String[] memIds) {
		memId = memIds[0] + "@" + memIds[1];
	}
	public String getMemZipcode() {
		return memZipcode;
	}
	public void setMemZipcode(String memZipcode) {
		this.memZipcode = memZipcode;
	}
	public String getMemAddrDetail() {
		return memAddrDetail;
	}
	public void setMemAddrDetail(String memAddrDetail) {
		this.memAddrDetail = memAddrDetail;
	}
	public String getIsDeactivate() {
		return isDeactivate;
	}
	public void setIsDeactivate(String isDeactivate) {
		this.isDeactivate = isDeactivate;
	}
	@Override
	public String toString() {
		return "MemberVO [memId=" + memId + ", memPw=" + memPw + ", memName=" + memName + ", memGender=" + memGender
				+ ", memTell=" + memTell + ", memBirthday=" + memBirthday + ", memAddr=" + memAddr + ", memRank="
				+ memRank + ", isAdmin=" + isAdmin + ", joinDate=" + joinDate + ", memZipcode=" + memZipcode
				+ ", memAddrDetail=" + memAddrDetail + ", memPoint=" + memPoint + ", isDeactivate=" + isDeactivate
				+ ", memIdArr=" + Arrays.toString(memIdArr) + ", memTells=" + Arrays.toString(memTells) + ", memIds="
				+ Arrays.toString(memIds) + ", buyCnt=" + buyCnt + ", totalPrice=" + totalPrice + "]";
	}
	
	
	
}
