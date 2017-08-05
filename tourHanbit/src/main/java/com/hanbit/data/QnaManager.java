package com.hanbit.data;


import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


import com.hanbit.vo.QnaVo;
import com.hanbit.vo.ReplyVo;

public class QnaManager {

	
	private static SqlSessionFactory factory;
	
	static
	{
		try {
			Reader reader = Resources.getResourceAsReader("com/hanbit/data/sqlMapConfig3.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	
	public static List<QnaVo> list(int start,int end, String searchField,String keyword)
	{
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("searchField", searchField);
		map.put("keyword", keyword);
		
		
		
		List<QnaVo> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("qna.selectAll",map);
		return list;
	}
	
	
	public static int getTotal(String searchField,String keyword)
	{
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchField", searchField);
		map.put("keyword", keyword);
		
		
		SqlSession session = factory.openSession(true);
		int re = session.selectOne("qna.getTotal",map);
		session.close();
		return re;
		
	}
	
	
	
	public static int updateQna(QnaVo q)
	{
		SqlSession session = factory.openSession(true);
		int re = session.update("qna.updateQna",q);
		session.close();
		return re;
	}
	
	
	public static int insertQna(QnaVo q)
	{
		SqlSession session = factory.openSession(true);
		System.out.println(q.getQna_number());
		System.out.println(q.getMem_id());
		System.out.println(q.getQna_title());
		System.out.println(q.getQna_content());
		System.out.println(q.getQna_fname());
		System.out.println(q.getQna_fsize());
		System.out.println(q.getQna_pwd());
		
		int re = session.insert("qna.insertQna",q);
		session.close();
		return re;
	}
	
	public static int getNextNo()
	{
		SqlSession session = factory.openSession(true);
		int re =  session.selectOne("qna.getNextNo");
		session.close();
		return re;
	}
	public static int getNextNo_c()
	{
		SqlSession session = factory.openSession(true);
		int re =  session.selectOne("qna.getNextNo_c");
		session.close();
		return re;
	}
	
	
	
	public static QnaVo detailQna(int qna_number)
	{
		SqlSession session = factory.openSession();
		QnaVo q = session.selectOne("qna.detailQna", qna_number);
		session.close();
		return q;

	}
	
	public static int deleteQna(int qna_number)
	{
		SqlSession session = factory.openSession(true);
		int re = session.delete("qna.deleteQna", qna_number);
		session.close();
		return re;

	}
	
	
	
	
	
	public static int insertReply(ReplyVo r)
	{
		SqlSession session = factory.openSession(true);
		int re = session.insert("qna.insertReply",r);
		session.close();
		return re;
	}
	public static int updateReply(ReplyVo r)
	{
		SqlSession session = factory.openSession(true);
		int re = session.update("qna.updateReply",r);
		session.close();
		return re;
	}
	public static int deleteReply(int rno)
	{
		SqlSession session = factory.openSession(true);
		int re = session.delete("qna.deleteReply", rno);
		session.close();
		return re;

	}
	
	public static ReplyVo getReply(int rno)
	{
		SqlSession session = factory.openSession(true);
		ReplyVo r = session.selectOne("qna.getReply", rno);
		session.close();
		return r;

	}
	
	public static List<ReplyVo> getReplyList(int qna_number)
	{
		List<ReplyVo> list2 = null;
		SqlSession session = factory.openSession();
		list2 = session.selectList("qna.getReplyList",qna_number);
		return list2;
	}
	
	
	
}
