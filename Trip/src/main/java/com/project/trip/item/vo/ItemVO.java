package com.project.trip.item.vo;

import java.util.List;

import com.project.trip.admin.vo.BookSearchVO;

import lombok.Data;

public class ItemVO extends BookSearchVO{
	private String itemCode;
	private String itemName;
	private int itemPrice;
	private String itemDetail;
	private String startDate;
	private String endDate;
	private String tripDate;
	private String cateCode;
	private String attachedImgName;
	private int rowNum;
	private String longitude;
	private String latitude;
	private String tripAddr;
	private String tripArea;
	private double rateAvg;
	private ItemCateVO itemCateVO;
	private List<ImageVO> imageList;
	private String[] itemCodeArr;
	
	
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public int getRowNum() {
		return rowNum;
	}
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String[] getItemCodeArr() {
		return itemCodeArr;
	}
	public void setItemCodeArr(String[] itemCodeArr) {
		this.itemCodeArr = itemCodeArr;
	}
	public String getAttachedImgName() {
		return attachedImgName;
	}
	public void setAttachedImgName(String attachedImgName) {
		this.attachedImgName = attachedImgName;
	}
	public String getTripAddr() {
		return tripAddr;
	}
	public void setTripAddr(String tripAddr) {
		this.tripAddr = tripAddr;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public ItemCateVO getItemCateVO() {
		return itemCateVO;
	}
	public void setItemCateVO(ItemCateVO itemCateVO) {
		this.itemCateVO = itemCateVO;
	}
	public List<ImageVO> getImageList() {
		return imageList;
	}
	public void setImageList(List<ImageVO> imageList) {
		this.imageList = imageList;
	}
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public int getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}
	public String getItemDetail() {
		return itemDetail;
	}
	public void setItemDetail(String itemDetail) {
		this.itemDetail = itemDetail;
	}
	public String getTripDate() {
		return tripDate;
	}
	public void setTripDate(String tripDate) {
		this.tripDate = tripDate;
	}
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public double getRateAvg() {
		return rateAvg;
	}
	public void setRateAvg(double rateAvg) {
		this.rateAvg = rateAvg;
	}
	public String getTripArea() {
		return tripArea;
	}
	public void setTripArea(String tripArea) {
		this.tripArea = tripArea;
	}
	

}
