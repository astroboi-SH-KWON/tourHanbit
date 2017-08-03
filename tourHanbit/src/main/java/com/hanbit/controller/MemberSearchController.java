package com.hanbit.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hanbit.dao.PackageDao;

@Controller
public class MemberSearchController {
	
	@Autowired
	private PackageDao dao;
		
	public void setDao(PackageDao dao) {
		this.dao = dao;
	}

	@RequestMapping("/member/memberSrch.do")
	public ModelAndView search(String srchOption,String srch,String startDay,String endDay, String amount,String today){
		ModelAndView mav= new ModelAndView();
		String item=null;
		if(!srch.equals("")&&srchOption.equals("0")||srchOption.equals("1")||srchOption.equals("2")){
			if(srchOption.equals("1")||srchOption.equals("2")){
				item=srchOption+"%";
			}
			mav.addObject("list", dao.serchResults(item,"%"+srch+"%",null,null,null));
			mav.addObject("srch", srch);
		}else if(srchOption.equals("3")){
			mav.addObject("srch", startDay+" 부터  "+endDay+" 까지");
			if(startDay==null||startDay.equals("")){
				startDay=today;
				mav.addObject("srch", endDay+" 까지");
			}
			if(endDay==null||endDay.equals("")){
				endDay=null;
				mav.addObject("srch", startDay+" 이후  ");
			}
			mav.addObject("list", dao.serchResults(null,null,startDay,endDay,null));
			
		}else if(srchOption.equals("4")){
			mav.addObject("list", dao.serchResults(null,null,null,null,amount));
			mav.addObject("srch", amount);
		}		
		mav.addObject("viewPage", "memberSrch.jsp");
		mav.setViewName("/member/template");
		return mav;
	}
}
