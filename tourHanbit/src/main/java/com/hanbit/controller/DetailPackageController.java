//¼¼¿¬
package com.hanbit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hanbit.dao.DetailPackageDao;
@Controller
public class DetailPackageController {
	@Autowired
	private DetailPackageDao dao;
	
	
	
	public void setDao(DetailPackageDao dao) {
		this.dao = dao;
	}
	@RequestMapping("detail.do")
	public ModelAndView listDetail(int item_key){
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("s", dao.listSchedule(item_key));
		mav.addObject("i", dao.listImage(item_key));
		mav.addObject("p", dao.listPackage(item_key));
		mav.addObject("item_key", item_key);
		mav.addObject("viewPage", "detail.jsp");
		mav.setViewName("/template02");
		return mav;
		
	}
	
}
