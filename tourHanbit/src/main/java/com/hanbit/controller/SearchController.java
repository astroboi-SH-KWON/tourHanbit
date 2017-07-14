package com.hanbit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SearchController {
	
	@RequestMapping("/srch.do")
	public ModelAndView search(String srchOption,String srch,String startDay,String endDay, String amount){
		ModelAndView mav= new ModelAndView();
		
		return mav;
	}
}
