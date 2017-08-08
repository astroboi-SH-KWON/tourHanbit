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

import com.hanbit.dao.QnaDao;
import com.hanbit.vo.QnaVo;



@Controller
@RequestMapping("/updateQna.do")
public class UpdateQnaController {

	@Autowired
		private QnaDao dao;

	public void setDao(QnaDao dao) {
		this.dao = dao;
	}

	@RequestMapping(method=RequestMethod.GET)
	   public ModelAndView form(int qna_number)
	   {
	      ModelAndView mav = new ModelAndView();
	      mav.addObject("q",dao.detailQna(qna_number));
	      return mav;
	   }
	   
	
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView submit(QnaVo q, HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		String oldFname = q.getQna_fname();
		String path = request.getRealPath("resources/upload");
		MultipartFile multi = q.getUploadFile();
		String qna_fname="";
		if(multi != null)
			qna_fname = multi.getOriginalFilename();
		q.setQna_fname(oldFname);
		
		if(!qna_fname.equals(""))
		{
			q.setQna_fname(qna_fname);
			try{
				byte[] data = multi.getBytes();
				FileOutputStream fos = new FileOutputStream(path +"/"+qna_fname);
				fos.write(data);
				fos.close();
			}
			catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		
		int re =dao.updateQna(q);
		if(re ==1 && oldFname!=null && !qna_fname.equals(""))
		{
			File file2 = new File(path+"/"+oldFname);
			file2.delete();
		}
		
		mav.setViewName("redirect:/listQna.do");
		return mav;
		
	}
	

}
