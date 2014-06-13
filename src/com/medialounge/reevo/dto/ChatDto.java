package com.medialounge.reevo.dto;

import java.util.Date;

import com.medialounge.reevo.entity.UserEntity;

public class ChatDto {
	private int chatId;
	private Integer unreadMessageCount;
	private UserEntity messageFrom;
	private UserEntity messageTo;
	private String status, description;
	private Date created;

	public int getUnreadMessageCount() {
		return unreadMessageCount;
	}

	public void setUnreadMessageCount(Integer unreadMessageCount) {
		this.unreadMessageCount = unreadMessageCount;
	}

	public int getChatId() {
		return chatId;
	}

	public void setChatId(int chatId) {
		this.chatId = chatId;
	}

	public UserEntity getMessageFrom() {
		return messageFrom;
	}

	public void setMessageFrom(UserEntity messageFrom) {
		this.messageFrom = messageFrom;
	}

	public UserEntity getMessageTo() {
		return messageTo;
	}

	public void setMessageTo(UserEntity messageTo) {
		this.messageTo = messageTo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}
}
