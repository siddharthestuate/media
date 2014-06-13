package com.medialounge.reevo.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component("chatEntity")
@Entity
@Table(name = "messagetrack")
public class ChatEntity implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "track_id")
	private int chatId;
	@ManyToOne(targetEntity = UserEntity.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "message_from", referencedColumnName = "user_id")
	private UserEntity messageFrom;

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

	@ManyToOne(targetEntity = UserEntity.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "message_to", referencedColumnName = "user_id")
	private UserEntity messageTo;
	@Column(name = "status")
	private String status;

	@Column(name = "unread_message_count")
	private Long unreadMessageCount;

	public Long getUnreadMessageCount() {
		return unreadMessageCount;
	}

	public void setUnreadMessageCount(Long unreadMessageCount) {
		this.unreadMessageCount = unreadMessageCount;
	}

	@Column(name = "description")
	private String description;

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getChatId() {
		return chatId;
	}

	public void setChatId(int chatId) {
		this.chatId = chatId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name = "created")
	private Date created;

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

}
