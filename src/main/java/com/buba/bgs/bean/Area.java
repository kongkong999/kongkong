package com.buba.bgs.bean;

public class Area {
	private int id;
	private String areaName;
	private String areaCode;
	private String parentId;
	private String available;
	private String type1;
	private String name;
	private String isParent;
	private int pId;

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	@Override
	public String toString() {
		return "Area{" +
				"id=" + id +
				", areaName='" + areaName + '\'' +
				", areaCode='" + areaCode + '\'' +
				", parentId='" + parentId + '\'' +
				", available='" + available + '\'' +
				", type1='" + type1 + '\'' +
				", name='" + name + '\'' +
				", isParent='" + isParent + '\'' +
				'}';
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public String getAreaCode() {
		return areaCode;
	}

	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getAvailable() {
		return available;
	}

	public void setAvailable(String available) {
		this.available = available;
	}

	public String getType1() {
		return type1;
	}

	public void setType1(String type1) {
		this.type1 = type1;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIsParent() {
		return isParent;
	}

	public void setIsParent(String isParent) {
		this.isParent = isParent;
	}

	public Area() {

	}

	public Area(int id, String areaName, String areaCode, String parentId, String available, String type1, String name, String isParent) {

		this.id = id;
		this.areaName = areaName;
		this.areaCode = areaCode;
		this.parentId = parentId;
		this.available = available;
		this.type1 = type1;
		this.name = name;
		this.isParent = isParent;
	}
}
