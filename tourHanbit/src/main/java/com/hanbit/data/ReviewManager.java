package com.hanbit.data;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.hanbit.vo.ReviewVo;

public class ReviewManager {

	private static SqlSessionFactory factory;
	
	static
	{
		try{
			Reader reader = Resources.getResourceAsReader("com/hanbit/data/sqlMapConfig2.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		}catch(Exception e){System.out.println(e.getMessage());}
	}
	
	
	public static int insertreview(ReviewVo r) {
		
		SqlSession session = factory.openSession(true);
		int re = session.insert("review.insertreview",r);
		session.close();
		return re;
	}



	/*public static List<ReviewVo> reivewonlyone(int review_item_key) {
		
		SqlSession session = factory.openSession();
		System.out.println("매니저에서"+review_item_key);
		List<ReviewVo> rv =  session.selectList("review.reviewonlyone",review_item_key);
		return rv;
	}*/

}
