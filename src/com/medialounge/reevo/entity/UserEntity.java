package com.medialounge.reevo.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component("userEntity")
@Entity
@Table(name = "user")
public class UserEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "user_id")
	private int userId;
	@Column(name = "unreadMessageCount")
	private Long unreadMessageCount;

	public Long getUnreadMessageCount() {
		return unreadMessageCount;
	}

	public void setUnreadMessageCount(Long unreadMessageCount) {
		this.unreadMessageCount = unreadMessageCount;
	}

	@Column(name = "telephone")
	private long phone;
	@Column(name = "first_name")
	String firstName;
	@Column(name = "status_message")
	String statusMessage;
	public String getStatusMessage() {
		return statusMessage;
	}

	public void setStatusMessage(String statusMessage) {
		this.statusMessage = statusMessage;
	}

	@Column(name = "last_name")
	String lastName;
	@Column(name = "email")
	String email;
	@Column(name = "password")
	String password;
	@Column(name = "gender")
	String gender;
	@Column(name = "dj")
	String dj;
	@Column(name = "vs")
	String vs;
	@Column(name = "journalist")
	String journalist;
	@Column(name = "anchor")
	String anchor;
	@Column(name = "photo_path")
	String contentPath;

	@Column(name = "location")
	private String country;

	@Column(name = "role")
	private String role;

	@Column(name = "genre")
	private String genre;

	@Column(name = "profile_photo")
	private String profilePhoto;

	@Column(name = "bio")
	private String bio;

	@Column(name = "zipcode")
	private String zipcode;

	@Column(name = "longitude")
	private double longitude;

	@Column(name = "latitude")
	private double latitude;

	@Column(name = "nickName")
	private String nickName;

	@Column(name = "birthday")
	private String birthday;

	@Column(name = "age")
	private String age;

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

	public String getDj() {
		return (this.dj == null) ? "N" : this.dj;
	}

	public void setDj(String dj) {
		this.dj = (dj == null) ? this.dj = "N" : dj;
	}

	public String getVs() {
		return (this.vs == null) ? "N" : this.vs;
	}

	public void setVs(String vs) {
		this.vs = (vs == null) ? this.vs = "N" : vs;
	}

	public String getJournalist() {
		return (this.journalist == null) ? "N" : this.journalist;
	}

	public void setJournalist(String journalist) {
		this.journalist = (journalist == null) ? this.journalist = "N"
				: journalist;
	}

	public String getAnchor() {
		return (this.anchor == null) ? "N" : this.anchor;
	}

	public void setAnchor(String anchor) {
		this.anchor = (anchor == null) ? this.anchor = "N" : anchor;
	}

	public String getContentPath() {
		return contentPath;
	}

	public void setContentPath(String contentPath) {
		this.contentPath = contentPath;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
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

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
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
