package com.medialounge.reevo.entity;

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

@Component("bumpMutualEntity")
@Entity
@Table(name = "bump_mutual")
public class BumpMutualEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "bumpmutual_id")
	private int bumpId;

	@OneToOne(targetEntity = UserEntity.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "from_User")
	UserEntity fromUser;

	@OneToOne(targetEntity = UserEntity.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "to_User")
	UserEntity toUser;

	@Column(name = "mutual")
	private String mutual;

	@Column(name = "mutual_Status")
	private String mutualStatus;

	public int getBumpId() {
		return bumpId;
	}

	public void setBumpId(int bumpId) {
		this.bumpId = bumpId;
	}

	public UserEntity getFromUser() {
		return fromUser;
	}

	public void setFromUser(UserEntity fromUser) {
		this.fromUser = fromUser;
	}

	public UserEntity getToUser() {
		return toUser;
	}

	public void setToUser(UserEntity toUser) {
		this.toUser = toUser;
	}

	public String getMutual() {
		return mutual;
	}

	public void setMutual(String mutual) {
		this.mutual = mutual;
	}

	public String getMutualStatus() {
		return mutualStatus;
	}

	public void setMutualStatus(String mutualStatus) {
		this.mutualStatus = mutualStatus;
	}

}
