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

@Controller // 해당 파일 컨트롤 파일명시
public class QnaController {
	
	
	@Autowired //자동으로 매핑시켜주는것. 컨트롤에서 찾을때 사용.
	private QnaDao dao;
	
	
	
	
	public void setDao(QnaDao dao) {
		this.dao = dao;
	}




	@RequestMapping("/listQna.do") //실제 액션을 의미.
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
		
		mav.setViewName("/template");
		mav.addObject("viewPage","listQna.jsp");
		
		return mav;
	}
	
	
	
	
	
	
	@RequestMapping("/detailQna.do")
	public ModelAndView detailQna(int qna_number,HttpSession session)
	{	
		
		
		String mem_id = (String) session.getAttribute("id");
		session.setAttribute("mem_id", mem_id);
		
		session.setAttribute("qna_number", qna_number);
		ModelAndView mav = new ModelAndView();
		mav.addObject("q", dao.detailQna(qna_number));
		mav.setViewName("/template");
		mav.addObject("viewPage","detailQna.jsp");
		
		return mav;
	}
	
	
	
	

	@RequestMapping("/deleteQna.do")
	public ModelAndView deleteQna(int qna_number)
	{
	
	
		ModelAndView mav = new ModelAndView("redirect:/listQna.do");
		mav.addObject("q",dao.deleteQna(qna_number));
		
		
		
		
		return mav;
	}
	
	
	
	
	
	
	
	

}
