package com.medialounge.reevo.entity;
import java.io.Serializable;  

import javax.persistence.Column;  




import javax.persistence.Entity;  
import javax.persistence.GeneratedValue;  
import javax.persistence.GenerationType;  
import javax.persistence.Id;  
import javax.persistence.Table; 

import org.springframework.stereotype.Component;
@Component("contactEntity")
@Entity 
@Table(name="contact") 
public class ContactEntity {
	public String getContactId() {
		return contactId;
	}
	public void setContactId(String contactId) {
		this.contactId = contactId;
	}
	public int getFromUserId() {
		return fromUserId;
	}
	public void setFromUserId(int fromUserId) {
		this.fromUserId = fromUserId;
	}
	public int getToUserId() {
		return toUserId;
	}
	public void setToUserId(int toUserId) {
		this.toUserId = toUserId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Id  
	@GeneratedValue(strategy=GenerationType.AUTO)  
	@Column(name = "contact_id")
	private String contactId;
	@Column(name = "from_user_id")
	private int fromUserId;
	@Column(name = "to_user_id")
	private int toUserId;
	@Column(name = "status")
	private String status;
	@Column(name = "read_status")
	private String readStatus;
	public String getReadStatus() {
		return readStatus;
	}
	public void setReadStatus(String readStatus) {
		this.readStatus = readStatus;
	}
	
}
