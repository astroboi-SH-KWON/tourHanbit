//권세혁

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
	private static SqlSessionFactory factory1;
	static{
		try{
			Reader read= Resources.getResourceAsReader("com/hanbit/data/sqlMapConfig.xml");
			factory1= new SqlSessionFactoryBuilder().build(read);
			read.close();
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
	}
	public static List<PackageVo> getMainImage(String item01, String item02){
		SqlSession session=	factory1.openSession();
		HashMap<String, String> map= new HashMap<String, String>();
		map.put("item01", item01);
		map.put("item02", item02);
		List<PackageVo> list=	session.selectList("page.getMainImage",map);
		session.close();
		return list;
	}
	public static List<PackageVo> getBestImage(String item01, String item02, String rownum) {
		// TODO Auto-generated method stub
		SqlSession session=	factory1.openSession();
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
		//System.out.println(item01+" : "+item02);
		SqlSession session1=	factory1.openSession();
		HashMap<String, String> map= new HashMap<String, String>();
		map.put("item01", item01);
		map.put("item02", item02);
		List<PackageVo> list=	session1.selectList("page.getEventImage",map);
		session1.close();
		return list;
	}
	public static List<PackageVo> serchResults(String item, String srch, String startDay, String endDay,
			String amount) {
		// TODO Auto-generated method stub
		SqlSession session1=	factory1.openSession();
		HashMap<String, String> map= new HashMap<String, String>();
		map.put("item", item);
		map.put("srch", srch);
		map.put("startDay", startDay);
		map.put("endDay", endDay);
		if(amount!=null){
			map.put("from", amount.substring(0,amount.indexOf("만")).trim()+"0000");
			map.put("to", amount.substring(amount.indexOf("~"),amount.lastIndexOf("만")).trim()+"0000");
			//System.out.println(amount.substring(amount.indexOf("~")+1,amount.lastIndexOf("만")).trim()+"0000");			
		}
		List<PackageVo> list=	session1.selectList("page.serchResults",map);
		System.out.println("from mana :"+map.get("from"));
		System.out.println(map.get("to"));
		session1.close();
		return list;
	}
}
