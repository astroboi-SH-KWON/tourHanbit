//¿Â¡÷»Ø

package com.hanbit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	public ModelAndView list()
	{
		ModelAndView mav= new ModelAndView();
			List<PackageVo> list=dao.list();
			
			
		return mav;
	}
}
