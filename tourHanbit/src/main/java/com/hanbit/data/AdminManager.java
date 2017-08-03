//장주환
package com.hanbit.data;

import java.io.Reader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.hanbit.vo.ImageVo;
import com.hanbit.vo.MemberVo;
import com.hanbit.vo.OrdersVo;
import com.hanbit.vo.PackageVo;
import com.hanbit.vo.ScheduleVo;
import com.hanbit.vo.SubPackageVo;

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

	public static Object insertItem(PackageVo piv, ArrayList<String> fnames, ArrayList<ScheduleVo> s_list) {
		SqlSession session= factory.openSession(true);
		
			HashMap pMap= new HashMap();
			pMap.put("item_key",piv.getItem_key());
			pMap.put("intro_text",piv.getIntro_text());
			pMap.put("price",piv.getPrice());
			pMap.put("city",piv.getCity());
			pMap.put("item_name",piv.getItem_name());
				
			session.insert("admin.insertPackage",pMap);
			
			HashMap imgMap= new HashMap();
			imgMap.put("item_key", piv.getItem_key());
			for(int i=0;i<fnames.size();i++)
			{
				imgMap.put("image"+(i+1),fnames.get(i) );
			}
			
			session.insert("admin.insertImage",imgMap);
			
			HashMap sMap= new HashMap();
			for(int j=0;j<s_list.size();j++)
			{
				sMap.put("item_key", s_list.get(j).getItem_key());
				sMap.put("day_number",s_list.get(j).getDay_number());
				sMap.put("content", s_list.get(j).getContent());
				session.insert("admin.insertSchedule",sMap);
			}
		return null;
	}

	public static void insertSubItem(SubPackageVo spv) {
		SqlSession session=factory.openSession(true);
			HashMap subMap= new HashMap();
			int item_key= spv.getItem_key();
			int price_sub= spv.getPrice_sub();
			String d_date= spv.getD_date_str();
			String a_date= spv.getA_date_str();
			String d_date_time= spv.getD_date_str_time();
			String a_date_time= spv.getA_date_str_time();		
			
			String airplace= spv.getAirplane();
			
			String item_key_sub= item_key+"_";
			item_key_sub += d_date+"";
	
			d_date= d_date+d_date_time;
			a_date= a_date+a_date_time;
			
			
			subMap.put("item_key_sub", item_key_sub);
			subMap.put("item_key", item_key);
			subMap.put("price_sub", price_sub);
			subMap.put("d_date", d_date);
			subMap.put("a_date", a_date);
			
			subMap.put("airplane", airplace);
			
			session.insert("admin.insertSubItem",subMap);
	}

	public static PackageVo getDetailItEM(int item_key) {
		SqlSession session= factory.openSession();
		
		PackageVo p=session.selectOne("admin.getDetailItem",item_key);
		
		return p;
		
	}

	public static List<SubPackageVo> getSubCount(int item_key) {
			SqlSession session= factory.openSession();
			
			List<SubPackageVo> list=session.selectList("admin.getSubCount",item_key);
		
			return list;
	}

		public static int adminDeleteItem(int item_key) {
			
			SqlSession session= factory.openSession(true);
			int re=-1;			
				re=session.delete("admin.deleteItem",item_key);
				System.out.println("삭제완료");
			return re;
		}

		public static SubPackageVo adminDetailSubItem(String item_key_sub) {
			// TODO Auto-generated method stub
			SqlSession session= factory.openSession();
			
			SubPackageVo spv= session.selectOne("admin.detailSubItem",item_key_sub);
				String d_dateALL=spv.getD_date_str();
				String a_dateALL=spv.getA_date_str();
				
				int d_idx=d_dateALL.indexOf(":")-2;
				int a_idx=a_dateALL.indexOf(":")-2;
				
				String d_date= d_dateALL.substring(0, d_idx).trim();
				String a_date= a_dateALL.substring(0, a_idx).trim();
				String d_time= d_dateALL.substring(d_idx);
				String a_time= a_dateALL.substring(a_idx);
				
				spv.setD_date_str(d_date);
				spv.setA_date_str(a_date);
				spv.setD_date_str_time(d_time);
				spv.setA_date_str_time(a_time);
			return spv;
		}

		public static List<ScheduleVo> getSchedule(int item_key) {
			SqlSession session= factory.openSession();
			
			List<ScheduleVo> svList= session.selectList("admin.getSchedule",item_key);
			
			return svList;
		}

		public static ImageVo getImages(int item_key) {
			SqlSession session= factory.openSession();
			
			ImageVo iv= session.selectOne("admin.getImages",item_key);
			
			return iv;
		}

		public static int adminUpdateItem(ArrayList<String> fnames, PackageVo pv, String[] days) {
			SqlSession session= factory.openSession(true);
			
			HashMap pMap= new HashMap();
			
			pMap.put("item_key", pv.getItem_key());
			pMap.put("intro_text", pv.getIntro_text());
			pMap.put("price", pv.getPrice());
			pMap.put("city", pv.getCity());
			pMap.put("reser", pv.getReser());
			pMap.put("item_name", pv.getItem_name());
			
			
			session.update("admin.updateItem",pMap);
			
			HashMap imgMap= new HashMap();
			imgMap.put("item_key", pv.getItem_key());
			for(int i=0;i<fnames.size();i++)
			{
				imgMap.put("image"+(i+1),fnames.get(i) );
			}
			
			int re=session.update("admin.updateImage",imgMap);
			
			HashMap sMap= new HashMap();
			
			
			sMap.put("item_key", pv.getItem_key());
		
			int i=0;
			for(int j=1;j<=days.length;j++)
			{
				
				sMap.put("day_number",j);
				sMap.put("content", days[i]);
				int se=session.update("admin.updateSchedule",sMap);
				i++;
			}			
			
			return re;
		}

		public static List<OrdersVo> ordersList() {
			
			SqlSession session= factory.openSession();
			
			List<OrdersVo> list=session.selectList("admin.ordersList");
			return list;
		}

		public static int adminOrdersCheck(String orderid) {
			SqlSession session= factory.openSession(true);
			
			int r=session.update("admin.ordersCheck",orderid);
			
			return r;
		}

		public static int adminOrdersCancel(String orderid) {
			SqlSession session= factory.openSession(true);
			
			int r=session.delete("admin.ordersCancel",orderid);
			
			return r;
		}

		public static void adminUpdateSubItem(SubPackageVo s) {
			// TODO Auto-generated method stub
			SqlSession session= factory.openSession(true);
			
			String item_key_sub= s.getItem_key_sub();
			int price_sub= s.getPrice_sub();
			String d_date_str=s.getD_date_str();
			String a_date_str=s.getA_date_str();
			String d_date_str_time=s.getD_date_str_time();
			String a_date_str_time=s.getA_date_str_time();
			String airplane= s.getAirplane();
			
			String d_date=d_date_str+d_date_str_time;
			String a_date=a_date_str+a_date_str_time;
			
			HashMap map= new HashMap();
			
			map.put("item_key_sub", item_key_sub);
			map.put("price_sub", price_sub);
			map.put("airplane", airplane);
			map.put("d_date", d_date);
			map.put("a_date", a_date);
			
			
			
			session.update("admin.updateSubItem",map);
			
		}
}
