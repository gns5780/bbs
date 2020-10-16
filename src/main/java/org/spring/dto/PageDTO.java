package org.spring.dto;
//�럹�씠吏뺤쿂由щ�� �쐞�븳 dto

import org.springframework.stereotype.Repository;

@Repository
public class PageDTO {
	private int curPage;//�쁽�옱�럹�씠吏�
	private int perPage = 20;//�븳�럹�씠吏��떦 寃뚯떆臾쇱닔
	private int perBlock = 5;//�럹�씠吏� 釉붾윮�쓽 �닔
	private int totPage;//�쟾泥댄럹�씠吏��닔
	private int startNo;//�떆�옉踰덊샇
	private int endNo;//�걹踰덊샇
	private int startPage;//釉붾윮�쓽 �떆�옉�럹�씠吏�
	private int endPage;//釉붾윮�쓽 �걹�럹�씠吏�
	private String findKey; //寃��깋�궎
	private String findValue; //寃��깋媛�
	
	public PageDTO() {
		super();
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getPerBlock() {
		return perBlock;
	}
	public void setPerBlock(int perBlock) {
		this.perBlock = perBlock;
	}
	public int getTotPage() {
		return totPage;
	}
	public void setTotPage(int totPage) {
		this.totPage = totPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getStartNo() {
		return startNo;
	}
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	public int getEndNo() {
		return endNo;
	}
	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}
	public String getFindKey() {
		return findKey;
	}
	public void setFindKey(String findKey) {
		this.findKey = findKey;
	}
	public String getFindValue() {
		return findValue;
	}
	public void setFindValue(String findValue) {
		this.findValue = findValue;
	}
	@Override
	public String toString() {
		return "PageDTO [curPage=" + curPage + ", perPage=" + perPage + ", perBlock=" + perBlock + ", totPage="
				+ totPage + ", startPage=" + startPage + ", endPage=" + endPage + ", startNo=" + startNo + ", endNo="
				+ endNo + ", findKey=" + findKey + ", findValue=" + findValue + "]";
	}
	
	
}
