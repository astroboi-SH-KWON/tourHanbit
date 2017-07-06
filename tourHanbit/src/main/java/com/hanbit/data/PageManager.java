package com.hanbit.data;

import java.io.Reader;
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
	public void getMainImage(){
		SqlSession session=	factory.openSession();
		session.selectList("");
	}
}
