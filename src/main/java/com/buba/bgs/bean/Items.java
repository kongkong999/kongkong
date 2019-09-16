package com.buba.bgs.bean;

import java.io.Serializable;

public class Items implements Serializable {
    private Integer id;

    private String numActual;

    private Integer newClient;

    private Integer oldClient;

    private Integer yxClient;

    private Float money;

    private String available;

    private String createtime;

    private String autoTimestamp;

    private Integer deptId;

    private Integer areaId;

    private String areaCode;

    private Integer userId;

    private String userCode;
    
    private String startTime;
    
    private String deptName;
    
    private String nameActivities;
    
    private int numActivities;
    
    private String areaName;

    private String type;

    private int planId;

    public int getPlanId() {
        return planId;
    }

    public void setPlanId(int planId) {
        this.planId = planId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public String getNameActivities() {
		return nameActivities;
	}

	public void setNameActivities(String nameActivities) {
		this.nameActivities = nameActivities;
	}

    public int getNumActivities() {
		return numActivities;
	}

	public void setNumActivities(int numActivities) {
		this.numActivities = numActivities;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNumActual() {
        return numActual;
    }

    public void setNumActual(String numActual) {
        this.numActual = numActual == null ? null : numActual.trim();
    }

    public Integer getNewClient() {
        return newClient;
    }

    public void setNewClient(Integer newClient) {
        this.newClient = newClient;
    }

    public Integer getOldClient() {
        return oldClient;
    }

    public void setOldClient(Integer oldClient) {
        this.oldClient = oldClient;
    }

    public Integer getYxClient() {
        return yxClient;
    }

    public void setYxClient(Integer yxClient) {
        this.yxClient = yxClient;
    }

    public Float getMoney() {
        return money;
    }

    public void setMoney(Float money) {
        this.money = money;
    }

    public String getAvailable() {
        return available;
    }

    public void setAvailable(String available) {
        this.available = available == null ? null : available.trim();
    }

   

    public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public String getAutoTimestamp() {
		return autoTimestamp;
	}

	public void setAutoTimestamp(String autoTimestamp) {
		this.autoTimestamp = autoTimestamp;
	}

	public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public Integer getAreaId() {
        return areaId;
    }

    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }

    public String getAreaCode() {
        return areaCode;
    }

    public void setAreaCode(String areaCode) {
        this.areaCode = areaCode == null ? null : areaCode.trim();
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserCode() {
        return userCode;
    }

    public void setUserCode(String userCode) {
        this.userCode = userCode == null ? null : userCode.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", numActual=").append(numActual);
        sb.append(", newClient=").append(newClient);
        sb.append(", oldClient=").append(oldClient);
        sb.append(", yxClient=").append(yxClient);
        sb.append(", money=").append(money);
        sb.append(", available=").append(available);
        sb.append(", createtime=").append(createtime);
        sb.append(", autoTimestamp=").append(autoTimestamp);
        sb.append(", deptId=").append(deptId);
        sb.append(", areaId=").append(areaId);
        sb.append(", areaCode=").append(areaCode);
        sb.append(", userId=").append(userId);
        sb.append(", userCode=").append(userCode);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}