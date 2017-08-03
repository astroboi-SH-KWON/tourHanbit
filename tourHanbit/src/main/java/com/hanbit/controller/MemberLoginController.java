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
@RequestMapping("/loginmember.do")
public class MemberLoginController {

	@Autowired
	private MemberDao dao;
	
	
	public void setDao(MemberDao dao) {
		this.dao = dao;
	}

	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView form()
	{
		ModelAndView mav = new ModelAndView();
		mav.addObject("viewPage", "loginmember.jsp");
		mav.setViewName("/template");
		return mav;
	}

	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView memberlogin(String mem_id, String mem_pwd, HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		String id = dao.memberlogin(mem_id,mem_pwd);


		if(id != null)
		{

			session.setAttribute("id", id);

			mav.setViewName("redirect:/member/memberMypage.do");
			if(id.equals("admin"))
			{
				session.setAttribute("thisis_admin",100);
			}

		}
		
		else
		{
			mav.setViewName("redirect:/loginmember.do");
		}
		return mav;
	}
}
