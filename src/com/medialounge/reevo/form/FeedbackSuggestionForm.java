package com.medialounge.reevo.form;

import com.medialounge.reevo.entity.MediaEntity;
import com.medialounge.reevo.entity.UserEntity;

public class FeedbackSuggestionForm {

	private int suggestionTrackId;
	private String suggestionTo;
	UserEntity suggestionFrom;
	MediaEntity media;
	private String feedback;
	private String status;

	public int getSuggestionTrackId() {
		return suggestionTrackId;
	}

	public void setSuggestionTrackId(int suggestionTrackId) {
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
