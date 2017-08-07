package com.hanbit.controller;

import java.util.Date;
import java.util.List;

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
			
		List<SubPackageVo> subCount=dao.getSubCount(item_key);
		
			
			mav.addObject("subCount",subCount);
			mav.addObject("item_key",item_key);
			mav.addObject("view","adminInsertSubItem.jsp");
			mav.setViewName("/admin/adminTemplate");
		return mav;
	}
	
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView subInsertSubmit(SubPackageVo spv)
	{
		int item_key=spv.getItem_key();
		ModelAndView mav= new ModelAndView("redirect:/admin/adminDetailItem.do?item_key="+item_key);
	
			dao.insertSubItem(spv);
		
		return mav;
	}
}
