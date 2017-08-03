package com.hanbit.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hanbit.dao.AdminDao;
import com.hanbit.vo.SubPackageVo;

@Controller
@RequestMapping("/admin/adminInsertSubItem.do")
public class AdminInsertSubItemController {
	
	@Autowired
	AdminDao dao;

	public void setDao(AdminDao dao) {
		this.dao = dao;
	}
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView subInsertForm(int item_key)
	{
		ModelAndView mav= new ModelAndView();
			
			mav.addObject("item_key",item_key);
			mav.addObject("view","adminInsertSubItem.jsp");
			mav.setViewName("/admin/adminTemplate");
		return mav;
	}
	
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView subInsertSubmit(SubPackageVo spv)
	{
		ModelAndView mav= new ModelAndView("redirect:/admin/adminListItem.do");
	
			dao.insertSubItem(spv);
		
		return mav;
	}
}
