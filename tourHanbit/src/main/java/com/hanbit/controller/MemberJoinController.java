package com.hanbit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hanbit.dao.MemberDao;
import com.hanbit.vo.MemberVo;
/*import com.sun.mail.iap.Response;*/

@Controller
@RequestMapping("/joinMember.do")
public class MemberJoinController {

	@Autowired
	private MemberDao dao;

	public void setDao(MemberDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView form()
	{
		ModelAndView mav = new ModelAndView();
		mav.addObject("viewPage", "joinMember.jsp");
		mav.setViewName("/template");
		return mav;
		
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView joinMember(MemberVo m ,String mem_pwdk)
	{
		String mem_pwd = m.getMem_pwd();
		String mem_pwdok = mem_pwdk;
			System.out.println(mem_pwd);
			System.out.println(mem_pwdok);
			
			if(mem_pwd != mem_pwdok)
			{
				
			}
		String email = m.getMem_email();
		String phone = m.getMem_phone();
		m.setMem_email(email.replace(",","@"));
		m.setMem_phone(phone.replaceAll(",", "-"));
		ModelAndView mav = new ModelAndView();
		int re = dao.join(m);
		if(re==1)
		{
			mav.setViewName("redirect:/mainPage.do");
		}
		else
		{
			mav.setViewName("redirect:/joinMember.do");
		}
		return mav;
		
	}
	
}
