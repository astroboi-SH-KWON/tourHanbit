package com.hanbit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hanbit.dao.NoticeDao;

@Controller // �빐�떦 �뙆�씪 而⑦듃濡� �뙆�씪紐낆떆
public class MemNoticeController {
	
	
	@Autowired //�옄�룞�쑝濡� 留ㅽ븨�떆耳쒖＜�뒗寃�. 而⑦듃濡ㅼ뿉�꽌 李얠쓣�븣 �궗�슜.
	private NoticeDao dao;
	
	
	
	
	public void setDao(NoticeDao dao) {
		this.dao = dao;
	}




	@RequestMapping("/member/memberListNotice.do") //�떎�젣 �븸�뀡�쓣 �쓽誘�.
	public ModelAndView list(
						@RequestParam(value="pageNUM",defaultValue="1")int pageNUM, @RequestParam(value="cutSession", defaultValue="1") int cutSession, String searchField,String keyword,HttpServletRequest request)
	{
		
		HttpSession session = request.getSession();
		
		String mem_id = (String) session.getAttribute("id");
		session.setAttribute("mem_id", mem_id);
		String searchField2 = (String)session.getAttribute("searchField");
		String keyword2 = (String)session.getAttribute("keyword");
		
		//System.out.println("寃��깋�븘�뱶:"+searchField2);
		//System.out.println("寃��깋�뼱:"+keyword2);
		
		
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
		
		mav.setViewName("/member/template");
		mav.addObject("viewPage","memberListNotice.jsp");
		
		return mav;
	}
	
	
	
	
	
	
	@RequestMapping("/member/memberDetailNotice.do")
	public ModelAndView detailNotice(int notice_number)
	{			
		ModelAndView mav = new ModelAndView();
		dao.updateHit(notice_number);
		mav.addObject("n", dao.detailNotice(notice_number));
		mav.setViewName("/member/template");
		mav.addObject("viewPage","memberDetailNotice.jsp");
		return mav;
	}
	
	
	
	

	@RequestMapping("/member/memberDeleteNotice.do")
	public ModelAndView deleteNotice(int notice_number)
	{
		ModelAndView mav = new ModelAndView("redirect:/member/memberListNotice.do");
		mav.addObject("n",dao.deleteNotice(notice_number));
		
		return mav;
	}
	
	
	@RequestMapping("/member/memberUpdateNotice.do")
	public ModelAndView updateNotice(int notice_number)
	{
		ModelAndView mav = new ModelAndView();
		mav.addObject("n",dao.deleteNotice(notice_number));
		mav.setViewName("/member/template");
		mav.addObject("viewPage","memberUpdateNotice.jsp");
		
		return mav;
	}
	
	
	
	
	
	

}
