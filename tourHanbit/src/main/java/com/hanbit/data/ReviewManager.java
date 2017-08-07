package com.hanbit.data;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.hanbit.vo.ReviewVo;

public class ReviewManager {

	private static SqlSessionFactory factory;
	
	static
	{
		try{
			Reader reader = Resources.getResourceAsReader("com/hanbit/data/sqlMapConfig2.xml");
			reader.close();
		}catch(Exception e){System.out.println(e.getMessage());}
	}
	
	
	public static int insertreview(ReviewVo r) {
		
		SqlSession session = factory.openSession(true);
		int re = session.insert("review.insertreview",r);
		session.close();
		return re;
	}

}
