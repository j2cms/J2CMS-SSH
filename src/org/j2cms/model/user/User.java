package org.j2cms.model.user;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.j2cms.model.CheckState;
import org.j2cms.model.article.Article;
import org.j2cms.model.comment.Comment;
import org.j2cms.model.group.Group;


@Entity @Table(name = "j2_user")
public class User implements Serializable {

	private static final long serialVersionUID = -6226529032720364720L;
	@Id
	@GeneratedValue
	private Integer id;// 用户ID
	@Column(name="j2cms_user_name",length=20)
	private String username; // 用户名
	@Column(name="j2cms_pass_word",length=32)
	private String password; // 用户密码
	private Date createTime; // 用户产生时间
	@Column(name="real_name",length=20)
	private String realName; // 用户真实姓名
	@Enumerated(EnumType.ORDINAL)
	@Column(length = 7)
	private Gender gender; // 用户性别 ,枚举类型
	@Temporal(TemporalType.DATE)
	private Date birthday; // 用户出生时间
	@Column(length = 50)
	private String email; // 用户电子邮箱
	@Column(length = 20)
	private String telephone; // 用户电话联系方式
	@Column(length = 12)
	private String QQ; // 用户QQ号
	@Column(length = 100)
	private String address; // 用户地址
	@Column(length = 10)
	private String zipCode; // 用户地址邮编
	@Lob
	private String info; // 用户个人资料说明
	@Column(name="last_login_time")
	private Date lastLoginTime; // 上次登录时间
	@Column(name="last_login_ip",length = 15)
	private String lastLoginIP; // 上次登录IP
	@Column(name="login_number")
	private Integer loginNumber; // 用户登录次数
	@Column(name="check_state")
	private CheckState checkState; //用户状态
//	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="sys_date")
	private Date sysDate = new Date(); //（系统日期）
	
	@OneToMany(mappedBy="user")
	private Set<Article> articles = new HashSet<Article>();// 发表的文章集合
	@OneToMany(mappedBy="user")
	private Set<Comment> comments= new HashSet<Comment>();// 用户发表的评论
	@ManyToOne
	@JoinColumn(name="group_id")
	private Group group;// 角色组 ,多对一

	public User() {
	}

	public User(Integer id) {
		this.id=id;
	}

	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public Gender getGender() {
		return gender;
	}

	public void setGender(Gender gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getQQ() {
		return QQ;
	}

	public void setQQ(String qQ) {
		QQ = qQ;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public Date getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public String getLastLoginIP() {
		return lastLoginIP;
	}

	public void setLastLoginIP(String lastLoginIP) {
		this.lastLoginIP = lastLoginIP;
	}

	public Integer getLoginNumber() {
		return loginNumber;
	}

	public void setLoginNumber(Integer loginNumber) {
		this.loginNumber = loginNumber;
	}

	public CheckState getCheckState() {
		return checkState;
	}

	public void setCheckState(CheckState checkState) {
		this.checkState = checkState;
	}

	public Set<Article> getArticles() {
		return articles;
	}

	public void setArticles(Set<Article> articles) {
		this.articles = articles;
	}

	public Set<Comment> getComments() {
		return comments;
	}

	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}

	public Group getGroup() {
		return group;
	}

	public void setGroup(Group group) {
		this.group = group;
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
		User other = (User) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}


}
