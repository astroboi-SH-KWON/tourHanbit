package com.hanbit.vo;

import java.util.Date;

public class QnaVo {

	private int qna_number;
	private String mem_id;
	private String qna_title;
	private Date qna_date;
	private String qna_content;
	private int qna_ref;
	private int qna_level;
	private int qna_step;
	private String qna_fname;
	private int qna_size;
	private String qna_pwd;
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
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public Date getQna_date() {
		return qna_date;
	}
	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public int getQna_ref() {
		return qna_ref;
	}
	public void setQna_ref(int qna_ref) {
		this.qna_ref = qna_ref;
	}
	public int getQna_level() {
		return qna_level;
	}
	public void setQna_level(int qna_level) {
		this.qna_level = qna_level;
	}
	public int getQna_step() {
		return qna_step;
	}
	public void setQna_step(int qna_step) {
		this.qna_step = qna_step;
	}
	public String getQna_fname() {
		return qna_fname;
	}
	public void setQna_fname(String qna_fname) {
		this.qna_fname = qna_fname;
	}
	public int getQna_size() {
		return qna_size;
	}
	public void setQna_size(int qna_size) {
		this.qna_size = qna_size;
	}
	public String getQna_pwd() {
		return qna_pwd;
	}
	public void setQna_pwd(String qna_pwd) {
		this.qna_pwd = qna_pwd;
	}
	public QnaVo(int qna_number, String mem_id, String qna_title, Date qna_date, String qna_content, int qna_ref,
			int qna_level, int qna_step, String qna_fname, int qna_size, String qna_pwd) {
		super();
		this.qna_number = qna_number;
		this.mem_id = mem_id;
		this.qna_title = qna_title;
		this.qna_date = qna_date;
		this.qna_content = qna_content;
		this.qna_ref = qna_ref;
		this.qna_level = qna_level;
		this.qna_step = qna_step;
		this.qna_fname = qna_fname;
		this.qna_size = qna_size;
		this.qna_pwd = qna_pwd;
	}
	public QnaVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
