package com.medialounge.reevo.dto;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component("userDto")
public class UserDto {
	int userId;
	long phone;
	String zipcode, nickName;
	String firstName, lastName, email, password, gender, country;
	String contacts[];
	Long unreadMessageCount;
	
	public Long getUnreadMessageCount() {
		return unreadMessageCount;
	}

	public void setUnreadMessageCount(Long unreadMessageCount) {
		this.unreadMessageCount = unreadMessageCount;
	}
	String statusMessage;
	public String getStatusMessage() {
		return statusMessage;
	}

	public void setStatusMessage(String statusMessage) {
		this.statusMessage = statusMessage;
	}
	private String location;
	private String role;
	private String genre;
	private String profilePhoto;
	private String bio;
	// for media review
	int mediaReviewId, reviewerUserId;
	String commentsId, type, comments, reviewStatus;
	String dj, vs, journalist, anchor, mediaId;
	private String[] djvalues, vsValues, journalistValues, anchorValues;
	private List<MultipartFile> userPhoto;
	private String contentPath;
	private String userComment;
	double latitude, longitude;
	private String birthday, age;

	public String[] getContacts() {
		return contacts;
	}

	public void setContacts(String[] contacts) {
		this.contacts = contacts;
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

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public int getMediaReviewId() {
		return mediaReviewId;
	}

	public void setMediaReviewId(int mediaReviewId) {
		this.mediaReviewId = mediaReviewId;
	}

	public int getReviewerUserId() {
		return reviewerUserId;
	}

	public void setReviewerUserId(int reviewerUserId) {
		this.reviewerUserId = reviewerUserId;
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

	public String getReviewStatus() {
		return reviewStatus;
	}

	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
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

	public String getContentPath() {
		return contentPath;
	}

	public void setContentPath(String contentPath) {
		this.contentPath = contentPath;
	}

	public String getUserComment() {
		return userComment;
	}

	public void setUserComment(String userComment) {
		this.userComment = userComment;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getProfilePhoto() {
		return profilePhoto;
	}

	public void setProfilePhoto(String profilePhoto) {
		this.profilePhoto = profilePhoto;
	}

	public String getBio() {
		return bio;
	}

	public void setBio(String bio) {
		this.bio = bio;
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

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

}
