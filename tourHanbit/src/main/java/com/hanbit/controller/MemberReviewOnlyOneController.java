package com.hanbit.controller;

import java.util.List;

import javax.mail.Address;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hanbit.dao.MemberDao;
import com.hanbit.dao.ReviewDao;
import com.hanbit.vo.ReviewVo;

@Controller
public class MemberReviewOnlyOneController {

	@Autowired
	private MemberDao dao;

	public void setDao(MemberDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping("/member/reviewonlyone.do")
	public ModelAndView reviewonlyone(int item_key)
	{
		ModelAndView mav = new ModelAndView();
		int one = 0;
		/*List<ReviewVo> mv = dao.reviewonlyone(review_item_key);*/
	/*	if(mv.size() >1)
		{
			one=1;
			mav.addObject("one", one);
		}
		else
		{
			one=0;
			mav.addObject("one", one);
		}
		*/
		return mav;
	}
	
}
