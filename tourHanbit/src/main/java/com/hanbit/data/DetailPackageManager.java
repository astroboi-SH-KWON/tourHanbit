//¼¼¿¬

package com.hanbit.data;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.hanbit.vo.ImageVo;
import com.hanbit.vo.PackageVo;
import com.hanbit.vo.ScheduleVo;



public class DetailPackageManager {

	private static SqlSessionFactory factory=null;
	
	static{
		Reader reader;
		try {
			reader = Resources.getResourceAsReader("com/hanbit/data/sqlMapConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static PackageVo listPackage(int item_key){
		
		PackageVo p = null;
		SqlSession session=factory.openSession();
		p=session.selectOne("detailPackage.selectPackage",item_key);
		
		return p;
		
	}
	public static ImageVo listImage(int item_key){
		
		ImageVo i = null;
		SqlSession session=factory.openSession();
		i=session.selectOne("detailPackage.selectImage",item_key);
		
		return i;
		
	}
	public static List<ScheduleVo> listSchedule(int item_key){
		
		List<ScheduleVo> list = null;
		SqlSession session=factory.openSession();
		list=session.selectList("detailPackage.selectSchedule",item_key);
		
		return list;
		
	}
	
}
