package com.hanbit.controller;

import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hanbit.dao.NoticeDao;
import com.hanbit.vo.NoticeVo;




@Controller
@RequestMapping("/member/memberInsertNotice.do")
public class MemberInsertNoticeController {

	
	@Autowired
	private NoticeDao dao;


	
	
	public void setDao(NoticeDao dao) {
		this.dao = dao;
	}


	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView form()
	{
		
		ModelAndView mav = new ModelAndView();
		int notice_number = dao.getNextNo();
		mav.addObject("notice_number", notice_number);
		mav.setViewName("/member/template");
		mav.addObject("viewPage","memberInsertNotice.jsp");
		
		
		return mav;
	}
	
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView submit(NoticeVo n,HttpServletRequest request)
	{
		System.out.println("Á¦¸ñ" + n.getNotice_title());
		String path = request.getRealPath("resources/upload");
		System.out.println(path);
		
		String notice_fname = "";
		n.setNotice_fname(notice_fname);
		try{
			MultipartFile multi  = n.getUploadFile();
			String notice_fname1 = multi.getOriginalFilename();
			if(notice_fname1 != null && !notice_fname1.equals(""))
			{
				notice_fname = notice_fname1;
				byte data[] = multi.getBytes();
				n.setNotice_fname(notice_fname);
				FileOutputStream fos = new FileOutputStream(path + "/"+ notice_fname);
				fos.write(data);
				n.setNotice_fsize(data.length);
			}
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		
		
		dao.insertNotice(n);
		ModelAndView mav = new ModelAndView("redirect:/member/memberListNotice.do");
		return mav;
	
	
	
	
}

}