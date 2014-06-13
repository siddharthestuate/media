package com.medialounge.reevo.dto;

import java.io.Serializable;

import org.springframework.stereotype.Component;

import com.medialounge.reevo.entity.UserEntity;

/**
 * @author Anirudhha
 * */

@Component("InspireDTO")
public class InspireDTO implements Serializable {

	private int inspireId;
	private UserEntity fromUserEntity;
	private UserEntity toUserEntity;

	public int getInspireId() {
		return inspireId;
	}

	public void setInspireId(int inspireId) {
		this.inspireId = inspireId;
	}

	public UserEntity getFromUserEntity() {
		return fromUserEntity;
	}

	public void setFromUserEntity(UserEntity fromUserEntity) {
		this.fromUserEntity = fromUserEntity;
	}

	public UserEntity getToUserEntity() {
		return toUserEntity;
	}

	public void setToUserEntity(UserEntity toUserEntity) {
		this.toUserEntity = toUserEntity;
	}

}
