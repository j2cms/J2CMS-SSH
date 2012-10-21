package org.j2cms.model.log;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity @Table(name="j2_log")
public class Log implements Serializable {

	private static final long serialVersionUID = 5540199359900218851L;
	@Id
	@GeneratedValue
	private long id; // 日志ID
	

	@Column(length=20,name="user_name")
	private String userName;// 操作用户 id+name
	@Column(length=20,name="log_type")
	@Enumerated(EnumType.STRING)
	private LogType logType; // 操作类型（事件）
	@Column(name="sys_date")
	private Date sysDate = new Date(); //（系统日期）
	@Column(length=15)
	private String ip; // 操作者IP
	@Column(length=20,name="log_result")
	@Enumerated(EnumType.STRING)
	private LogResult logResult; // 返回结果

	public Log() {
	}

	public Log(String userName, LogType logType, Date sysDate, String ip,
			LogResult logResult) {
		this.userName = userName;
		this.logType = logType;
		this.sysDate = sysDate;
		this.ip = ip;
		this.logResult = logResult;
	}

//	public Integer getId() {
//		return id;
//	}
//
//	public void setId(Integer id) {
//		this.id = id;
//	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}


	public Date getTime() {
		return sysDate;
	}

	public void setTime(Date time) {
		this.sysDate = time;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public LogResult getLogResult() {
		return logResult;
	}

	public void setLogResult(LogResult logResult) {
		this.logResult = logResult;
	}

	public void setLogType(LogType logType) {
		this.logType = logType;
	}

	public LogType getLogType() {
		return logType;
	}

	public Date getSysDate() {
		return sysDate;
	}

	public void setSysDate(Date sysDate) {
		this.sysDate = sysDate;
	}
	

}
