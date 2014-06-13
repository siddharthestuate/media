package com.medialounge.reevo.dto;

import org.springframework.stereotype.Component;

import com.medialounge.reevo.entity.MediaEntity;
import com.medialounge.reevo.entity.UserEntity;

/**
 * @author Anirudhha
 * @see
 */

@Component("MediaReviewDTO")
public class MediaReviewDTO {

	private int mediaReviewId;
	private String comments;
	MediaEntity mediaId;
	private String reviewStatus;
	private String type;
	UserEntity reviewerUserId;
	private String userComment;
	private String publish;
	private String title;
	UserEntity userId;
	private String keyword;
	private String created;

	public int getMediaReviewId() {
		return mediaReviewId;
	}

	public void setMediaReviewId(int mediaReviewId) {
		this.mediaReviewId = mediaReviewId;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public MediaEntity getMediaId() {
		return mediaId;
	}

	public void setMediaId(MediaEntity mediaId) {
		this.mediaId = mediaId;
	}

	public String getReviewStatus() {
		return reviewStatus;
	}

	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public UserEntity getReviewerUserId() {
		return reviewerUserId;
	}

	public void setReviewerUserId(UserEntity reviewerUserId) {
		this.reviewerUserId = reviewerUserId;
	}

	public String getUserComment() {
		return userComment;
	}

	public void setUserComment(String userComment) {
		this.userComment = userComment;
	}

	public String getPublish() {
		return publish;
	}

	public void setPublish(String publish) {
		this.publish = publish;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public UserEntity getUserId() {
		return userId;
	}

	public void setUserId(UserEntity userId) {
		this.userId = userId;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}

}
