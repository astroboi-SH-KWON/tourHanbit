//장주환
package com.hanbit.dao;

import java.util.List;

import org.springframework.stereotype.Repository;


import com.hanbit.data.AdminManager;
import com.hanbit.data.PageManager;
import com.hanbit.vo.MemberVo;
import com.hanbit.vo.OrdersVo;
import com.hanbit.vo.PackageVo;

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
		System.out.println("end : "+end);
		System.out.println("totalPage : "+totalPage);
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
}
