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

/**
 * @author Anirudhha
 */
@Entity
@Table(name = "tbl_inspire")
public class InspireEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "inspire_id")
	private int inspireId;

	@ManyToOne(targetEntity = UserEntity.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "from_user_id")
	private UserEntity fromUserEntity;

	@ManyToOne(targetEntity = UserEntity.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "to_user_id")
	private UserEntity toUserEntity;

	public int getInspireId() {
		return inspireId;
	}

	public void setInspireId(int inspireId) {
		this.inspireId = inspireId;
	}

	public UserEntity getFromUserEntity() {
		return fromUserEntity;
	}

	public void setFromUserEntity(UserEntity fromUserEntity) {
		this.fromUserEntity = fromUserEntity;
	}

	public UserEntity getToUserEntity() {
		return toUserEntity;
	}

	public void setToUserEntity(UserEntity toUserEntity) {
		this.toUserEntity = toUserEntity;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
