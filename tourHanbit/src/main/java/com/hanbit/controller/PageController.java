package com.hanbit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hanbit.dao.PackageDao;
import com.hanbit.vo.PackageVo;

@Controller
public class PageController {
	@Autowired
	private PackageDao dao;
	
	public void setDao(PackageDao dao) {
		this.dao = dao;
	}

	@RequestMapping("/mainPage.do")
	public ModelAndView getMainImage(){
		ModelAndView mav= new ModelAndView();
		List<PackageVo> list= dao.getMainImage();
		mav.addObject("list", list);
		return mav;
	}
}
