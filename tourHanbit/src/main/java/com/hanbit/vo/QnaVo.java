package com.hanbit.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class QnaVo {

	private int qna_number;
	private String mem_id;
	private String qna_title;
	private String qna_date;
	private String qna_content;
	private String qna_fname;
	private int qna_fsize;
	private String qna_pwd;
	private MultipartFile uploadFile;
	private int commentNum; //덧글개수처리
	
	
	public QnaVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QnaVo(int qna_number, String mem_id, String qna_title, String qna_date, String qna_content, String qna_fname,
			int qna_fsize, String qna_pwd, MultipartFile uploadFile, int commentNum) {
		super();
		this.qna_number = qna_number;
		this.mem_id = mem_id;
		this.qna_title = qna_title;
		this.qna_date = qna_date;
		this.qna_content = qna_content;
		this.qna_fname = qna_fname;
		this.qna_fsize = qna_fsize;
		this.qna_pwd = qna_pwd;
		this.uploadFile = uploadFile;
		this.commentNum = commentNum;
	}
	public int getCommentNum() {
		return commentNum;
	}
	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
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
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_date() {
		return qna_date;
	}
	public void setQna_date(String qna_date) {
		this.qna_date = qna_date;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public String getQna_fname() {
		return qna_fname;
	}
	public void setQna_fname(String qna_fname) {
		this.qna_fname = qna_fname;
	}
	public int getQna_fsize() {
		return qna_fsize;
	}
	public void setQna_fsize(int qna_fsize) {
		this.qna_fsize = qna_fsize;
	}
	public String getQna_pwd() {
		return qna_pwd;
	}
	public void setQna_pwd(String qna_pwd) {
		this.qna_pwd = qna_pwd;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	
	
	
	
	
}
