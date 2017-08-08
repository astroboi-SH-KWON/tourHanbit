package com.hanbit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hanbit.dao.AdminDao;
import com.hanbit.vo.SubPackageVo;

@Controller
@RequestMapping("/admin/adminUpdateSubItem.do")
public class AdminUpdateSubItemController {

	@Autowired
	AdminDao dao;
	public void setDao(AdminDao dao)
	{
		this.dao= dao;
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView updateSubItemForm(String item_key_sub)
	{
		ModelAndView mav= new ModelAndView();
		SubPackageVo s=dao.adminDetailSubItem(item_key_sub);

		
		
		mav.addObject("s",s);
		
		mav.addObject("view", "adminUpdateSubItem.jsp");
		mav.setViewName("/admin/adminTemplate");
		return mav;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView updateSubItemSubmit(SubPackageVo s)
	{
		String item_key_sub=s.getItem_key_sub();
		ModelAndView mav= new ModelAndView("redirect:/admin/adminDetailSubItem.do?item_key_sub="+item_key_sub);
		dao.adminUpdateSubItem(s);
		
		return mav;
	}
}
