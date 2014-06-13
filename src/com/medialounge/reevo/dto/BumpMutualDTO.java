package com.medialounge.reevo.dto;

import org.springframework.stereotype.Component;

import com.medialounge.reevo.entity.UserEntity;

@Component("bumpMutualDTO")
public class BumpMutualDTO {

	private int bumpId;
	UserEntity fromUser;
	UserEntity toUser;
	private String mutual;
	private String mutualStatus;

	public int getBumpId() {
		return bumpId;
	}

	public void setBumpId(int bumpId) {
		this.bumpId = bumpId;
	}

	public UserEntity getFromUser() {
		return fromUser;
	}

	public void setFromUser(UserEntity fromUser) {
		this.fromUser = fromUser;
	}

	public UserEntity getToUser() {
		return toUser;
	}

	public void setToUser(UserEntity toUser) {
		this.toUser = toUser;
	}

	public String getMutual() {
		return mutual;
	}

	public void setMutual(String mutual) {
		this.mutual = mutual;
	}

	public String getMutualStatus() {
		return mutualStatus;
	}

	public void setMutualStatus(String mutualStatus) {
		this.mutualStatus = mutualStatus;
	}

}
