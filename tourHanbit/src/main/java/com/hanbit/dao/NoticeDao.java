package com.hanbit.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hanbit.data.NoticeManager;
import com.hanbit.vo.NoticeVo;

@Repository
public class NoticeDao {

	
	public static int pageSIZE = 4;
	public static int totalRecord;
	public static int totalPage;
	public static int pageGroup = 3;
	
	
	public String getPageStr(int pageNUM,String searchField,String keyword)
	{
		
		int start = 
				(pageNUM + pageGroup-1) / pageGroup * pageGroup - (pageGroup-1);				
				
				int end = start+pageGroup-1;
				
				
				if(end > totalPage)
					end=totalPage;
				
				String str = "";
				
				System.out.println("start:"+start);
				
				if( start > pageGroup  )
				{
					str = str + "<a href='listNotice.do?pageNUM="+(start-1)+"'>[이전]</a>&nbsp;";
				}
				
				
				for(int i=start; i<= end; i++)
				{
					str = str + "<a href='listNotice.do?pageNUM="+i+"'>"+ i + "</a>&nbsp;";
				}
				
				if( end < totalPage  )
				{
					str = str + "<a href='listNotice.do?pageNUM="+(end+1)+"'>[다음]</a>&nbsp;";
				}
		
		
		
		return str;
	}
	
	
	public int getNextNo()
	{
		return NoticeManager.getNextNo();
	}
	
	public int getTotal(String searchField,String keyword)
	{
		return NoticeManager.getTotal(searchField,keyword);
	}
	
	public List<NoticeVo> listNotice(int start, int end, String searchField,String keyword)
	{
		totalRecord= getTotal(searchField,keyword);
		totalPage = (int)Math.ceil((double)totalRecord/pageSIZE);
		System.out.println("totalRecord:"+ totalRecord);
		System.out.println("totalPage:"+ totalPage);
		return NoticeManager.list(start,end,searchField,keyword);
	}
	
	public int insertNotice(NoticeVo n)
	{
		return NoticeManager.insertNotice(n);
	}
	
	
	public NoticeVo detailNotice(int notice_number)
	{
		return NoticeManager.detailNotice(notice_number);
	}
	public int updateHit(int notice_number)
	{
		return NoticeManager.updateHit(notice_number);
	}
	
	public int deleteNotice(int notice_number)
	{
		return NoticeManager.deleteNotice(notice_number);
	}
	
	public int updateNotice(NoticeVo n)
	{
		return NoticeManager.updateNotice(n);
	}
	
	
	
}
