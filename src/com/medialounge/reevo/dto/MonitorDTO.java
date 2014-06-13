package com.medialounge.reevo.dto;

import org.springframework.stereotype.Component;

import com.medialounge.reevo.entity.ModuleEntity;
import com.medialounge.reevo.entity.UserEntity;

/**
 * @author : Anirudhha
 * @description : Used to monitor the module and user
 * */

@Component("MonitorDTO")
public class MonitorDTO {

	private int monitorId;
	private UserEntity userEntity;
	private ModuleEntity moduleEntity;
	private int moduleId;
	private String moduleName;
	private long timeSpend;
	private long userCount;
	private long average;
	private long baseRate4a;
	private float actualRate4a;
	private float baseRate4b;
	private float actualRate4b;

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

	public int getModuleId() {
		return moduleId;
	}

	public void setModuleId(int moduleId) {
		this.moduleId = moduleId;
	}

	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	public long getUserCount() {
		return userCount;
	}

	public void setUserCount(long userCount) {
		this.userCount = userCount;
	}

	public long getAverage() {
		return average;
	}

	public void setAverage(long average) {
		this.average = average;
	}

	public long getBaseRate4a() {
		return baseRate4a;
	}

	public void setBaseRate4a(long baseRate4a) {
		this.baseRate4a = baseRate4a;
	}

	public float getActualRate4a() {
		return actualRate4a;
	}

	public void setActualRate4a(float actualRate4a) {
		this.actualRate4a = actualRate4a;
	}

	public float getBaseRate4b() {
		return baseRate4b;
	}

	public void setBaseRate4b(float baseRate4b) {
		this.baseRate4b = baseRate4b;
	}

	public float getActualRate4b() {
		return actualRate4b;
	}

	public void setActualRate4b(float actualRate4b) {
		this.actualRate4b = actualRate4b;
	}

}
