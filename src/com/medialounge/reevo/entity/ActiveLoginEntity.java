package com.medialounge.reevo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component("activeLoginEntity")
@Entity
@Table(name = "activeLogin")
public class ActiveLoginEntity {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "activeLogin_id")
	private int activeLoginId;

	@OneToOne(targetEntity = UserEntity.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "user")
	private UserEntity userId;

	@Column(name = "browser")
	private String browser;

	@Column(name = "IP")
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
