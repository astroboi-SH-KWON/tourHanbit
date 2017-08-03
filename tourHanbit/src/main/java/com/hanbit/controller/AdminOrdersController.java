package com.hanbit.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hanbit.dao.AdminDao;
import com.hanbit.vo.OrdersVo;

@Controller
public class AdminOrdersController {
	
	@Autowired
	AdminDao dao;
	public void setDao(AdminDao dao)
	{
		this.dao=dao;
	}
	
	@RequestMapping("/admin/adminOrders.do")
	public ModelAndView ordersList()
	{
		ModelAndView mav= new ModelAndView();
		
		List<OrdersVo> list=dao.ordersList();
		
		mav.addObject("ordersList",list);
		mav.addObject("view", "adminOrders.jsp");
		mav.setViewName("/admin/adminTemplate");
		return mav;
	}
	@RequestMapping(value="/admin/adminOrderCheck.do")
	public void adminOrderCheck(HttpServletRequest request, HttpServletResponse response)
	{
		String orderid="";
		int re=-1;
		orderid=request.getParameter("orderid");
			re=dao.adminOrdersCheck(orderid);
			
		try {
			response.getWriter().print(re);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@RequestMapping("/admin/adminOrderCancel.do")
	public void adminOrderCancel(HttpServletRequest request, HttpServletResponse response)
	{
		String orderid="";
		int re=-1;
		orderid=request.getParameter("orderid");
			re=dao.adminOrdersCancel(orderid);
			
		try {
			response.getWriter().print(re);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
