//¿Â¡÷»Ø
package com.hanbit.data;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.hanbit.vo.PackageVo;

public class AdminManager {

	private static SqlSessionFactory factory;
	
	static{
		try{
			Reader reader= Resources.getResourceAsReader("com/hanbit/data/sqlMapConfig.xml");
			factory= new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	}
	
	public static List<PackageVo> list()
	{
		SqlSession session= factory.openSession();
		List<PackageVo> list =session.selectList("admin.list");
		return list;
	}
}
