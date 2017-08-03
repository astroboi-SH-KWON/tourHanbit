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
@RequestMapping("/findpassword.do")
public class MemberFindPasswordController {

	@Autowired
	private MemberDao dao;

	public void setDao(MemberDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public void form()
	{
	}
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView findpassword(String mem_id, String mem_email, HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		
		String mem_pwd = dao.memberfindpassword(mem_id,mem_email);
		

		if(mem_pwd != null)
		{
			session.setAttribute("mem_id", mem_id);
			session.setAttribute("mem_pwd", mem_pwd);
			session.setAttribute("mem_email", mem_email);
			
			mav.setViewName("redirect:/memberfindpassword.do");
		}
		else
		{
			mav.setViewName("redirect:/findpassword.do");
		}
		return mav;
	}
	
}
