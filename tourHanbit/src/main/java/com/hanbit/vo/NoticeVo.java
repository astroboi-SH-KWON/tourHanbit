package com.hanbit.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class NoticeVo {

	private int notice_number;
	private String notice_title;
	private String notice_content;
	private int notice_hit;
	private String notice_date;
	private String notice_fname;
	private int notice_fsize;
	private int notice_top;
	private MultipartFile uploadFile;
	public int getNotice_number() {
		return notice_number;
	}
	public void setNotice_number(int notice_number) {
		this.notice_number = notice_number;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public int getNotice_hit() {
		return notice_hit;
	}
	public void setNotice_hit(int notice_hit) {
		this.notice_hit = notice_hit;
	}
	public String getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}
	public String getNotice_fname() {
		return notice_fname;
	}
	public void setNotice_fname(String notice_fname) {
		this.notice_fname = notice_fname;
	}
	public int getNotice_fsize() {
		return notice_fsize;
	}
	public void setNotice_fsize(int notice_fsize) {
		this.notice_fsize = notice_fsize;
	}
	public int getNotice_top() {
		return notice_top;
	}
	public void setNotice_top(int notice_top) {
		this.notice_top = notice_top;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public NoticeVo(int notice_number, String notice_title, String notice_content, int notice_hit, String notice_date,
			String notice_fname, int notice_fsize, int notice_top, MultipartFile uploadFile) {
		super();
		this.notice_number = notice_number;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_hit = notice_hit;
		this.notice_date = notice_date;
		this.notice_fname = notice_fname;
		this.notice_fsize = notice_fsize;
		this.notice_top = notice_top;
		this.uploadFile = uploadFile;
	}
	public NoticeVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
	
}
