package com.hanbit.vo;
//¹é¼¼¿¬
public class SubPackageVo {
	private String item_key_sub;
	private int item_key;
	private int price_sub;
	private String d_date;
	private String a_date;
	private String airplane;
	private int reser_sub;
	
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
	public SubPackageVo(String item_key_sub, int item_key, int price_sub, String d_date, String a_date, String airplane,
			int reser_sub) {
		super();
		this.item_key_sub = item_key_sub;
		this.item_key = item_key;
		this.price_sub = price_sub;
		this.d_date = d_date;
		this.a_date = a_date;
		this.airplane = airplane;
		this.reser_sub = reser_sub;
	}
	public SubPackageVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
