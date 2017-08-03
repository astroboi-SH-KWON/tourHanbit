package com.hanbit.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hanbit.dao.MemberDao;
import com.hanbit.vo.OrdersVo;

@Controller
public class MemberPaymentdetailsDeleteController {

	@Autowired
	private MemberDao dao;

	public void setDao(MemberDao dao) {
		this.dao = dao;
	}
	@RequestMapping("/member/memberMypagedelete.do")
	public ModelAndView memberPaymentdetailsDelete(String orderid)
	{
		ModelAndView mav = new ModelAndView();
		mav.addObject("orderid", dao.memberpaymentdetailsdelete(orderid));
		mav.setViewName("redirect:/member/memberMypage.do");
		return mav;
	}
	
}
