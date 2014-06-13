package com.medialounge.reevo.dto;

import org.springframework.stereotype.Component;

import com.medialounge.reevo.entity.UserEntity;

@Component("activeLoginDTO")
public class ActiveLoginDTO {

	private int activeLoginId;

	private UserEntity userId;

	private String browser;

	private String IP;

	public int getActiveLoginId() {
		return activeLoginId;
	}

	public void setActiveLoginId(int activeLoginId) {
		this.activeLoginId = activeLoginId;
	}

	public UserEntity getUserId() {
		return userId;
	}

	public void setUserId(UserEntity userId) {
		this.userId = userId;
	}

	public String getBrowser() {
		return browser;
	}

	public void setBrowser(String browser) {
		this.browser = browser;
	}

	public String getIP() {
		return IP;
	}

	public void setIP(String iP) {
		IP = iP;
	}

}
