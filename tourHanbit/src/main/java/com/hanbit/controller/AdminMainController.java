//¿Â¡÷»Ø

package com.hanbit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hanbit.dao.AdminDao;
import com.hanbit.vo.PackageVo;

@Controller
public class AdminMainController {

	@Autowired
	AdminDao dao;
	
	public void setDao(AdminDao dao)
	{
		this.dao= dao;
	}
	@RequestMapping("/adminMain.do")
	public ModelAndView list()
	{
		ModelAndView mav= new ModelAndView();
			List<PackageVo> list=dao.list();
		
			mav.addObject("view","adminMain.jsp");
			mav.addObject("adminList", list);
			mav.setViewName("/admin/adminTemplate");
			
		return mav;
	}
}
