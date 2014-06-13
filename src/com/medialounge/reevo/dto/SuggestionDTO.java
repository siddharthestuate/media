package com.medialounge.reevo.dto;

import org.springframework.stereotype.Component;

import com.medialounge.reevo.entity.UserEntity;

@Component("SuggestionDTO")
public class SuggestionDTO {

	private int suggestionId;

	private UserEntity fromUser;

	private int suggestionTo;

	private String description;

	private String suggestionType;

	private String deleted;

	public int getSuggestionId() {
		return suggestionId;
	}

	public void setSuggestionId(int suggestionId) {
		this.suggestionId = suggestionId;
	}

	public UserEntity getFromUser() {
		return fromUser;
	}

	public void setFromUser(UserEntity fromUser) {
		this.fromUser = fromUser;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getSuggestionType() {
		return suggestionType;
	}

	public void setSuggestionType(String suggestionType) {
		this.suggestionType = suggestionType;
	}

	public int getSuggestionTo() {
		return suggestionTo;
	}

	public void setSuggestionTo(int suggestionTo) {
		this.suggestionTo = suggestionTo;
	}

	public String getDeleted() {
		return deleted;
	}

	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}

}
