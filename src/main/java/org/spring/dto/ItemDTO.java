package org.spring.dto;

import java.sql.Date;

import org.springframework.stereotype.Repository;


@Repository
public class ItemDTO {
	private int seq;
	private String category;
	private String itemname;
	private String itemsize;
	private String itemprice;
	private String itemcolor;
	private String itemimage;
	private Date regdate;
	
	
	
	@Override
	public String toString() {
		return "ItemDTO [seq=" + seq + ", category=" + category + ", itemname=" + itemname + ", itemsize=" + itemsize
				+ ", itemprice=" + itemprice + ", itemcolor=" + itemcolor + ", itemimage=" + itemimage + ", regdate="
				+ regdate + "]";
	}
	public ItemDTO(String category, String itemname, String itemsize, String itemprice, String itemcolor,
			String itemimage, Date regdate) {
		super();
		this.category = category;
		this.itemname = itemname;
		this.itemsize = itemsize;
		this.itemprice = itemprice;
		this.itemcolor = itemcolor;
		this.itemimage = itemimage;
		this.regdate = regdate;
	}
	public ItemDTO(String category, String itemname, String itemsize, String itemprice, String itemcolor,
			String itemimage) {
		super();
		this.category = category;
		this.itemname = itemname;
		this.itemsize = itemsize;
		this.itemprice = itemprice;
		this.itemcolor = itemcolor;
		this.itemimage = itemimage;
	}
	public ItemDTO(String itemname, String itemsize, String itemprice, String itemcolor, String itemimage) {
		super();
		this.itemname = itemname;
		this.itemsize = itemsize;
		this.itemprice = itemprice;
		this.itemcolor = itemcolor;
		this.itemimage = itemimage;
	}
	public ItemDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getItemname() {
		return itemname;
	}
	public void setItemname(String itemname) {
		this.itemname = itemname;
	}
	public String getItemsize() {
		return itemsize;
	}
	public void setItemsize(String itemsize) {
		this.itemsize = itemsize;
	}
	public String getItemprice() {
		return itemprice;
	}
	public void setItemprice(String itemprice) {
		this.itemprice = itemprice;
	}
	public String getItemcolor() {
		return itemcolor;
	}
	public void setItemcolor(String itemcolor) {
		this.itemcolor = itemcolor;
	}
	public String getItemimage() {
		return itemimage;
	}
	public void setItemimage(String itemimage) {
		this.itemimage = itemimage;
	}
	
	
	
	
}
