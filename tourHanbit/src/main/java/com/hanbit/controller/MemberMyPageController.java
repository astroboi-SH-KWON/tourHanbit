package com.hanbit.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hanbit.dao.MemberDao;
import com.hanbit.vo.MemberVo;
import com.hanbit.vo.OrdersVo;
import com.hanbit.vo.ReviewVo;

@Controller
public class MemberMyPageController {

	@Autowired
	private MemberDao dao;

	public void setDao(MemberDao dao) {
		this.dao = dao;
	}
	
	
	@RequestMapping("/member/memberMypage.do")
	public ModelAndView mypage_member(HttpSession session, MemberVo m,OrdersVo o)
	{
		ModelAndView mav = new ModelAndView();
		String mem_id=(String)session.getAttribute("id");
		ArrayList<Integer> mypage_item_key_list = (ArrayList<Integer>)session.getAttribute("mypage_item_key_list");
		
	/*	List<ReviewVo> onlyone=dao.reviewonlyone(mypage_item_key_list,mem_id);*/
		
		
		MemberVo mem_update_ready = dao.membermypage(mem_id);
		List<OrdersVo> Paymentdetails= dao.paymentdetails(mem_id);
		
		List<OrdersVo> mem_recommendation = dao.recommendation(mem_id,mypage_item_key_list);
		
		

		session.setAttribute("mem_update_ready", mem_update_ready);
	
		mav.addObject("title","���� ���� ����");
		mav.addObject("myqnaa","���� ���� ����");
		
		
		mav.addObject("Paymentdetails",Paymentdetails);
		mav.addObject("myqna",dao.myqna(mem_id));
		mav.addObject("membermypage",dao.membermypage(mem_id));
		mav.addObject("order", mem_id);
		mav.addObject("mem_recommendation",mem_recommendation);
		mav.addObject("m",m);
		
		mav.addObject("viewPage", "memberMypage.jsp");
		mav.setViewName("/member/template");
		
		return mav;
	}

}
