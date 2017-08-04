package com.hanbit.vo;

public class ReplyVo {

	private int rno;
	private int qna_number;
	private String mem_id;
	private String rcontent;
	private String rdate;
	private String rdate_update;
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getQna_number() {
		return qna_number;
	}
	public void setQna_number(int qna_number) {
		this.qna_number = qna_number;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public String getRdate_update() {
		return rdate_update;
	}
	public void setRdate_update(String rdate_update) {
		this.rdate_update = rdate_update;
	}
	public ReplyVo(int rno, int qna_number, String mem_id, String rcontent, String rdate, String rdate_update) {
		super();
		this.rno = rno;
		this.qna_number = qna_number;
		this.mem_id = mem_id;
		this.rcontent = rcontent;
		this.rdate = rdate;
		this.rdate_update = rdate_update;
	}
	public ReplyVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
