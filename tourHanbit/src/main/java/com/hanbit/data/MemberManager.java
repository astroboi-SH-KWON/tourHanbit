package com.hanbit.data;

import java.io.Reader;
import java.io.ObjectOutputStream.PutField;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.swing.plaf.basic.BasicScrollPaneUI.HSBChangeListener;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.core.annotation.Order;

import com.hanbit.vo.MemberVo;
import com.hanbit.vo.OrdersVo;
import com.hanbit.vo.PackageVo;
import com.hanbit.vo.QnaVo;

public class MemberManager {

	private static SqlSessionFactory factory;
	
	static{
		try{
			Reader reader = Resources.getResourceAsReader("com/hanbit/data/sqlMapConfig2.xml");//sqlMapConfig.xml과 연결??
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
			
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public static List<MemberVo> memberlist() {
		
		SqlSession session = factory.openSession();
		List<MemberVo> list = session.selectList("member.memberselectAll");
		session.close();
		return list;
	}

	public static int memberjoin(MemberVo m) {
		int re =-1;
		SqlSession session = factory.openSession(true);

		System.out.println(m.getMem_id());
		System.out.println(m.getMem_pwd());
		System.out.println(m.getMem_name());		
		System.out.println(m.getMem_email());
		System.out.println(m.getMem_phone());
		
		re = session.insert("member.memberjoin", m);
		return re;
	}

	public static int memberupdate(MemberVo m) {
		
		int ru =-1;
		SqlSession session =factory.openSession(true);
		
		ru = session.update("member.memberupdate",m);
		
		return ru;
	}

	public static String memberlogin(String mem_id, String mem_pwd) {
		
		int re = -1;
		SqlSession session = factory.openSession();
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("mem_id", mem_id);
		map.put("mem_pwd", mem_pwd);

		String id = session.selectOne("member.memberlogin",map);
		
		return id;
	}

	
	public static String memberfindpassword(String mem_id, String mem_email) {
		
		
		int re = -1;
		SqlSession session = factory.openSession();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("mem_id", mem_id);
		map.put("mem_email", mem_email);
		
		String mem_pwd = session.selectOne("member.memberfindpassword",map);
		
		return mem_pwd;
	}
	
	public static List<OrdersVo> memberpaymentdetails(String mem_id) {
			SqlSession session = factory.openSession();
			List<OrdersVo> list =session.selectList("member.paymentdetails",mem_id);
			
		return list;
	}

	public static List<QnaVo> memberqna(String mem_id) {
			SqlSession session = factory.openSession();
			List<QnaVo> qnalist = session.selectList("member.myqna",mem_id);
		return qnalist;
	}

	public static MemberVo membermypage(String mem_id) {
		
			SqlSession session = factory.openSession();
			MemberVo mv = session.selectOne("member.membermypage",mem_id);	
		return mv;
	}

	public static int paymentdetailsdelete(String orderid) {
			
			SqlSession session = factory.openSession(true);
			int ov =-1;
			ov = session.delete("member.paymentdetailsdelete",orderid);

		return ov;
	}


	public static int memberidoverlap(String mem_id_ok)
	{
		
		SqlSession session = factory.openSession();
		System.out.println(mem_id_ok);
		int mid_list = session.selectOne("member.memberidoverlap",mem_id_ok);
		session.close();
		return mid_list;
	}

/*	public static List<PackageVo> airplanorders(String city,String intro_text) {
		SqlSession session = factory.openSession();
		HashMap<String, String> map =  new HashMap<String, String>();
		
		map.put("city", "%"+city+"%");
		map.put("intro_text", "%"+intro_text+"%");
		List<PackageVo> airplanorders = session.selectList("member.airplanorders",map);
		return airplanorders;
	}*/

	public static List<PackageVo> airplaneorders(String oceania) {
		SqlSession session = factory.openSession();
		List<PackageVo> air_list = session.selectList("member.airplanorders",oceania);
		System.out.println("여기서는"+oceania);
		return air_list;
	}

}
