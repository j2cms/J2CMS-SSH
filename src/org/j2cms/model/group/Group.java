package org.j2cms.model.group;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.j2cms.model.CheckState;
import org.j2cms.model.user.User;


@Entity
@Table(name = "j2_group")
public class Group implements Serializable {
	private static final long serialVersionUID = -5270873609135979578L;
	@Id
	@GeneratedValue
	private Integer id;// 角色ID
	@Column(length = 16)
	private String name;// 角色名称
	@Column(length = 255)
	private String info; // 角色描述
	@Column(name = "manage_channel")
	@org.hibernate.annotations.Type(type = "yes_no")
	private boolean manageChannel = false; // 能否管理栏目信息
	@Column(name = "manager_article")
	@org.hibernate.annotations.Type(type = "yes_no")
	private boolean manageArticle = false; // 能否管理文章
	@Column(name = "manage_comment")
	@org.hibernate.annotations.Type(type = "yes_no")
	private boolean manageComment = false; // 能否管理评论
	@Column(name = "manage_group")
	@org.hibernate.annotations.Type(type = "yes_no")
	private boolean manageGroup = false; // 能否管理用户组
	@Column(name = "manager_user")
	@org.hibernate.annotations.Type(type = "yes_no")
	private boolean manageUser = false; // 能否管理会员
	@Column(name = "manage_config")
	@org.hibernate.annotations.Type(type = "yes_no")
	private boolean manageConfig = false; // 能否管理系统配置
	@Column(name = "manager_log")
	@org.hibernate.annotations.Type(type = "yes_no")
	private boolean manageLog = false; // 能否管理系统日志
	@OneToMany(mappedBy = "group")
	private Set<User> users = new HashSet<User>(); // 该角色组包含的用户集合
	@Column(name="sys_date")
	private Date sysDate = new Date(); //（系统日期）
	@Column(name="check_state")
	private CheckState checkState; //状态

	public Group() {
	}

	public Group(Integer groupID) {
		this.id = groupID;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}
	public boolean getManageArticle() {
		return manageArticle;
	}

	public void setManageArticle(boolean manageArticle) {
		this.manageArticle = manageArticle;
	}

	public boolean getManageUser() {
		return manageUser;
	}

	public void setManageUser(boolean manageUser) {
		this.manageUser = manageUser;
	}

	public boolean getManageComment() {
		return manageComment;
	}

	public void setManageComment(boolean manageComment) {
		this.manageComment = manageComment;
	}

	public boolean getManageConfig() {
		return manageConfig;
	}

	public void setManageConfig(boolean manageConfig) {
		this.manageConfig = manageConfig;
	}

	public boolean getManageChannel() {
		return manageChannel;
	}

	public void setManageChannel(boolean manageChannel) {
		this.manageChannel = manageChannel;
	}

	public boolean getManageGroup() {
		return manageGroup;
	}

	public void setManageGroup(boolean manageGroup) {
		this.manageGroup = manageGroup;
	}

	public boolean getManageLog() {
		return manageLog;
	}

	public void setManageLog(boolean manageLog) {
		this.manageLog = manageLog;
	}

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	public Date getSysDate() {
		return sysDate;
	}

	public void setSysDate(Date sysDate) {
		this.sysDate = sysDate;
	}

	public CheckState getCheckState() {
		return checkState;
	}

	public void setCheckState(CheckState checkState) {
		this.checkState = checkState;
	}
	

}
