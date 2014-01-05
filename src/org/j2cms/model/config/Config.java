package org.j2cms.model.config;

import java.io.Serializable;
import java.net.UnknownHostException;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity @Table(name="j2_config")
public class Config implements Serializable {

	private static final long serialVersionUID = -6474060778370215705L;
	@Id
	@GeneratedValue
	private Integer id; // 配置ID
	@Column(length = 20)
	private String version; // 版本
	@Column(length = 30)
	private String domain; // 域名
	@Column(length = 30)
	private String ip; // IP
	@Column(length = 20)
	private String name; // 网站简称
	@Column(length = 100,name="full_name")
	private String fullName;//网站全名
	@Column(length=50)
	private String keywords;//网站关键字
	@Column(length=200)
	private String description;//网站描述
	@Column(length=1000)
	private String introduce;
	@Column(length = 40)
	private String company; // 公司简称
	@Column(length = 20)
	private String ceo; // 站长
	@Column(length = 20)
	private String email; // 站长邮箱
	@Column(length = 20)
	private String tel; // 电话
	@Column(length = 13)
	private String mobile; // 手机
	@Column(length = 20)
	private String QQ; // QQ
	@Column(length = 200)
	private String copyright; // 版权信息
	@Column(length = 20,name="record_code")
	private String recordCode; // 备案号
	@Column(length =20)
	private String template; //模版名
	@Column(length=20)
	private String ctp="/";//目录名
	@Column(length=200)
	private String statistics="";//站长统计
	@Column(length=36)
	private String uuid="";//全局标识
	@Column(name="sys_date")
	private Date sysDate = new Date(); //（系统日期）
	@Transient
	private String path=null;//模版路径
	@Transient
	private String configStr="";//字符串化表示
	
	@Column(length = 100)
	private String address; // 公司地址

	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getCeo() {
		return ceo;
	}
	public void setCeo(String ceo) {
		this.ceo = ceo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getQQ() {
		return QQ;
	}
	public void setQQ(String qQ) {
		QQ = qQ;
	}
	public String getCopyright() {
		return copyright;
	}
	public void setCopyright(String copyright) {
		this.copyright = copyright;
	}
	public String getRecordCode() {
		return recordCode;
	}
	public void setRecordCode(String recordCode) {
		this.recordCode = recordCode;
	}
	public String getTemplate() {
		return template;
	}
	public void setTemplate(String template) {
		this.template = template;
	}
	public String getCtp() {
		return ctp;
	}
	public void setCtp(String ctp) {
		this.ctp = ctp;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getStatistics() {
		return statistics;
	}
	public void setStatistics(String statistics) {
		this.statistics = statistics;
	}
	
	public Date getSysDate() {
		return sysDate;
	}
	public void setSysDate(Date sysDate) {
		this.sysDate = sysDate;
	}
	public String getPath() {
		if(path==null){
			path=this.ctp+"template/"+this.template+"/";
		}
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getConfigStr() throws UnknownHostException {
		configStr="config.ip="+ip+"&config.uuid="+uuid+"&config.domain="+domain+"&config.name="+name+"&config.fullName="+fullName+"&config.ceo="+ceo+"&config.company="+company+"&config.QQ="+QQ+"&config.tel="+tel+"&config.mobile="+mobile+"&config.email="+email+"&config.template="+template+"&config.recordCode="+recordCode+"&config.version="+version;
		return configStr;
	}
	public void setConfigStr(String configStr) {
		this.configStr = configStr;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Config other = (Config) obj;
		if ((this.domain.equals(other.domain))&&(!this.domain.equals("localhost"))&&(!this.domain.startsWith("127.0."))&&(!this.domain.startsWith("192.168.")))
			return true;
		if ((this.ip.equals(other.ip))&&(!this.ip.startsWith("127.0."))&&(!this.ip.startsWith("192.168.")))
			return true;
		return false;
	}
	
	

}
