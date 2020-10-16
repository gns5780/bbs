package org.spring.dto;

import org.springframework.stereotype.Repository;

@Repository
public class BoardDTO {
	private int num; 		//�옄�룞利앷� 踰덊샇
	private String userid; 	//�븘�씠�뵒
	private String subject; //�젣紐� 
	private String reg_date; //�벑濡앹씪�옄
	private int readcount;  //議고쉶�닔
	private int ref;   		//洹몃９踰덊샇
	private int re_step;  	//湲��쓽 �닚�꽌
	private int re_level;  	//湲��젅踰�
	private String content; //湲��쓽 �궡�슜
	
	
	@Override
	public String toString() {
		return "BoardDTO [num=" + num + ", userid=" + userid + ", subject=" + subject + ", reg_date=" + reg_date
				+ ", readcount=" + readcount + ", ref=" + ref + ", re_step=" + re_step + ", re_level=" + re_level
				+ ", content=" + content + "]";
	}
	public BoardDTO(int num, String userid, String subject, String reg_date, int readcount, int ref, int re_step,
			int re_level, String content) {
		super();
		this.num = num;
		this.userid = userid;
		this.subject = subject;
		this.reg_date = reg_date;
		this.readcount = readcount;
		this.ref = ref;
		this.re_step = re_step;
		this.re_level = re_level;
		this.content = content;
	}
	public BoardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	

}
