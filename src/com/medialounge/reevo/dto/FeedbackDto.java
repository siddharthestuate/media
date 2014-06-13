package com.medialounge.reevo.dto;

import java.util.Date;

import com.medialounge.reevo.entity.MediaEntity;
import com.medialounge.reevo.entity.UserEntity;

public class FeedbackDto {
	private int feedbackId;
	private UserEntity feedbackUserDetails;
	private MediaEntity mediaEntity;
	private String mediaSearchKey;
	private String description;
	private String colour;
	private Date created;
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	public int getFeedbackId() {
		return feedbackId;
	}
	public void setFeedbackId(int feedbackId) {
		this.feedbackId = feedbackId;
	}
	
	public UserEntity getFeedbackUserDetails() {
		return feedbackUserDetails;
	}
	public void setFeedbackUserDetails(UserEntity feedbackUserDetails) {
		this.feedbackUserDetails = feedbackUserDetails;
	}
	public MediaEntity getMediaEntity() {
		return mediaEntity;
	}
	public void setMediaEntity(MediaEntity mediaEntity) {
		this.mediaEntity = mediaEntity;
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
}
