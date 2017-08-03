package com.hanbit.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hanbit.dao.MemberDao;
import com.hanbit.vo.MemberVo;
import com.hanbit.vo.OrdersVo;

@Controller
public class MemberMyPageController {

	@Autowired
	private MemberDao dao;

	public void setDao(MemberDao dao) {
		this.dao = dao;
	}
	
	
	@RequestMapping("/member/memberMypage.do")
	public ModelAndView mypage_member(HttpSession session, MemberVo m)
	{
		ModelAndView mav = new ModelAndView();
		String mem_id=(String)session.getAttribute("id");
		
		MemberVo mem_update_ready = dao.membermypage(mem_id);
		List<OrdersVo> Paymentdetails= dao.paymentdetails(mem_id);
		
		session.setAttribute("mem_update_ready", mem_update_ready);
	
		mav.addObject("title","나의 예약 내역");
		mav.addObject("myqnaa","나의 문의 내역");
		mav.addObject("Paymentdetails",dao.paymentdetails(mem_id));
		mav.addObject("myqna",dao.myqna(mem_id));
		mav.addObject("membermypage",dao.membermypage(mem_id));
		mav.addObject("order", mem_id);

		mav.addObject("m",m);
		
		mav.addObject("viewPage", "memberMypage.jsp");
		mav.setViewName("/member/template");
		
		return mav;
	}

}
