package com.hanbit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hanbit.dao.QnaDao;

@Controller // �빐�떦 �뙆�씪 而⑦듃濡� �뙆�씪紐낆떆
public class MemberQnaController {
	
	
	@Autowired //�옄�룞�쑝濡� 留ㅽ븨�떆耳쒖＜�뒗寃�. 而⑦듃濡ㅼ뿉�꽌 李얠쓣�븣 �궗�슜.
	private QnaDao dao;
	
	
	
	
	public void setDao(QnaDao dao) {
		this.dao = dao;
	}




	@RequestMapping("/member/memberListQna.do") //�떎�젣 �븸�뀡�쓣 �쓽誘�.
	public ModelAndView list(@RequestParam(value="pageNUM",defaultValue="1")int pageNUM, @RequestParam(value="cutSession", defaultValue="1") int cutSession, String searchField,String keyword,HttpServletRequest request)
	{
		
		
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("id");
		session.setAttribute("mem_id", mem_id);
		
		String searchField2 = (String)session.getAttribute("searchField");
		String keyword2 = (String)session.getAttribute("keyword");
		
		
		
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
		
		start = (pageNUM-1) * QnaDao.pageSIZE + 1;
		end = start + QnaDao.pageSIZE -1;
		
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",dao.listQna(start,end,searchField2,keyword2));
		mav.addObject("pageStr",dao.getPageStr(pageNUM,searchField2,keyword2));
		
		mav.setViewName("/member/template");
		mav.addObject("viewPage","memberListQna.jsp");
		
		return mav;
	}
	
	
	
	
	
	
	@RequestMapping("/member/memberDetailQna.do")
	public ModelAndView detailQna(int qna_number,HttpSession session)
	{	
		
		
		String mem_id = (String) session.getAttribute("id");
		session.setAttribute("mem_id", mem_id);
		
		session.setAttribute("qna_number", qna_number);
		ModelAndView mav = new ModelAndView();
		mav.addObject("q", dao.detailQna(qna_number));
		mav.setViewName("/member/template");
		mav.addObject("viewPage","memberDetailQna.jsp");
		
		return mav;
	}
	
	
	
	

	@RequestMapping("/member/memberDeleteQna.do")
	public ModelAndView deleteQna(int qna_number)
	{
	
	
		ModelAndView mav = new ModelAndView("redirect:/member/memberListQna.do");
		mav.addObject("q",dao.deleteQna(qna_number));
		
		
		
		
		return mav;
	}
	
	
	
	
	
	
	
	

}
