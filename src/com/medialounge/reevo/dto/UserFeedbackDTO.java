package com.medialounge.reevo.dto;

import org.springframework.stereotype.Component;

import com.medialounge.reevo.entity.UserEntity;

@Component("userFeedbackDTO")
public class UserFeedbackDTO {

	private int feedbackId;
	private UserEntity userId;
	private int mediaId;
	private String mediaSearchKey;
	private String description;
	private String colour;
	
	private String bgColor;
	
	private Long usersCount;

	public int getFeedbackId() {
		return feedbackId;
	}

	public void setFeedbackId(int feedbackId) {
		this.feedbackId = feedbackId;
	}

	public UserEntity getUserId() {
		return userId;
	}

	public void setUserId(UserEntity userId) {
		this.userId = userId;
	}

	public int getMediaId() {
		return mediaId;
	}

	public void setMediaId(int mediaId) {
		this.mediaId = mediaId;
	}

	public String getMediaSearchKey() {
		return mediaSearchKey;
	}

	public void setMediaSearchKey(String mediaSearchKey) {
		this.mediaSearchKey = mediaSearchKey;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getColour() {
		return colour;
	}

	public void setColour(String colour) {
		this.colour = colour;
	}

	public Long getUsersCount() {
		return usersCount;
	}

	public void setUsersCount(Long usersCount) {
		this.usersCount = usersCount;
	}

	public String getBgColor() {
		return bgColor;
	}

	public void setBgColor(String bgColor) {
		this.bgColor = bgColor;
	}

}
