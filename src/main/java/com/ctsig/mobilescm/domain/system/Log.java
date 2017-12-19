package com.ctsig.mobilescm.domain.system;

import com.ctsig.mobilescm.tool.TimeTool;

import java.io.Serializable;
import java.util.Date;


/**
 * 系统日志
 */
public class Log implements Serializable {

	private static final long serialVersionUID = -4856429529556265205L;
	
	
	private String id;
	
	private String actionName;
	
	private String parameter;
	
	private String account;
	
	private Date operTime;
	
	private String operTimeStr;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getActionName() {
		return actionName;
	}

	public void setActionName(String actionName) {
		this.actionName = actionName;
	}

	public String getParameter() {
		return parameter;
	}

	public void setParameter(String parameter) {
		this.parameter = parameter;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public Date getOperTime() {
		return operTime;
	}

	public void setOperTime(Date operTime) {
		this.operTime = operTime;
		this.operTimeStr = TimeTool.formatDate(operTime, null);
	}

	public String getOperTimeStr() {
		return operTimeStr;
	}

	public void setOperTimeStr(String operTimeStr) {
		this.operTimeStr = operTimeStr;
	}

	
}
