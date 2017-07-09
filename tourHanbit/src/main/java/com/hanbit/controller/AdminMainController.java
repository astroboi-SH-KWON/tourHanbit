//¿Â¡÷»Ø

package com.hanbit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hanbit.dao.AdminDao;
import com.hanbit.vo.MemberVo;
import com.hanbit.vo.OrdersVo;
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
	public ModelAndView main()
	{
		ModelAndView mav= new ModelAndView();
		
			List<OrdersVo> list=dao.adminMainList();
		
			
			mav.addObject("adminMainList", list);
		
			mav.addObject("view","adminMain.jsp");
			
			mav.setViewName("/admin/adminTemplate");
			
		return mav;
	}
	
	@RequestMapping("/adminListItem.do")
	public ModelAndView list(@RequestParam(value="pageNUM", defaultValue="1") int pageNUM)
	{
		ModelAndView mav= new ModelAndView();
			
			
		
			int start= (pageNUM-1)* AdminDao.pageSIZE+1;
			int end = start+AdminDao.pageSIZE-1;
			
			
			mav.addObject("adminPackageList", dao.adminPackageList(start,end));
			mav.addObject("pageStr", dao.getPageStr(pageNUM));
		mav.addObject("view","adminListItem.jsp");
			mav.setViewName("/admin/adminTemplate");
			
		return mav;
	}
	@RequestMapping("/adminMember.do")
	public ModelAndView memberList()
	{
		ModelAndView mav= new ModelAndView();
		
		List<MemberVo> list=dao.memberList();
		
		mav.addObject("memberList", list);
		mav.addObject("view", "adminMember.jsp");
		mav.setViewName("/admin/adminTemplate");
		return mav;
	}
	
}
