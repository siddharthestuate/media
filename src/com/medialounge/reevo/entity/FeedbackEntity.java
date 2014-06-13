package com.medialounge.reevo.entity;
import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "user_feedback")
public class FeedbackEntity {

		@Id
		@GeneratedValue(strategy = GenerationType.AUTO)
		@Column(name = "feedback_id")
		private int feedbackId;

	    @Column(name = "created")
	    private Date created;
		
		@ManyToOne(targetEntity = UserEntity.class, fetch = FetchType.EAGER)
		@JoinColumn(name = "user_id",referencedColumnName="user_id")
		private UserEntity feedbackUserDetails;
		
		@ManyToOne(targetEntity = MediaEntity.class, fetch = FetchType.EAGER)
		@JoinColumn(name = "media_id",referencedColumnName="media_id")
		private MediaEntity mediaEntity;
		

		public Date getCreated() {
			return created;
		}

		public void setCreated(Date created) {
			this.created = created;
		}

		@Column(name = "media_search_key")
		private String mediaSearchKey;

		/*@Column(name = "created")
		private String created;*/
		
		/*public String getCreated() {
			return created;
		}

		public void setCreated(String created) {
			this.created = created;
		}*/

		@Column(name = "description")
		private String description;
		
		@Column(name = "colour")
		private String colour;


		public int getFeedbackId() {
			return feedbackId;
		}

		public void setFeedbackId(int feedbackId) {
			this.feedbackId = feedbackId;
		}

		
		public UserEntity getFeedbackUserDetails() {
			return feedbackUserDetails;
		}

		public void setFeedbackUserDetails(UserEntity feedbackUserDetails) {
			this.feedbackUserDetails = feedbackUserDetails;
		}

		public MediaEntity getMediaEntity() {
			return mediaEntity;
		}

		public void setMediaEntity(MediaEntity mediaEntity) {
			this.mediaEntity = mediaEntity;
		}

		public String getMediaSearchKey() {
			return mediaSearchKey;
		}

		public void setMediaSearchKey(String mediaSearchKey) {
			this.mediaSearchKey = mediaSearchKey;
		}

		
		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		public String getColour() {
			return colour;
		}

		public void setColour(String colour) {
			this.colour = colour;
		}

	}


