//±Ç¼¼Çõ

package com.hanbit.data;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.hanbit.vo.PackageVo;

public class PageManager {
	private static SqlSessionFactory factory;
	static{
		try{
			Reader read= Resources.getResourceAsReader("com/hanbit/data/sqlMapConfig.xml");
			factory= new SqlSessionFactoryBuilder().build(read);
			read.close();
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
	}
	public static List<PackageVo> getMainImage(String item01, String item02){
		SqlSession session=	factory.openSession();
		HashMap<String, String> map= new HashMap<String, String>();
		map.put("item01", item01);
		map.put("item02", item02);
		List<PackageVo> list=	session.selectList("page.getMainImage",map);
		session.close();
		return list;
	}
	public static List<PackageVo> getBestImage(String item01, String item02, String rownum) {
		// TODO Auto-generated method stub
		SqlSession session=	factory.openSession();
		HashMap<String, String> map= new HashMap<String, String>();
		map.put("item01", item01);
		map.put("item02", item02);
		map.put("rownum", rownum);
		List<PackageVo> list=	session.selectList("page.getBestImage",map);
		session.close();
		return list;
	}
	public static List<PackageVo> getEventImage(String item01, String item02) {
		// TODO Auto-generated method stub
		SqlSession session=	factory.openSession();
		HashMap<String, String> map= new HashMap<String, String>();
		map.put("item01", item01);
		map.put("item02", item02);
		List<PackageVo> list=	session.selectList("page.getEventImage",map);
		session.close();
		return list;
	}
}
