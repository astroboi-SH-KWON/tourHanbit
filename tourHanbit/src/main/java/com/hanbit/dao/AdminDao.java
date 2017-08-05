//장주환
package com.hanbit.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Repository;


import com.hanbit.data.AdminManager;
import com.hanbit.data.PageManager;
import com.hanbit.vo.ImageVo;
import com.hanbit.vo.MemberVo;
import com.hanbit.vo.OrdersVo;
import com.hanbit.vo.PackageVo;
import com.hanbit.vo.ScheduleVo;
import com.hanbit.vo.SubPackageVo;

@Repository
public class AdminDao {
	
	public static int pageSIZE=5;
	
	public static int totalRecord;
	
	public static int totalPage;
	
	public static int pageGROUP=2;
	
	
	public String getPageStr(int pageNUM)
	{
		int start= (pageNUM+pageGROUP-1) / pageGROUP * pageGROUP- (pageGROUP-1);
		
		
		int end= start +pageGROUP-1;
		
		if(end>totalPage)
		{
			end=totalPage;
		}
		
		String str="";
		
		if(start > pageGROUP)
		{
			str+="<a href='adminListItem.do?pageNUM="+(start-1)+"'>"+"[이전]"+"</a>";
		}
		for(int i=start;i<=end;i++)
		{
			str +="<a href='adminListItem.do?pageNUM="+i+"'>"+i+""+"  "+"</a>";
			
		}
		
		if( end <totalPage)
		{
			str +="<a href='adminListItem.do?pageNUM="+(end+1)+"'>"+"[다음]"+"</a>";
		}
		
		return str;
	}
	public int getTotal()
	{
		return AdminManager.getTotal();
	}
	
	
	public List<OrdersVo> adminMainList(){
		
		return AdminManager.adminMainList();
	}
	public List<MemberVo> memberList() {
		// TODO Auto-generated method stub
		return AdminManager.memberList();
	}
	public List<PackageVo> adminPackageList(int start, int end) {
		
		totalRecord= getTotal();
		totalPage=(int)Math.ceil((double) totalRecord/pageSIZE);
		
		return AdminManager.adminPackageList(start,end);
		
	}
	public void insertItem(PackageVo piv, ArrayList<String> fnames, ArrayList<ScheduleVo> s_list) {
		
		 AdminManager.insertItem(piv, fnames, s_list);
		
	}
	public void insertSubItem(SubPackageVo spv) {
		AdminManager.insertSubItem(spv);
		
	}
	public PackageVo getDetailItem(int item_key) {
		return AdminManager.getDetailItEM(item_key);
	}
	public List<SubPackageVo> getSubCount(int item_key) {
		
		return AdminManager.getSubCount(item_key);
	}
	public int adminDeleteItem(int item_key) {
			
		return AdminManager.adminDeleteItem(item_key);
		
	}
	public SubPackageVo adminDetailSubItem(String item_key_sub) {
		return AdminManager.adminDetailSubItem(item_key_sub);
		
	}
	public List<ScheduleVo> getSchedule(int item_key) {
		
		return AdminManager.getSchedule(item_key);
	}
	public ImageVo getImages(int item_key) {
		
		ImageVo iv=AdminManager.getImages(item_key);
		
		return iv;
	}
	public int adminUpdateItem(ArrayList<String> fnames, PackageVo pv, String[] days) {
		return AdminManager.adminUpdateItem(fnames,pv,days);
		
	}
	public List<OrdersVo> ordersList() {
		return AdminManager.ordersList();
		
	}
	public int adminOrdersCheck(String orderid) {
		return AdminManager.adminOrdersCheck(orderid);
		
	}
	public int adminOrdersCancel(String orderid) {
		// TODO Auto-generated method stub
		return AdminManager.adminOrdersCancel(orderid);
	}
	public void adminUpdateSubItem(SubPackageVo s) {
		 AdminManager.adminUpdateSubItem(s);
		
	}
	public void adminDeleteSubItem(String item_key_sub, int item_key) {
		AdminManager.adminDeleteSubItem(item_key_sub, item_key);
	}
	public MemberVo adminMemberDetail(String mem_id) {
		return AdminManager.adminMemberDetail(mem_id);
		
	}
}
