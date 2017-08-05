package com.hanbit.vo;

import java.util.Date;

public class MemberVo {

	
	private String mem_id;
	private String mem_pwd;
	private String mem_name;
	private String mem_addr;
	private String mem_gender;
	private String mem_email;
	private String mem_phone;
	private String mem_birthday;
	private String orderid;
	private int item_key;
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pwd() {
		return mem_pwd;
	}
	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_addr() {
		return mem_addr;
	}
	public void setMem_addr(String mem_addr) {
		this.mem_addr = mem_addr;
	}
	public String getMem_gender() {
		return mem_gender;
	}
	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_phone() {
		return mem_phone;
	}
	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}
	public String getMem_birthday() {
		return mem_birthday;
	}
	public void setMem_birthday(String mem_birthday) {
		this.mem_birthday = mem_birthday;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public int getItem_key() {
		return item_key;
	}
	public void setItem_key(int item_key) {
		this.item_key = item_key;
	}
	public MemberVo(String mem_id, String mem_pwd, String mem_name, String mem_addr, String mem_gender,
			String mem_email, String mem_phone, String mem_birthday, String orderid, int item_key) {
		super();
		this.mem_id = mem_id;
		this.mem_pwd = mem_pwd;
		this.mem_name = mem_name;
		this.mem_addr = mem_addr;
		this.mem_gender = mem_gender;
		this.mem_email = mem_email;
		this.mem_phone = mem_phone;
		this.mem_birthday = mem_birthday;
		this.orderid = orderid;
		this.item_key = item_key;
	}
	public MemberVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
