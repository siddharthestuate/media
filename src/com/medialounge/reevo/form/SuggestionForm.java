package com.medialounge.reevo.form;

public class SuggestionForm {

	private int suggestionId;

	private int fromUser;

	private int suggestionTo;

	private String description;

	private String suggestionType;

	public int getSuggestionId() {
		return suggestionId;
	}

	public void setSuggestionId(int suggestionId) {
		this.suggestionId = suggestionId;
	}

	public int getFromUser() {
		return fromUser;
	}

	public void setFromUser(int fromUser) {
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
}
