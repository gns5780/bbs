package org.spring.dto;

import org.springframework.stereotype.Repository;

@Repository
public class UserDTO {
	private String id;
	private String pw;
	private String repw;
	private String name;
	private String address;
	private String phonenum;
	private String email;
	
	
	
	@Override
	public String toString() {
		return "UserDTO [id=" + id + ", pw=" + pw + ", repw=" + repw + ", name=" + name + ", address=" + address
				+ ", phonenum=" + phonenum + ", email=" + email + "]";
	}
	public UserDTO(String id, String pw, String repw, String name, String address, String phonenum, String email) {
		super();
		this.id = id;
		this.pw = pw;
		this.repw = repw;
		this.name = name;
		this.address = address;
		this.phonenum = phonenum;
		this.email = email;
	}
	public UserDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getRepw() {
		return repw;
	}
	public void setRepw(String repw) {
		this.repw = repw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
	
	
}
