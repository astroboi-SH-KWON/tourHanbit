package com.hanbit.vo;

import java.util.Date;

public class OrdersVo {
	
	private int item_key;
	private String item_key_sub;
	private String item_name;
	private int price;
	private int price_sub;
	private int orders_su;
	private String orderid;
	private String mem_id;
	private Date orderdate;
	private String agegroup;
	private String deposit;
	private int totprice;
	public int getItem_key() {
		return item_key;
	}
	public void setItem_key(int item_key) {
		this.item_key = item_key;
	}
	public String getItem_key_sub() {
		return item_key_sub;
	}
	public void setItem_key_sub(String item_key_sub) {
		this.item_key_sub = item_key_sub;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPrice_sub() {
		return price_sub;
	}
	public void setPrice_sub(int price_sub) {
		this.price_sub = price_sub;
	}
	public int getOrders_su() {
		return orders_su;
	}
	public void setOrders_su(int orders_su) {
		this.orders_su = orders_su;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public Date getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}
	public String getAgegroup() {
		return agegroup;
	}
	public void setAgegroup(String agegroup) {
		this.agegroup = agegroup;
	}
	public String getDeposit() {
		return deposit;
	}
	public void setDeposit(String deposit) {
		this.deposit = deposit;
	}
	public int getTotprice() {
		return totprice;
	}
	public void setTotprice(int totprice) {
		this.totprice = totprice;
	}
	public OrdersVo(int item_key, String item_key_sub, String item_name, int price, int price_sub, int orders_su,
			String orderid, String mem_id, Date orderdate, String agegroup, String deposit, int totprice) {
		super();
		this.item_key = item_key;
		this.item_key_sub = item_key_sub;
		this.item_name = item_name;
		this.price = price;
		this.price_sub = price_sub;
		this.orders_su = orders_su;
		this.orderid = orderid;
		this.mem_id = mem_id;
		this.orderdate = orderdate;
		this.agegroup = agegroup;
		this.deposit = deposit;
		this.totprice = totprice;
	}
	public OrdersVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
