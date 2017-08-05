package com.hanbit.controller;

import java.util.Iterator;
import java.util.List;

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
		MemberVo id = dao.memberlogin(mem_id,mem_pwd);
		
				String login_id =id.getMem_id();
				
				/*MemberVo recommendation = dao.recommendation(mem_id, login_item_key);*/
	
		

		if(id != null)
		{
			session.setAttribute("id", login_id);
			

			mav.setViewName("redirect:/mainPage.do");
			if(id.equals("admin"))
			{
				session.setAttribute("adminCheck","ok");
				mav.setViewName("redirect:/admin/adminMain.do");
			}

		}
		
		else
		{
			mav.setViewName("redirect:/loginmember.do");
		}
		return mav;
	}
}
