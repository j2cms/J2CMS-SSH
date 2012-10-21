package org.j2cms.model.config;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.j2cms.model.CheckState;


@Entity @Table(name = "j2_flash")
public class Flash implements Serializable{
	private static final long serialVersionUID = -167418181172641228L;
	@Id @GeneratedValue
	private Integer id;
	@Column(length=50)
	private String title;
	@Column(name="image_url",length=300)
	private String imageURL;
	@Column(name="link_url",length=300)
	private String linkURL;
	@Column(name="check_state")
	private CheckState checkState; //状态
	@Column(name="sys_date")
	private Date sysDate = new Date(); //（系统日期）
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImageURL() {
		return imageURL;
	}
	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}
	public String getLinkURL() {
		return linkURL;
	}
	public void setLinkURL(String linkURL) {
		this.linkURL = linkURL;
	}
	public CheckState getCheckState() {
		return checkState;
	}
	public void setCheckState(CheckState checkState) {
		this.checkState = checkState;
	}
	public Date getSysDate() {
		return sysDate;
	}
	public void setSysDate(Date sysDate) {
		this.sysDate = sysDate;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Flash other = (Flash) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}




}
