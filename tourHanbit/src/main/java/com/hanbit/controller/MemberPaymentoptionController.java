package com.hanbit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hanbit.dao.MemberDao;

@Controller
public class MemberPaymentoptionController {

@Autowired
private MemberDao dao;

	
	
	@RequestMapping("/member/paymentoption.do")
	public ModelAndView paymentoption()
	{
		ModelAndView mav = new ModelAndView();
		/*mav.addObject("title", "title");
		mav.setViewName("redirect:/member/paymentoption.do");*/
		return mav;
	}
}
