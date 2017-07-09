//¿Â¡÷»Ø
package com.hanbit.data;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.hanbit.vo.MemberVo;
import com.hanbit.vo.OrdersVo;
import com.hanbit.vo.PackageVo;

public class AdminManager {

	private static SqlSessionFactory factory;
	
	static{
		try{
			Reader reader= Resources.getResourceAsReader("com/hanbit/data/sqlMapConfig2.xml");
			factory= new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	}
	
	public static List<OrdersVo> adminMainList()
	{
		SqlSession session= factory.openSession();
		List<OrdersVo> list =session.selectList("admin.list");
		
		
		return list;
	}

	public static List<MemberVo> memberList() {
		
		SqlSession session= factory.openSession();
		List<MemberVo> list=session.selectList("admin.memberList");
		return list;
	}

	public static List<PackageVo> adminPackageList(int start, int end) {
		// TODO Auto-generated method stub
		SqlSession session= factory.openSession();
		HashMap map= new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		List<PackageVo> list=session.selectList("admin.adminPackageList",map);
		
		return list;
	}

	public static int getTotal() {
		SqlSession session = factory.openSession();
		int totalRecord= session.selectOne("admin.getTotal");
		return totalRecord;
	}
}
