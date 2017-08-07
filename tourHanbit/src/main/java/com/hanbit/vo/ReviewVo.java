package com.hanbit.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class ReviewVo {

	private int review_number; 
	private int item_key;
	private String mem_id;
	private String review_title;
	private Date review_date;
	private String review_content;
	private String review_fname;
	private String score;
	private MultipartFile uplodfile;
	
	public int getReview_number() {
		return review_number;
	}
	public void setReview_number(int review_number) {
		this.review_number = review_number;
	}
	public int getItem_key() {
		return item_key;
	}
	public void setItem_key(int item_key) {
		this.item_key = item_key;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_fname() {
		return review_fname;
	}
	public void setReview_fname(String review_fname) {
		this.review_fname = review_fname;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public MultipartFile getUplodfile() {
		return uplodfile;
	}
	public void setUplodfile(MultipartFile uplodfile) {
		this.uplodfile = uplodfile;
	}
	public ReviewVo(int review_number, int item_key, String mem_id, String review_title, Date review_date,
			String review_content, String review_fname, String score, MultipartFile uplodfile) {
		super();
		this.review_number = review_number;
		this.item_key = item_key;
		this.mem_id = mem_id;
		this.review_title = review_title;
		this.review_date = review_date;
		this.review_content = review_content;
		this.review_fname = review_fname;
		this.score = score;
		this.uplodfile = uplodfile;
	}
	public ReviewVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
	
	
	
	
}
