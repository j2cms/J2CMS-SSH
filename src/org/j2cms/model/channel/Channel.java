package org.j2cms.model.channel;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.j2cms.model.CheckState;
import org.j2cms.model.article.Article;


@Entity
@Table(name = "j2_channel")
public class Channel implements Serializable {
	private static final long serialVersionUID = 5257758268484027105L;
	@Id
	@GeneratedValue
	private Integer id; // id
	@Column(length = 20)
	private String name; // 栏目名
	@Lob
	private String info; // 栏目说明/内容
	@Column(name = "rank_id")
	private Integer rankid = 0; // 排序id
	@org.hibernate.annotations.Type(type = "yes_no")
	@Column(name = "single")
	private Boolean single = false;// 是否是单页
	@org.hibernate.annotations.Type(type = "yes_no")
	@Column(name = "display")
	private Boolean display = false;// 是否在导航栏显示
	@org.hibernate.annotations.Type(type = "yes_no")
	@Column(name = "display_in_index")
	private Boolean displayInIndex = false;// 是否在首页显示
	@Column(name = "visit_total")
	private Integer visitTotal = 0; // 总共访问次数
	@OneToMany(cascade = { CascadeType.PERSIST, CascadeType.REMOVE }, mappedBy = "father", fetch = FetchType.LAZY)
	private Set<Channel> children = new HashSet<Channel>();
	@ManyToOne(cascade = { CascadeType.REFRESH })
	@JoinColumn(name = "father_id")
	private Channel father; // 父栏目
	@OneToMany(mappedBy = "channel")
	private Set<Article> articles = new HashSet<Article>();// 该栏目下的文章
	@Column(name="sys_date")
	private Date sysDate = new Date(); //（系统日期）
	@Column(name="check_state")
	private CheckState checkState; //状态

	public Channel() {
	}

	public Channel(Integer id) {
		this.id = id;
	}

	public Boolean getSingle() {
		return single;
	}

	public Integer getVisitTotal() {
		return visitTotal;
	}

	public void setVisitTotal(Integer visitTotal) {
		this.visitTotal = visitTotal;
	}

	public void setSingle(Boolean single) {
		this.single = single;
	}

	public Boolean getDisplay() {
		return display;
	}

	public Boolean getDisplayInIndex() {
		return displayInIndex;
	}

	public void setDisplayInIndex(Boolean displayInIndex) {
		this.displayInIndex = displayInIndex;
	}

	public void setDisplay(Boolean display) {
		this.display = display;
	}

	public Set<Channel> getChildren() {
		return children;
	}

	public void setChildren(Set<Channel> children) {
		this.children = children;
	}

	public Channel getFather() {
		return father;
	}

	public void setFather(Channel father) {
		this.father = father;
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

	public Integer getRankid() {
		return rankid;
	}

	public void setRankid(Integer rankid) {
		this.rankid = rankid;
	}

	public Set<Article> getArticles() {
		return articles;
	}

	public void setArticles(Set<Article> articles) {
		this.articles = articles;
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
		Channel other = (Channel) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	public CheckState getCheckState() {
		return checkState;
	}

	public void setCheckState(CheckState checkState) {
		this.checkState = checkState;
	}

}
