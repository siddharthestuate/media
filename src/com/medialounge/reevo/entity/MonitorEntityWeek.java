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
 * @author : Ramachandran R
 * @created : 09th Jan 2014 09.00 PM
 */

@Entity
@Table(name = "monitor_per_week")
public class MonitorEntityWeek implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "mpw_id")
	private int monitorPerWeek;

	@Column(name = "user_count")
	private long userCount;

	@ManyToOne(targetEntity = ModuleEntity.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "module_id")
	private ModuleEntity moduleEntity;
	
	@Column(name = "weekly_avg")
	private long weeklyAvg;

	public int getMonitorPerWeek() {
		return monitorPerWeek;
	}

	public void setMonitorPerWeek(int monitorPerWeek) {
		this.monitorPerWeek = monitorPerWeek;
	}

	public long getUserCount() {
		return userCount;
	}

	public void setUserCount(long userCount) {
		this.userCount = userCount;
	}

	public ModuleEntity getModuleEntity() {
		return moduleEntity;
	}

	public void setModuleEntity(ModuleEntity moduleEntity) {
		this.moduleEntity = moduleEntity;
	}

	public long getWeeklyAvg() {
		return weeklyAvg;
	}

	public void setWeeklyAvg(long weeklyAvg) {
		this.weeklyAvg = weeklyAvg;
	}

}
