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
@RequestMapping("/member/memberupdate.do")
public class MemberUpdateController {

	@Autowired
	private MemberDao dao;
	
	public void setDao(MemberDao dao) {
		this.dao = dao;
	}

	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView form(MemberVo m, HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		MemberVo mem_update_ready = (MemberVo) session.getAttribute("mem_update_ready");
		
		String phone = mem_update_ready.getMem_phone();
		String phonef = phone.substring(0, 3);
		String phonec = phone.substring(4,8);
		String phonee = phone.substring(9,13);
		
		String email = mem_update_ready.getMem_email();
		int idx = email.indexOf("@");
		String emailch = email.substring(0, idx);
		String endemail = email.substring(idx+1);
		
		mav.addObject("mem_update_ready", mem_update_ready);
		mav.addObject("emailch", emailch);
		mav.addObject("endemail", endemail);
		mav.addObject("phonef", phonef);
		mav.addObject("phonec", phonec);
		mav.addObject("phonee", phonee);
		
		return mav;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView memberupdate(MemberVo m, HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		
		String email = m.getMem_email();
		String phone = m.getMem_phone();
		m.setMem_email(email.replace(",","@"));
		m.setMem_phone(phone.replaceAll(",", "-"));
		
		int ru = dao.memberupdate(m);
		mav.setViewName("redirect:/member/memberMypage.do");
		
		return mav;
	}


}
