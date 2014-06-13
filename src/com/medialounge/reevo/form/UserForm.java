package com.medialounge.reevo.form;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class UserForm {
	int userId;
	long phone;
	String zipcode, nickName;
	String firstName, lastName, email, password, gender, country;
	String[] contactId;

	// for media review
	int mediaReviewId;
	String commentsId, type, comments;
	String dj, vs, journalist, anchor, mediaId, reviewStatus;
	private String[] djvalues, vsValues, journalistValues, anchorValues;
	private List<MultipartFile> userPhoto;
	private String mediaPath, contentType;
	double latitude, longitude;
	String dobMonth, dobDate, dobYear, birthday;

	public String[] getContactId() {
		return contactId;
	}

	public void setContactId(String[] contactId) {
		this.contactId = contactId;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public long getPhone() {
		return phone;
	}

	public void setPhone(long phone) {
		this.phone = phone;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getMediaReviewId() {
		return mediaReviewId;
	}

	public void setMediaReviewId(int mediaReviewId) {
		this.mediaReviewId = mediaReviewId;
	}

	public String getCommentsId() {
		return commentsId;
	}

	public void setCommentsId(String commentsId) {
		this.commentsId = commentsId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getDj() {
		return dj;
	}

	public void setDj(String dj) {
		this.dj = dj;
	}

	public String getVs() {
		return vs;
	}

	public void setVs(String vs) {
		this.vs = vs;
	}

	public String getJournalist() {
		return journalist;
	}

	public void setJournalist(String journalist) {
		this.journalist = journalist;
	}

	public String getAnchor() {
		return anchor;
	}

	public void setAnchor(String anchor) {
		this.anchor = anchor;
	}

	public String getMediaId() {
		return mediaId;
	}

	public void setMediaId(String mediaId) {
		this.mediaId = mediaId;
	}

	public String getReviewStatus() {
		return reviewStatus;
	}

	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}

	public String[] getDjvalues() {
		return djvalues;
	}

	public void setDjvalues(String[] djvalues) {
		this.djvalues = djvalues;
	}

	public String[] getVsValues() {
		return vsValues;
	}

	public void setVsValues(String[] vsValues) {
		this.vsValues = vsValues;
	}

	public String[] getJournalistValues() {
		return journalistValues;
	}

	public void setJournalistValues(String[] journalistValues) {
		this.journalistValues = journalistValues;
	}

	public String[] getAnchorValues() {
		return anchorValues;
	}

	public void setAnchorValues(String[] anchorValues) {
		this.anchorValues = anchorValues;
	}

	public List<MultipartFile> getUserPhoto() {
		return userPhoto;
	}

	public void setUserPhoto(List<MultipartFile> userPhoto) {
		this.userPhoto = userPhoto;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public String getMediaPath() {
		return mediaPath;
	}

	public void setMediaPath(String mediaPath) {
		this.mediaPath = mediaPath;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getDobMonth() {
		return dobMonth;
	}

	public void setDobMonth(String dobMonth) {
		this.dobMonth = dobMonth;
	}

	public String getDobDate() {
		return dobDate;
	}

	public void setDobDate(String dobDate) {
		this.dobDate = dobDate;
	}

	public String getDobYear() {
		return dobYear;
	}

	public void setDobYear(String dobYear) {
		this.dobYear = dobYear;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

}
