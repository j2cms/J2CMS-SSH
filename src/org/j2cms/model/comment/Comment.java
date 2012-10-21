package org.j2cms.model.comment;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.j2cms.model.CheckState;
import org.j2cms.model.article.Article;
import org.j2cms.model.user.User;


@Entity @Table(name="j2_comment")
public class Comment implements Serializable {
	private static final long serialVersionUID = -257151979214596125L;
	@Id
	@GeneratedValue
	private Integer id;// 评论ID 主键
	@ManyToOne
	@JoinColumn(name="article_id")
	private Article article;// 评论对应文章 外键
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;// 评论发表的用户
	@Column(name="sys_date")
	private Date sysDate = new Date(); //（系统日期）
	@Lob
	private String content; // 评论内容
	@Column(name="check_state")
	private CheckState checkState; //状态
	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	

	public Article getArticle() {
		return article;
	}

//	public String getId() {
//		return id;
//	}
//
//	public void setId(String id) {
//		this.id = id;
//	}

	public void setArticle(Article article) {
		this.article = article;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Date getSysDate() {
		return sysDate;
	}

	public void setSysDate(Date sysDate) {
		this.sysDate = sysDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public CheckState getCheckState() {
		return checkState;
	}

	public void setCheckState(CheckState checkState) {
		this.checkState = checkState;
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
		Comment other = (Comment) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

}
