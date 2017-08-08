package com.hanbit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hanbit.dao.NoticeDao;

@Controller // 해당 파일 컨트롤 파일명시
public class NoticeController {
	
	
	@Autowired //자동으로 매핑시켜주는것. 컨트롤에서 찾을때 사용.
	private NoticeDao dao;
	
	
	
	
	public void setDao(NoticeDao dao) {
		this.dao = dao;
	}




	@RequestMapping("/listNotice.do") //실제 액션을 의미.
	public ModelAndView list(
						@RequestParam(value="pageNUM",defaultValue="1")int pageNUM, @RequestParam(value="cutSession", defaultValue="1") int cutSession, String searchField,String keyword,HttpServletRequest request)
	{
		
		HttpSession session = request.getSession();
		
		String mem_id = (String) session.getAttribute("id");
		session.setAttribute("mem_id", mem_id);
		String searchField2 = (String)session.getAttribute("searchField");
		String keyword2 = (String)session.getAttribute("keyword");
		
		System.out.println("검색필드:"+searchField2);
		System.out.println("검색어:"+keyword2);
		
		
		if(keyword != null && !keyword.trim().equals(""))
		{
			searchField2 = searchField;
			keyword2 = keyword;
			session.setAttribute("searchField", searchField2);
			session.setAttribute("keyword", keyword2);
		}
		if(cutSession==0)
		{
			session.setAttribute("searchField", null);
			session.setAttribute("keyword", null);
			keyword2=null;
			
		}
		
		
		
		
		int start,end;
		
		start = (pageNUM-1) * NoticeDao.pageSIZE + 1;
		end = start + NoticeDao.pageSIZE -1;
		
		
		System.out.println("cont");
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",dao.listNotice(start,end,searchField2,keyword2));
		mav.addObject("pageStr",dao.getPageStr(pageNUM,searchField2,keyword2));
		
		mav.setViewName("/template");
		mav.addObject("viewPage","listNotice.jsp");
		
		return mav;
	}
	
	
	
	
	
	
	@RequestMapping("/detailNotice.do")
	public ModelAndView detailNotice(int notice_number)
	{			
		ModelAndView mav = new ModelAndView();
		dao.updateHit(notice_number);
		mav.addObject("n", dao.detailNotice(notice_number));
		mav.setViewName("/template");
		mav.addObject("viewPage","detailNotice.jsp");
		return mav;
	}
	
	
	
	

	@RequestMapping("/deleteNotice.do")
	public ModelAndView deleteNotice(int notice_number)
	{
		ModelAndView mav = new ModelAndView("redirect:/listNotice.do");
		mav.addObject("n",dao.deleteNotice(notice_number));
		
		return mav;
	}
	
	
	@RequestMapping("/updateNotice.do")
	public ModelAndView updateNotice(int notice_number)
	{
		ModelAndView mav = new ModelAndView();
		mav.addObject("n",dao.deleteNotice(notice_number));
		mav.setViewName("/template");
		mav.addObject("viewPage","updateNotice.jsp");
		
		return mav;
	}
	
	
	
	
	
	

}
