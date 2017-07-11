//장주환

package com.hanbit.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.rcaller.rStuff.RCaller;
import com.github.rcaller.rStuff.RCode;
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
	public ModelAndView main(HttpServletRequest request)
	{
		ModelAndView mav= new ModelAndView();
		
		try{
			RCaller caller= new RCaller();
			caller.setRscriptExecutable("C:\\Program Files\\R\\R-3.4.1\\bin\\x64\\Rscript.exe");
			RCode code= new RCode();
			code.clear();
			
			File file;
			file= code.startPlot();
			
			code.addRCode("library(DBI)");
			code.addRCode("library(RODBC)");
			code.addRCode("library(igraph)");
			code.addRCode("hanbit=odbcConnect('hanbit',uid='hanbit',pwd='hanbit')");
			code.addRCode("sales= sqlQuery(hanbit,'select a.q item_key, b.w orders_su from (select p.item_key q, sum(price) w from package p , orders o where o.item_key=p.item_key group by p.item_key order by sum(orders_su) desc) a, (select p.item_key q, sum(orders_su) w from package p, orders o where o.item_key=p.item_key group by p.item_key order by sum(orders_su) desc) b, (select p.item_key q, item_name from package p, orders o where p.item_key=o.item_key group by p.item_key, item_name) c where a.q = b.q and a.q = c.q order by b.w desc')");
			code.addRCode("order=sales$ORDERS_SU");
			code.addRCode("item_key=sales$ITEM_KEY");
			code.addRCode("orders=data.frame(order)");
			code.addRCode("barplot(as.matrix(orders),main='매출현황',beside=T,col=rainbow(nrow(orders)),ylim=c(0,max(order)+1))");
			code.addRCode("legend(6,10,item_key,cex=0.8,fill=rainbow(nrow(orders)))");
			
			
			code.endPlot();
			caller.setRCode(code);
			caller.runOnly();
			
			String fname=file.getName();
			String path= request.getRealPath("resources/upload");
			
			FileOutputStream fos= new FileOutputStream(path+"/"+fname);
			FileInputStream fis= new FileInputStream(file);
			
			FileCopyUtils.copy(fis, fos);
			fis.close();
			fos.close();
			
			mav.addObject("fname",fname);
			
		}catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		
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
