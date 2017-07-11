//¹é¼¼¿¬
package com.hanbit.vo;

public class ScheduleVo {
  int item_key;
  int day_number;
  String content;
public ScheduleVo(int item_key, int day_number, String content) {
	super();
	this.item_key = item_key;
	this.day_number = day_number;
	this.content = content;
}
public ScheduleVo() {
	super();
	// TODO Auto-generated constructor stub
}
public int getItem_key() {
	return item_key;
}
public void setItem_key(int item_key) {
	this.item_key = item_key;
}
public int getDay_number() {
	return day_number;
}
public void setDay_number(int day_number) {
	this.day_number = day_number;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
  
  
}
