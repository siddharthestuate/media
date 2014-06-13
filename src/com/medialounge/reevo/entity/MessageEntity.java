package com.medialounge.reevo.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component("messageEntity")
@Entity
@Table(name = "messagetrack")
public class MessageEntity implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "track_id")
	private int trackId;
	
//	@ManyToOne(targetEntity = UserEntity.class, fetch = FetchType.EAGER)
//	@JoinColumn(name = "user_id")
	
	
	@Column(name = "message_from")
	private int messageFrom;

	@Column(name = "message_to")
	private int messageTo;

	@Column(name = "subject")
	private String subject;

	@Column(name = "description")
	private String description;

	@Column(name = "status")
	private String status;

	@Column(name = "is_deleted")
	private String deleted;

	public int getTrackId() {
		return trackId;
	}

	public void setTrackId(int trackId) {
		this.trackId = trackId;
	}

	public int getMessageFrom() {
		return messageFrom;
	}

	public void setMessageFrom(int messageFrom) {
		this.messageFrom = messageFrom;
	}

	public int getMessageTo() {
		return messageTo;
	}

	public void setMessageTo(int messageTo) {
		this.messageTo = messageTo;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDeleted() {
		return deleted;
	}

	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}

}
