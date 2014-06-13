package com.medialounge.reevo.dto;

import org.springframework.stereotype.Component;

import com.medialounge.reevo.entity.UserEntity;

@Component("bumpDTO")
public class BumpDTO {

	private int bumpId;
	UserEntity fromUser;
	UserEntity toUser;
	private String favourite;
	private String mutual;
	private String favStatus;
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

	public String getFavourite() {
		return favourite;
	}

	public void setFavourite(String favourite) {
		this.favourite = favourite;
	}

	public String getMutual() {
		return mutual;
	}

	public void setMutual(String mutual) {
		this.mutual = mutual;
	}

	public String getFavStatus() {
		return favStatus;
	}

	public void setFavStatus(String favStatus) {
		this.favStatus = favStatus;
	}

	public String getMutualStatus() {
		return mutualStatus;
	}

	public void setMutualStatus(String mutualStatus) {
		this.mutualStatus = mutualStatus;
	}

}
