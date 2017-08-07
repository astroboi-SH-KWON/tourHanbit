package com.hanbit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hanbit.dao.PackageDao;

@Controller
public class MemberDetailPagePackageController {

	@Autowired
	private PackageDao dao;

	public void setDao(PackageDao dao) {
		this.dao = dao;
	}
	
	
	@RequestMapping("detailpagepackage.do")
	public ModelAndView detailpagepackage(String item_key_sub)
	{
		ModelAndView mav = new ModelAndView();
		
		System.out.println(item_key_sub);
		
		return mav;
	}

}
