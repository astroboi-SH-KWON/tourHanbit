package com.hanbit.controller;

import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hanbit.dao.NoticeDao;
import com.hanbit.vo.NoticeVo;



@Controller
@RequestMapping("/member/memberUpdateNotice.do")
public class MemberUpdateNoticeController {

	@Autowired
		private NoticeDao dao;

	public void setDao(NoticeDao dao) {
		this.dao = dao;
	}

	@RequestMapping(method=RequestMethod.GET)
	   public ModelAndView form(int notice_number)
	   {
	      ModelAndView mav = new ModelAndView();
	      mav.addObject("n",dao.detailNotice(notice_number));
	      mav.setViewName("/member/template");
			mav.addObject("viewPage","memberUpdateNotice.jsp");
	      return mav;
	   }
	   
	
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView submit(NoticeVo n, HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		String oldFname = n.getNotice_fname();
		System.out.println(oldFname);
		String path = request.getRealPath("resources/upload");
		MultipartFile multi = n.getUploadFile();
		String notice_fname="";
		if(multi != null)
			notice_fname = multi.getOriginalFilename();
		n.setNotice_fname(oldFname);
		
		if(!notice_fname.equals(""))
		{
			n.setNotice_fname(notice_fname);
			try{
				byte[] data = multi.getBytes();
				FileOutputStream fos = new FileOutputStream(path +"/"+notice_fname);
				fos.write(data);
				fos.close();
			}
			catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		
		int re =dao.updateNotice(n);
		if(re ==1 && oldFname!=null && !notice_fname.equals(""))
		{
			File file2 = new File(path+"/"+oldFname);
			file2.delete();
		}
		
		mav.setViewName("redirect:/member/memberListNotice.do");
		return mav;
		
	}
	

}
