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
import javax.persistence.Table;

/**
 * @author : Anirudhha
 * @created : 6th Jan 2014 12.10 PM
 */

@Entity
@Table(name = "monitor_per_module")
public class MonitorEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "monitor_id")
	private int monitorId;

	@ManyToOne(targetEntity = UserEntity.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private UserEntity userEntity;

	@ManyToOne(targetEntity = ModuleEntity.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "module_id")
	private ModuleEntity moduleEntity;

	@Column(name = "time_spend")
	private long timeSpend;

	public int getMonitorId() {
		return monitorId;
	}

	public void setMonitorId(int monitorId) {
		this.monitorId = monitorId;
	}

	public UserEntity getUserEntity() {
		return userEntity;
	}

	public void setUserEntity(UserEntity userEntity) {
		this.userEntity = userEntity;
	}

	public ModuleEntity getModuleEntity() {
		return moduleEntity;
	}

	public void setModuleEntity(ModuleEntity moduleEntity) {
		this.moduleEntity = moduleEntity;
	}

	public long getTimeSpend() {
		return timeSpend;
	}

	public void setTimeSpend(long timeSpend) {
		this.timeSpend = timeSpend;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
