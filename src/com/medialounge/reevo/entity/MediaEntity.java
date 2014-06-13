package com.medialounge.reevo.entity;

import java.io.Serializable;
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

/**
 * 
 * @author Ramachandran R
 * 
 */
@Component("mediaEntity")
@Entity
@Table(name = "media")
public class MediaEntity implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "media_id")
	private int mediaId;

	@ManyToOne(targetEntity = UserEntity.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private UserEntity userEntity;

	@Column(name = "media_name")
	String mediaName;

	@Column(name = "media_search_key")
	String mediaSearchKey;

	@Column(name = "media_comments")
	String mediaComments;

	@Column(name = "fmf")
	String mediaFmf;

	@Column(name = "media_path")
	String mediaPath;

	@Column(name = "content_type")
	String contentType;

	@Column(name = "created")
	String created;
	
	
	@Column(name = "rating_value")
	private int ratingCurrentValue;
	
	@Column(name = "users_count")
	private int countOfUsersRated;
	
	@Column(name = "average_rating")
	private double ratingAverage;


	public int getMediaId() {
		return mediaId;
	}

	public void setMediaId(int mediaId) {
		this.mediaId = mediaId;
	}

	public UserEntity getUserEntity() {
		return userEntity;
	}

	public void setUserEntity(UserEntity userEntity) {
		this.userEntity = userEntity;
	}

	public String getMediaName() {
		return mediaName;
	}

	public void setMediaName(String mediaName) {
		this.mediaName = mediaName;
	}

	public String getMediaPath() {
		return mediaPath;
	}

	public void setMediaPath(String mediaPath) {
		this.mediaPath = mediaPath;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public String getMediaComments() {
		return mediaComments;
	}

	public void setMediaComments(String mediaComments) {
		this.mediaComments = mediaComments;
	}

	public String getMediaSearchKey() {
		return mediaSearchKey;
	}

	public void setMediaSearchKey(String mediaSearchKey) {
		this.mediaSearchKey = mediaSearchKey;
	}

	public String getMediaFmf() {
		return mediaFmf;
	}

	public void setMediaFmf(String mediaFmf) {
		this.mediaFmf = mediaFmf;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}

	public int getRatingCurrentValue() {
		return ratingCurrentValue;
	}

	public void setRatingCurrentValue(int ratingCurrentValue) {
		this.ratingCurrentValue = ratingCurrentValue;
	}

	public int getCountOfUsersRated() {
		return countOfUsersRated;
	}

	public void setCountOfUsersRated(int countOfUsersRated) {
		this.countOfUsersRated = countOfUsersRated;
	}

	public double getRatingAverage() {
		return ratingAverage;
	}

	public void setRatingAverage(double ratingAverage) {
		this.ratingAverage = ratingAverage;
	}

}
