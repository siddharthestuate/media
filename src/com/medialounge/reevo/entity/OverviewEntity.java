/**
 * @author : Mahesh
 * 
 */

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

@Entity
@Table(name = "quick_overview")
public class OverviewEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "quick_overview_id")
	private int quickOverViewId;

	/*
	 * @Column(name = "quick_overiew_module_id") private int overviewModuleId;
	 */

	/*
	 * @ManyToOne(targetEntity = OverViewModulesEntity.class, fetch =
	 * FetchType.EAGER)
	 * 
	 * @JoinColumn(name = "quick_overiew_module_id") private
	 * OverViewModulesEntity overviewModuleId;
	 */

	@OneToOne(targetEntity = OverViewModulesEntity.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "quick_overiew_module_id")
	private OverViewModulesEntity overViewModulesEntity;

	@Column(name = "quick_overview_description")
	private String description;

	@Column(name = "quick_overview_status")
	private String status;

	@Column(name = "quick_overview_isDeleted")
	private String isDeleted;

	@Column(name = "function_work")
	private String functionWork;

	@Column(name = "why_to_use")
	private String whyToUse;

	public int getQuickOverViewId() {
		return quickOverViewId;
	}

	public void setQuickOverViewId(int quickOverViewId) {
		this.quickOverViewId = quickOverViewId;
	}

	public OverViewModulesEntity getOverViewModulesEntity() {
		return overViewModulesEntity;
	}

	public void setOverViewModulesEntity(
			OverViewModulesEntity overViewModulesEntity) {
		this.overViewModulesEntity = overViewModulesEntity;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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
