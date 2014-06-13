package com.medialounge.reevo.entity;

import java.io.Serializable;

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

/**
 * @author Anirudhha
 * @see
 */

@Component("mediaReviewEntity")
@Entity
@Table(name = "media_review")
public class MediaReviewEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "media_review_id")
	private int mediaReviewId;

	@OneToOne(targetEntity = UserEntity.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "reviewer_user_id")
	UserEntity reviewerUserId;

	@OneToOne(targetEntity = MediaEntity.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "media_id")
	MediaEntity mediaId;

	@Column(name = "type")
	String type;

	@Column(name = "comments")
	String comments;

	@Column(name = "review_status")
	String reviewStatus;

	@Column(name = "user_comments")
	String userComment;

	@Column(name = "publish")
	String publish;

	@Column(name = "title")
	String title;

	@Column(name = "keyword")
	private String keyword;

	@Column(name = "created")
	String created;

	@OneToOne(targetEntity = UserEntity.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	UserEntity userId;

	public int getMediaReviewId() {
		return mediaReviewId;
	}

	public void setMediaReviewId(int mediaReviewId) {
		this.mediaReviewId = mediaReviewId;
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

	public UserEntity getReviewerUserId() {
		return reviewerUserId;
	}

	public void setReviewerUserId(UserEntity reviewerUserId) {
		this.reviewerUserId = reviewerUserId;
	}

	public MediaEntity getMediaId() {
		return mediaId;
	}

	public void setMediaId(MediaEntity mediaId) {
		this.mediaId = mediaId;
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
