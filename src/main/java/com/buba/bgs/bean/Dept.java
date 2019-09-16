package com.buba.bgs.bean;

public class Dept {
	private int id;
	private String deptCode;
	private String deptName;
	private String areaCode;
	private int areaId;
	private String available;
	private String type;
	private String isParent;
	private String name;
	private String pId;

	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	public Dept() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Dept(int id, String deptCode, String deptName, String areaCode, int areaId, String available, String type,
			String isParent, String name) {
		super();
		this.id = id;
		this.deptCode = deptCode;
		this.deptName = deptName;
		this.areaCode = areaCode;
		this.areaId = areaId;
		this.available = available;
		this.type = type;
		this.isParent = isParent;
		this.name = name;
	}
	@Override
	public String toString() {
		return "Dept [id=" + id + ", deptCode=" + deptCode + ", deptName=" + deptName + ", areaCode=" + areaCode
				+ ", areaId=" + areaId + ", available=" + available + ", type=" + type + ", isParent=" + isParent
				+ ", name=" + name + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDeptCode() {
		return deptCode;
	}
	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getAreaCode() {
		return areaCode;
	}
	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}
	public int getAreaId() {
		return areaId;
	}
	public void setAreaId(int areaId) {
		this.areaId = areaId;
	}
	public String getAvailable() {
		return available;
	}
	public void setAvailable(String available) {
		this.available = available;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getIsParent() {
		return isParent;
	}
	public void setIsParent(String isParent) {
		this.isParent = isParent;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
