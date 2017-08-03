package com.hanbit.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hanbit.dao.MemberDao;

@Controller
@RequestMapping("/airplanorders.do")
public class AirPlaneOrdersController {

	@Autowired
	private MemberDao dao;
	
	public void setDao(MemberDao dao) {
		this.dao = dao;
	}
	/*@ResponseBody*/
	/*@RequestMapping("/airplanorders.do")
	public String airplaneorders(HttpServletRequest request)
	{
		String airplane_intro_text = request.getParameter("airplane_intro_text");
		System.out.println(airplane_intro_text);
		
		
		return airplane_intro_text;

	}*/
	@RequestMapping(method=RequestMethod.GET)
	public void form()
	{
		
	}

	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView airplaneorders(HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		String oceania = request.getParameter("oceania");
		String asia = request.getParameter("asia");
		String europe = request.getParameter("europe");
		String afreeca = request.getParameter("afreeca");
		String s_america = request.getParameter("s_america");
		String n_america = request.getParameter("n_america");
		String airplane_intro_text = request.getParameter("airplane_intro_text");
		System.out.println("컨트롤러에서"+oceania);
		
		dao.airplaneorders(oceania);
		
		try{
		Thread.sleep(2000);
		}catch(Exception e){System.out.println(e.getMessage());}
		mav.setViewName("redirect:/srch.do");
		return mav;
	}

}
