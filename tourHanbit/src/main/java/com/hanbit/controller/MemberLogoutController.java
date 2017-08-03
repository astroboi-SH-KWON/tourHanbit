package com.hanbit.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberLogoutController {

	@RequestMapping("/member/logout.do")
	public ModelAndView logout(HttpSession session)
	{
		ModelAndView mav= new ModelAndView("redirect:/loginmember.do");
			session.invalidate();
			
		return mav;
	}
}
