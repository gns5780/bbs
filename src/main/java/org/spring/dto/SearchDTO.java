package org.spring.dto;

import org.springframework.stereotype.Repository;

@Repository
public class SearchDTO {
	private String name;
	private int num;
	
	
	
	@Override
	public String toString() {
		return "SearchDTO [name=" + name + ", num=" + num + "]";
	}
	public SearchDTO(String name, int num) {
		super();
		this.name = name;
		this.num = num;
	}
	public SearchDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	
	
}
