package com.hanbit.vo;

import java.util.Date;

//¹é¼¼¿¬
public class SubPackageVo {
	private String item_key_sub;
	private int item_key;
	private int price_sub;
	private String d_date;
	private String a_date;
	private String airplane;
	private int reser_sub;
	private Date d_date_dType;
	private Date a_date_dType;
	private String d_date_str;
	private String a_date_str;
	private String d_date_str_time;
	private String a_date_str_time;
	public SubPackageVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SubPackageVo(String item_key_sub, int item_key, int price_sub, String d_date, String a_date, String airplane,
			int reser_sub, Date d_date_dType, Date a_date_dType, String d_date_str, String a_date_str,
			String d_date_str_time, String a_date_str_time) {
		super();
		this.item_key_sub = item_key_sub;
		this.item_key = item_key;
		this.price_sub = price_sub;
		this.d_date = d_date;
		this.a_date = a_date;
		this.airplane = airplane;
		this.reser_sub = reser_sub;
		this.d_date_dType = d_date_dType;
		this.a_date_dType = a_date_dType;
		this.d_date_str = d_date_str;
		this.a_date_str = a_date_str;
		this.d_date_str_time = d_date_str_time;
		this.a_date_str_time = a_date_str_time;
	}
	public String getItem_key_sub() {
		return item_key_sub;
	}
	public void setItem_key_sub(String item_key_sub) {
		this.item_key_sub = item_key_sub;
	}
	public int getItem_key() {
		return item_key;
	}
	public void setItem_key(int item_key) {
		this.item_key = item_key;
	}
	public int getPrice_sub() {
		return price_sub;
	}
	public void setPrice_sub(int price_sub) {
		this.price_sub = price_sub;
	}
	public String getD_date() {
		return d_date;
	}
	public void setD_date(String d_date) {
		this.d_date = d_date;
	}
	public String getA_date() {
		return a_date;
	}
	public void setA_date(String a_date) {
		this.a_date = a_date;
	}
	public String getAirplane() {
		return airplane;
	}
	public void setAirplane(String airplane) {
		this.airplane = airplane;
	}
	public int getReser_sub() {
		return reser_sub;
	}
	public void setReser_sub(int reser_sub) {
		this.reser_sub = reser_sub;
	}
	public Date getD_date_dType() {
		return d_date_dType;
	}
	public void setD_date_dType(Date d_date_dType) {
		this.d_date_dType = d_date_dType;
	}
	public Date getA_date_dType() {
		return a_date_dType;
	}
	public void setA_date_dType(Date a_date_dType) {
		this.a_date_dType = a_date_dType;
	}
	public String getD_date_str() {
		return d_date_str;
	}
	public void setD_date_str(String d_date_str) {
		this.d_date_str = d_date_str;
	}
	public String getA_date_str() {
		return a_date_str;
	}
	public void setA_date_str(String a_date_str) {
		this.a_date_str = a_date_str;
	}
	public String getD_date_str_time() {
		return d_date_str_time;
	}
	public void setD_date_str_time(String d_date_str_time) {
		this.d_date_str_time = d_date_str_time;
	}
	public String getA_date_str_time() {
		return a_date_str_time;
	}
	public void setA_date_str_time(String a_date_str_time) {
		this.a_date_str_time = a_date_str_time;
	}
	
}
