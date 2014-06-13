package com.medialounge.reevo.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "quick_overview_modules")
public class OverViewModulesEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "quick_overview_module_id")
	private int quickOverViewModuleId;

	@Column(name = "quick_overview_module_name")
	private String quickOverViewModuleName;

	@Column(name = "is_deleted")
	private String isDeleted;
	

	public int getQuickOverViewModuleId() {
		return quickOverViewModuleId;
	}

	public void setQuickOverViewModuleId(int quickOverViewModuleId) {
		this.quickOverViewModuleId = quickOverViewModuleId;
	}

	public String getQuickOverViewModuleName() {
		return quickOverViewModuleName;
	}

	public void setQuickOverViewModuleName(String quickOverViewModuleName) {
		this.quickOverViewModuleName = quickOverViewModuleName;
	}

	public String getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(String isDeleted) {
		this.isDeleted = isDeleted;
	}

}
