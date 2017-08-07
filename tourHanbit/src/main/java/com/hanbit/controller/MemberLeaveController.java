package com.hanbit.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hanbit.dao.MemberDao;
import com.hanbit.vo.MemberVo;

@Controller
@RequestMapping("member/memberleave.do")
public class MemberLeaveController {

	@Autowired
	private MemberDao dao;

	public void setDao(MemberDao dao) {
		this.dao = dao;
	}

	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView form(HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		String leavemem_id = (String) session.getAttribute("id");
		mav.addObject("leavemem_id", leavemem_id);
		
		mav.addObject("viewPage", "memberleave.jsp");
		mav.setViewName("/member/template");
		
		return mav;
		
	}
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView memberleave(HttpSession session, MemberVo m)
	{
		ModelAndView mav = new ModelAndView();
		String mem_id = (String) session.getAttribute("id");
		
		int re = dao.memberleave(mem_id);
		session.invalidate();
		mav.setViewName("redirect:/mainPage.do");
		
		return mav;
	}
	
}
