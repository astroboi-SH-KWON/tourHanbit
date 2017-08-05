package com.hanbit.data;


import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.hanbit.vo.NoticeVo;

public class NoticeManager {

	
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
	
	
	public static List<NoticeVo> list(int start,int end, String searchField,String keyword)
	{
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("searchField", searchField);
		map.put("keyword", keyword);
		
		
		
		List<NoticeVo> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("notice.selectAll",map);
		return list;
	}
	
	
	public static int getTotal(String searchField,String keyword)
	{
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchField", searchField);
		map.put("keyword", keyword);
		
		
		SqlSession session = factory.openSession(true);
		int re = session.selectOne("notice.getTotal",map);
		System.out.println(re);
		session.close();
		return re;
		
	}
	
	
	
	public static int updateNotice(NoticeVo n)
	{
		SqlSession session = factory.openSession(true);
		int re = session.update("notice.updateNotice",n);
		session.close();
		return re;
	}
	
	
	public static int insertNotice(NoticeVo n)
	{
		SqlSession session = factory.openSession(true);
		System.out.println(n);
		int re = session.insert("notice.insertNotice",n);
		
		session.close();
		return re;
	}
	
	public static int getNextNo()
	{
		SqlSession session = factory.openSession(true);
		int re =  session.selectOne("notice.getNextNo");
		session.close();
		return re;
	}
	
	public static int updateHit(int notice_number)
	{
		SqlSession session = factory.openSession(true);
		int re = session.update("notice.updateHit",notice_number);
		session.close();
		return re;
		
	}
	
	public static NoticeVo detailNotice(int notice_number)
	{
		SqlSession session = factory.openSession();
		NoticeVo n = session.selectOne("notice.detailNotice", notice_number);
		session.close();
		return n;

	}
	
	public static int deleteNotice(int notice_number)
	{
		SqlSession session = factory.openSession(true);
		int re = session.delete("notice.deleteNotice", notice_number);
		session.close();
		return re;

	}
	
	
}
