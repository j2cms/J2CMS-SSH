package org.j2cms.model.article;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.j2cms.model.CheckState;
import org.j2cms.model.channel.Channel;
import org.j2cms.model.comment.Comment;
import org.j2cms.model.group.Group;
import org.j2cms.model.user.User;


@Entity
@Table(name = "j2_article")
public class Article implements Serializable {
	private static final long serialVersionUID = 4338391967508386112L;
	@Id
	@GeneratedValue
	private Integer id;// 文章id
	@Column(length = 50)
	private String title; // 文章标题
	@Column(length = 100,name="title_img")
	private String titleImg; // 文章标题缩略图
	@Column(length = 100,name="content_img")
	private String contentImg; // 文章内容缩略图
	@Column(length = 20)
	private String author; // 作者
	@Column(length = 50)
	private String origin; // 来源
	@Column(length = 100)
	private String tags; // Tag标签
	@Column(length = 200)
	private String summary; // 文章摘要
	@Lob
	private String content; // 文章内容
	@Column(name="sys_date")
	private Date sysDate = new Date(); //（系统日期）
	@Column(name="release_date",length=10)
//	@Temporal(TemporalType.DATE)
	private String releaseDate; // 发表日期（可以人为设置）
	@Column(name="check_date")
	private Date checkDate; // 审核通过日期
	@Column(name="disable_date")
	private Date disableDate; // 禁用日期
	@Column(name="visit_total")
	private Integer visitTotal=0; // 总共访问次数
	@Column(name="recommend_level")
	private Integer recommendLevel; // 推荐级别
	@Column(name="comment_count")
	private Integer commentCount=0; // 评论数量
	@Column(name="related_id")
	private String relatedID; // 相关文章ID
	@org.hibernate.annotations.Type(type="yes_no")
	@Column(name="comment_state")
	private Boolean commentState ; // 是否允许评论
	@Column(name="check_state")
	private CheckState checkState; //状态
	@ManyToOne
	@JoinColumn(name = "group_id")
	private Group group;// 允许浏览会员组
	@ManyToOne
	@JoinColumn(name = "channel_id")
	private Channel channel; // 栏目ID
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user; // 发布者
	@OneToMany(cascade = CascadeType.REFRESH, mappedBy = "article")
	private Set<Comment> comments = new HashSet<Comment>();// 评论集合
	
	
	public Article() {
	}
	public Article(Integer id) {
		this.id=id;
	}
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
	public String getTitleImg() {
		return titleImg;
	}
	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}
	public String getContentImg() {
		return contentImg;
	}
	public void setContentImg(String contentImg) {
		this.contentImg = contentImg;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getSysDate() {
		return sysDate;
	}
	public void setSysDate(Date sysDate) {
		this.sysDate = sysDate;
	}
	public String getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}
	public Date getCheckDate() {
		return checkDate;
	}
	public void setCheckDate(Date checkDate) {
		this.checkDate = checkDate;
	}
	public Date getDisableDate() {
		return disableDate;
	}
	public void setDisableDate(Date disableDate) {
		this.disableDate = disableDate;
	}

	public Integer getVisitTotal() {
		return visitTotal;
	}
	public void setVisitTotal(Integer visitTotal) {
		this.visitTotal = visitTotal;
	}
	public Integer getRecommendLevel() {
		return recommendLevel;
	}
	public void setRecommendLevel(Integer recommendLevel) {
		this.recommendLevel = recommendLevel;
	}
	public Integer getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(Integer commentCount) {
		this.commentCount = commentCount;
	}
	public String getRelatedID() {
		return relatedID;
	}
	public void setRelatedID(String relatedID) {
		this.relatedID = relatedID;
	}
	public Boolean getCommentState() {
		return commentState;
	}
	public void setCommentState(Boolean commentState) {
		this.commentState = commentState;
	}

	public CheckState getCheckState() {
		return checkState;
	}
	public void setCheckState(CheckState checkState) {
		this.checkState = checkState;
	}
	public Group getGroup() {
		return group;
	}
	public void setGroup(Group group) {
		this.group = group;
	}
	public Channel getChannel() {
		return channel;
	}
	public void setChannel(Channel channel) {
		this.channel = channel;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Set<Comment> getComments() {
		return comments;
	}
	public void setComments(Set<Comment> comments) {
		this.comments = comments;
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
		Article other = (Article) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}
