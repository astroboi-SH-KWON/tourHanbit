//±Ç¼¼Çõ

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
	public ModelAndView getMainImage(String page){
		ModelAndView mav= new ModelAndView();
		List<PackageVo> main=null;
		List<PackageVo> best01=null;
		List<PackageVo> best02=null;
		List<PackageVo> event=null;
		
		event=dao.getEventImage(page);
		main= dao.getMainImage(page);
		best01=dao.getBestImage(page);
		best02=dao.getBestImage("best02");		
		
		mav.addObject("main", main);
		mav.addObject("best01", best01);
		mav.addObject("best02", best02);
		mav.addObject("event", event);
		mav.addObject("page", page);
		mav.addObject("viewPage", "mainPage.jsp");
		return mav;
	}
}
