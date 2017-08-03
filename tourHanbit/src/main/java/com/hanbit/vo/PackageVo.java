//±Ç¼¼Çõ

package com.hanbit.vo;

import java.util.Date;

public class PackageVo {
	private int item_key,price,reser;
	private String intro_text,d_date_str,a_date_str,airplane,city,item_name,image01,city_id;
	private Date a_date,d_date;
	public int getItem_key() {
		return item_key;
	}
	public void setItem_key(int item_key) {
		this.item_key = item_key;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getReser() {
		return reser;
	}
	public void setReser(int reser) {
		this.reser = reser;
	}
	public String getIntro_text() {
		return intro_text;
	}
	public void setIntro_text(String intro_text) {
		this.intro_text = intro_text;
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
	public String getAirplane() {
		return airplane;
	}
	public void setAirplane(String airplane) {
		this.airplane = airplane;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getImage01() {
		return image01;
	}
	public void setImage01(String image01) {
		this.image01 = image01;
	}
	public String getCity_id() {
		return city_id;
	}
	public void setCity_id(String city_id) {
		this.city_id = city_id;
	}
	public Date getA_date() {
		return a_date;
	}
	public void setA_date(Date a_date) {
		this.a_date = a_date;
	}
	public Date getD_date() {
		return d_date;
	}
	public void setD_date(Date d_date) {
		this.d_date = d_date;
	}
	public PackageVo(int item_key, int price, int reser, String intro_text, String d_date_str, String a_date_str,
			String airplane, String city, String item_name, String image01, String city_id, Date a_date, Date d_date) {
		super();
		this.item_key = item_key;
		this.price = price;
		this.reser = reser;
		this.intro_text = intro_text;
		this.d_date_str = d_date_str;
		this.a_date_str = a_date_str;
		this.airplane = airplane;
		this.city = city;
		this.item_name = item_name;
		this.image01 = image01;
		this.city_id = city_id;
		this.a_date = a_date;
		this.d_date = d_date;
	}
	public PackageVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
