package com.medialounge.reevo.dto;

import java.io.Serializable;
import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.medialounge.reevo.entity.UserEntity;

/**
 * @author Ramachandran R
 * 
 */
@Component("mediaDto")
//@Scope("prototype")
public class MediaDto implements Serializable {

	private static final long serialVersionUID = 1L;
	// media
	private int mediaId;
	private String userId, mediaName, mediaSearchKey, mediaPath, contentType, mediaKey, mediaFmf;

	private double userSize;
	private List<MultipartFile> mediaFile;
	private String created;
	// mediaComments
	private int commentsId;
	private String toUserId, fromUserId, mediaComments;

	// pagination
	private int totalRecords, startRecord, EndRecord, id;
	private String username, units, type, comments; // , filePath

	// Access user
	private int accessId;
	private String accessUser, accessUserId;

	private String userNumber;

	// paid content
	private String status;

	
	
	// check already fmf is there or not 
	private String fmfCheck;
	
	// Rating
	private int ratingCurrentValue;
	private int countOfUsersRated;
	private double ratingAverage;
	
	// for media mapping 
	private UserEntity userEntity;

	public int getMediaId() {
		return mediaId;
	}

	public void setMediaId(int mediaId) {
		this.mediaId = mediaId;
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

	public double getUserSize() {
		return userSize;
	}

	public void setUserSize(double userSize) {
		this.userSize = userSize;
	}

	public List<MultipartFile> getMediaFile() {
		return mediaFile;
	}

	public void setMediaFile(List<MultipartFile> mediaFile) {
		this.mediaFile = mediaFile;
	}

	public int getCommentsId() {
		return commentsId;
	}

	public void setCommentsId(int commentsId) {
		this.commentsId = commentsId;
	}

	public String getToUserId() {
		return toUserId;
	}

	public void setToUserId(String toUserId) {
		this.toUserId = toUserId;
	}

	public String getFromUserId() {
		return fromUserId;
	}

	public void setFromUserId(String fromUserId) {
		this.fromUserId = fromUserId;
	}

	public String getMediaComments() {
		return mediaComments;
	}

	public void setMediaComments(String mediaComments) {
		this.mediaComments = mediaComments;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public int getStartRecord() {
		return startRecord;
	}

	public void setStartRecord(int startRecord) {
		this.startRecord = startRecord;
	}

	public int getEndRecord() {
		return EndRecord;
	}

	public void setEndRecord(int endRecord) {
		EndRecord = endRecord;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUnits() {
		return units;
	}

	public void setUnits(String units) {
		this.units = units;
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

	public int getAccessId() {
		return accessId;
	}

	public void setAccessId(int accessId) {
		this.accessId = accessId;
	}

	public String getAccessUser() {
		return accessUser;
	}

	public void setAccessUser(String accessUser) {
		this.accessUser = accessUser;
	}

	public String getAccessUserId() {
		return accessUserId;
	}

	public void setAccessUserId(String accessUserId) {
		this.accessUserId = accessUserId;
	}

	public String getUserNumber() {
		return userNumber;
	}

	public void setUserNumber(String userNumber) {
		this.userNumber = userNumber;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getMediaSearchKey() {
		return mediaSearchKey;
	}

	public void setMediaSearchKey(String mediaSearchKey) {
		this.mediaSearchKey = mediaSearchKey;
	}

	public String getMediaKey() {
		return mediaKey;
	}

	public void setMediaKey(String mediaKey) {
		this.mediaKey = mediaKey;
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

	public String getFmfCheck() {
		return fmfCheck;
	}

	public void setFmfCheck(String fmfCheck) {
		this.fmfCheck = fmfCheck;
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

	public UserEntity getUserEntity() {
		return userEntity;
	}

	public void setUserEntity(UserEntity userEntity) {
		this.userEntity = userEntity;
	}
	
}
