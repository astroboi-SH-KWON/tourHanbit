package com.hanbit.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextListener;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.hanbit.dao.QnaDao;
import com.hanbit.vo.ReplyVo;

@Controller
public class ReplyController {
	
	
	@Autowired
	private QnaDao dao;

	public void setDao(QnaDao dao) {
		this.dao = dao;
	}
	
	
	
	@RequestMapping("/deleteReply.do")
	public void deleteQna(int rno)
	{
		
		dao.deleteReply(rno);
		
		
	}
	
	
	@RequestMapping("/insertReply.do")
	public void insertReply(ReplyVo r,HttpServletRequest request)
	{
		
		int rno = dao.getNextNo_c();
		r.setRno(rno);
		dao.insertReply(r);
	
	}
	
	
	@RequestMapping(value="/listReply.do",produces="text/plain;charset=utf-8")
	@ResponseBody
	public String listReply(HttpSession session)
	{
		int qno = (Integer)session.getAttribute("qna_number"); //이름으로 받아오기
		String str = "";
		 try {
			 List<ReplyVo> list = dao.getReplyList(qno);
	         ObjectMapper mapper = new ObjectMapper();
	         str = mapper.writeValueAsString(list);
	         
	      } catch (Exception e) {
	         // TODO: handle exception
	         System.out.println(e.getMessage());
	      }
		
		return str;
		
	}

	
	
	
}
