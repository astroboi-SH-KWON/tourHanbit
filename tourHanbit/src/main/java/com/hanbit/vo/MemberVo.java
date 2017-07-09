package com.hanbit.vo;

public class MemberVo {

	
	private String mem_id;
	private String mem_pw;
	private String mem_name;
	private String mem_addr;
	private String mem_gender;
	private int mem_jumin;
	private String mem_email;
	private String mem_phone;
	public MemberVo() {
		super();
		// TODO Auto-generated constructor stub
		
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
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
	public void setMem_gender(String meme_gender) {
		this.mem_gender = meme_gender;
	}
	public int getMem_jumin() {
		return mem_jumin;
	}
	public void setMem_jumin(int mem_jumin) {
		this.mem_jumin = mem_jumin;
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
	public MemberVo(String mem_id, String mem_pw, String mem_name, String mem_addr, String meme_gender, int mem_jumin,
			String mem_email, String mem_phone) {
		super();
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_name = mem_name;
		this.mem_addr = mem_addr;
		this.mem_gender = meme_gender;
		this.mem_jumin = mem_jumin;
		this.mem_email = mem_email;
		this.mem_phone = mem_phone;
	}

	
	
}
