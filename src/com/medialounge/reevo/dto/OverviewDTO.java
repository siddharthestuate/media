/**
 *	@author    : Mahesh 
 *  
 */

package com.medialounge.reevo.dto;

import org.springframework.stereotype.Component;

import com.medialounge.reevo.entity.OverViewModulesEntity;

@Component("OverviewDTO")
public class OverviewDTO {

	private int id;
	private String overviewName;
	private String description;
	private String userEmail;
	private String status;
	private String isDeleted;

	private int quickOverViewModuleId;

	private OverViewModulesEntity overViewModulesEntity;
	private String quickOverViewModuleName;
	private String moduleIsDeleted;

	private String functionWork;
	private String whyToUse;

	// **

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOverviewName() {
		return overviewName;
	}

	public void setOverviewName(String overviewName) {
		this.overviewName = overviewName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(String isDeleted) {
		this.isDeleted = isDeleted;
	}

	public OverViewModulesEntity getOverViewModulesEntity() {
		return overViewModulesEntity;
	}

	public void setOverViewModulesEntity(
			OverViewModulesEntity overViewModulesEntity) {
		this.overViewModulesEntity = overViewModulesEntity;
	}

	public String getQuickOverViewModuleName() {
		return quickOverViewModuleName;
	}

	public void setQuickOverViewModuleName(String quickOverViewModuleName) {
		this.quickOverViewModuleName = quickOverViewModuleName;
	}

	public String getModuleIsDeleted() {
		return moduleIsDeleted;
	}

	public void setModuleIsDeleted(String moduleIsDeleted) {
		this.moduleIsDeleted = moduleIsDeleted;
	}

	public int getQuickOverViewModuleId() {
		return quickOverViewModuleId;
	}

	public void setQuickOverViewModuleId(int quickOverViewModuleId) {
		this.quickOverViewModuleId = quickOverViewModuleId;
	}

	public String getFunctionWork() {
		return functionWork;
	}

	public void setFunctionWork(String functionWork) {
		this.functionWork = functionWork;
	}

	public String getWhyToUse() {
		return whyToUse;
	}

	public void setWhyToUse(String whyToUse) {
		this.whyToUse = whyToUse;
	}

}
