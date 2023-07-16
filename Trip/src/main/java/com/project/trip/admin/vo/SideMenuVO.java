package com.project.trip.admin.vo;

import com.project.trip.board.vo.PageVO;

public class SideMenuVO extends PageVO {
	private String sideMenuCode;
	private String sideMenuName;
	private String sideMenuUri;
	private String menuCode;
	private String adminMenuCode;
	
	public String getAdminMenuCode() {
		return adminMenuCode;
	}
	public void setAdminMenuCode(String adminMenuCode) {
		this.adminMenuCode = adminMenuCode;
	}
	public String getSideMenuCode() {
		return sideMenuCode;
	}
	public void setSideMenuCode(String sideMenuCode) {
		this.sideMenuCode = sideMenuCode;
	}
	public String getSideMenuName() {
		return sideMenuName;
	}
	public void setSideMenuName(String sideMenuName) {
		this.sideMenuName = sideMenuName;
	}
	public String getSideMenuUri() {
		return sideMenuUri;
	}
	public void setSideMenuUri(String sideMenuUri) {
		this.sideMenuUri = sideMenuUri;
	}
	public String getMenuCode() {
		return menuCode;
	}
	public void setMenuCode(String menuCode) {
		this.menuCode = menuCode;
	}
	
}
