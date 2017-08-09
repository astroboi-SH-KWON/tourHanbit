//¼¼¿¬

package com.hanbit.data;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.hanbit.vo.ImageVo;
import com.hanbit.vo.PackageVo;
import com.hanbit.vo.QnaVo;
import com.hanbit.vo.ReviewVo;
import com.hanbit.vo.ScheduleVo;
import com.hanbit.vo.SubPackageVo;



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
	public static PackageVo detailPackage(int item_key){
		
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
	public static int btnsu(int item_key) {
		// TODO Auto-generated method stub
		
		SqlSession session = factory.openSession();
		
		int re=session.selectOne("detailPackage.btnSu", item_key);
		return re;
	}
	public static List<SubPackageVo> listSubPackage(int item_key) {
		// TODO Auto-generated method stub
		SqlSession session= factory.openSession();
		List<SubPackageVo> list= session.selectList("detailPackage.selectSubPackage",item_key);
		return list;
	}
	public static SubPackageVo detailSubPackage(String item_key_sub) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		SubPackageVo sp=session.selectOne("detailPackage.detailSubPackage",item_key_sub);
		return sp;
	}
	public static int insertOrder(int item_key, String item_key_sub, int orders_su,String ageGroup, String mem_id, int totPrice) {
		// TODO Auto-generated method stub
		SqlSession session=  factory.openSession(true);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("item_key", item_key);
		map.put("item_key_sub", item_key_sub);
		map.put("orders_su",orders_su);
		map.put("mem_id", mem_id);
		map.put("totPrice", totPrice);
		map.put("ageGroup", ageGroup);
		int re = session.insert("detailPackage.insertOrder", map);
		return re;
	}
	public static int addHit(int item_key) {
		// TODO Auto-generated method stub
		SqlSession session= factory.openSession(true);
		int re= session.update("detailPackage.addHit", item_key);
		return re;
	}
	public static List<ReviewVo> listReview(int start, int end, int item_key) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("item_key", item_key);
		
		List<ReviewVo> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("detailPackage.selectReview",map);
		return list;
	}
	public static int getTotal() {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		int re = session.selectOne("detailPackage.getTotal");
		session.close();
		return re;
		
	}
	
}
