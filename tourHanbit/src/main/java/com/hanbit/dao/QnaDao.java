package com.hanbit.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hanbit.data.QnaManager;

import com.hanbit.vo.QnaVo;
import com.hanbit.vo.ReplyVo;

@Repository
public class QnaDao {

	
	public static int pageSIZE = 4;
	public static int totalRecord;
	public static int totalPage;
	public static int pageGroup = 5;
	
	
	public String getPageStr(int pageNUM,String searchField,String keyword)
	{
		
		int start = 
				(pageNUM + pageGroup-1) / pageGroup * pageGroup - (pageGroup-1);				
				
				int end = start+pageGroup-1;
				
				
				String str = "";
				
				if( start > pageGroup  )
				{
					str = str + "<a href='listQna.do?pageNUM="+(start-1)+"'>[이전]</a>&nbsp;";
				}
				
				
				for(int i=start; i<= end; i++)
				{
					str = str + "<a href='listQna.do?pageNUM="+i+"'>"+ i + "</a>&nbsp;";
				}
				
				if( end < totalPage  )
				{
					str = str + "<a href='listQna.do?pageNUM="+(end+1)+"'>[다음]</a>&nbsp;";
				}
		
		
		
		return str;
	}
	
	
	public int getNextNo()
	{
		return QnaManager.getNextNo();
	}
	
	public int getNextNo_c()
	{
		return QnaManager.getNextNo_c();
	}
	
	public int getTotal(String searchField,String keyword)
	{
		return QnaManager.getTotal(searchField,keyword);
	}
	
	public List<QnaVo> listQna(int start, int end, String searchField,String keyword)
	{
		totalRecord= getTotal(searchField,keyword);
		totalPage = (int)Math.ceil((double)totalRecord/pageSIZE);
		System.out.println("totalRecord:"+ totalRecord);
		System.out.println("totalPage:"+ totalPage);
		return QnaManager.list(start,end,searchField,keyword);
	}
	
	public int insertQna(QnaVo q)
	{
		System.out.println(q.getQna_content());
		return QnaManager.insertQna(q);
	}
	
	
	public QnaVo detailQna(int qna_number)
	{
		return QnaManager.detailQna(qna_number);
	}
	
	public int deleteQna(int qna_number)
	{
		return QnaManager.deleteQna(qna_number);
	}
	
	public int updateQna(QnaVo q)
	{
		return QnaManager.updateQna(q);
	}
	
	
	
	
	
	
	
	public int insertReply(ReplyVo r)
	{
		return QnaManager.insertReply(r);
	}
	public int updateReply(ReplyVo r)
	{
		return QnaManager.updateReply(r);
	}
	public int deleteReply(int rno)
	{
		return QnaManager.deleteReply(rno);
	}
	public ReplyVo getReply(int rno)
	{
		return QnaManager.getReply(rno);
		
	}
	public List<ReplyVo> getReplyList(int qna_number)
	{
		return QnaManager.getReplyList(qna_number);
	}
	
	
	
	
	
}
