package com.buba.bgs.bean;

import java.io.Serializable;
import java.util.Date;

public class Attachment implements Serializable {
    private Integer id;

    private Integer itemId;

    private String fileextensions;

    private String url;

    private long size;

    private String date;

    private Date shootingtime;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public String getFileextensions() {
        return fileextensions;
    }

    public void setFileextensions(String fileextensions) {
        this.fileextensions = fileextensions == null ? null : fileextensions.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

  

    public long getSize() {
		return size;
	}

	public void setSize(long size) {
		this.size = size;
	}

	public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date == null ? null : date.trim();
    }

    public Date getShootingtime() {
        return shootingtime;
    }

    public void setShootingtime(Date shootingtime) {
        this.shootingtime = shootingtime;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", itemId=").append(itemId);
        sb.append(", fileextensions=").append(fileextensions);
        sb.append(", url=").append(url);
        sb.append(", size=").append(size);
        sb.append(", date=").append(date);
        sb.append(", shootingtime=").append(shootingtime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}