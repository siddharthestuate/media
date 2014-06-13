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

@Component("feedbackSuggestionEntity")
@Entity
@Table(name = "feedback_suggestion")
public class FeedbackSuggestionEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "suggestionTrack_id")
	private int suggestionTrackId;

	@Column(name = "suggestionTo")
	private String suggestionTo;

	@OneToOne(targetEntity = UserEntity.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "suggestionFrom")
	UserEntity suggestionFrom;

	@OneToOne(targetEntity = MediaEntity.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "media")
	MediaEntity media;

	@Column(name = "feedback")
	private String feedback;
	
	@Column(name = "status")
	private String status;

	public int getSuggestionTrackId() {
		return suggestionTrackId;
	}

	public void setSuggestionId(int suggestionTrackId) {
		this.suggestionTrackId = suggestionTrackId;
	}

	public String getSuggestionTo() {
		return suggestionTo;
	}

	public void setSuggestionTo(String suggestionTo) {
		this.suggestionTo = suggestionTo;
	}

	public UserEntity getSuggestionFrom() {
		return suggestionFrom;
	}

	public void setSuggestionFrom(UserEntity suggestionFrom) {
		this.suggestionFrom = suggestionFrom;
	}

	public MediaEntity getMedia() {
		return media;
	}

	public void setMedia(MediaEntity media) {
		this.media = media;
	}

	public String getFeedback() {
		return feedback;
	}

	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
