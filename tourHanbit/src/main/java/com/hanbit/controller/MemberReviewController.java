package com.hanbit.controller;
import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hanbit.dao.ReviewDao;
import com.hanbit.vo.ReviewVo;

@Controller
@RequestMapping("/member/memberReview.do")
public class MemberReviewController {

	@Autowired
	private ReviewDao dao;
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView form(String reivew_item_key,HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		String mem_id = (String) session.getAttribute("id");
		
		mav.addObject("reivew_item_key", reivew_item_key);
		mav.addObject("mem_id",mem_id);
		mav.addObject("viewPage", "memberReview.jsp");
		mav.setViewName("/member/template");
		return mav;
		
	}
	
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView reviewinsert(ReviewVo r, HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		String path = request.getRealPath("resources/upload");
		
		String review_fname= "";
		r.setReview_fname(review_fname);
		try{
			MultipartFile file = r.getUplodfile();
			String review_fname1 = file.getOriginalFilename();
			if(review_fname1 != null && review_fname1.equals(""))
			{
				review_fname = review_fname1;
				byte data[] = file.getBytes();
				r.setReview_fname(review_fname1);
				FileOutputStream fos = new FileOutputStream(path+"/"+review_fname);
				fos.write(data);
			}
			
			
		}catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		dao.reviewinsert(r);
		mav.setViewName("redirect:/member/memberMypage.do");
		return mav;
	}
}
