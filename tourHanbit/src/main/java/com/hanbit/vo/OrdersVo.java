package com.hanbit.vo;

import java.util.Date;

public class OrdersVo {
	
	private int item_key;
	private String item_name;
	private int price;
	private int orders_su;
	public int getItem_key() {
		return item_key;
	}
	public void setItem_key(int item_key) {
		this.item_key = item_key;
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
	public int getOrders_su() {
		return orders_su;
	}
	public void setOrders_su(int orders_su) {
		this.orders_su = orders_su;
	}
	public OrdersVo(int item_key, String item_name, int price, int orders_su) {
		super();
		this.item_key = item_key;
		this.item_name = item_name;
		this.price = price;
		this.orders_su = orders_su;
	}
	public OrdersVo() {
		super();
		// TODO Auto-generated constructor stub
	}
}
