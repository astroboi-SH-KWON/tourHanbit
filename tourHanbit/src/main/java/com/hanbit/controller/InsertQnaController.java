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

import com.hanbit.dao.QnaDao;
import com.hanbit.vo.QnaVo;




@Controller
@RequestMapping("/insertQna.do")
public class InsertQnaController {

	
	@Autowired
	private QnaDao dao;


	
	
	public void setDao(QnaDao dao) {
		this.dao = dao;
	}


	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView form()
	{
		
		ModelAndView mav = new ModelAndView();
		int qna_number = dao.getNextNo();
		mav.addObject("qna_number", qna_number);
		return mav;
	}
	
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView submit(QnaVo q,HttpServletRequest request)
	{
		System.out.println(q.getQna_content());
		String path = request.getRealPath("resources/upload");
		System.out.println(path);
		
		String qna_fname = "";
		q.setQna_fname(qna_fname);
		try{
			MultipartFile multi  = q.getUploadFile();
			String qna_fname1 = multi.getOriginalFilename();
			if(qna_fname1 != null && !qna_fname1.equals(""))
			{
				qna_fname = qna_fname1;
				byte data[] = multi.getBytes();
				q.setQna_fname(qna_fname1);
				FileOutputStream fos = new FileOutputStream(path + "/"+ qna_fname);
				fos.write(data);
				q.setQna_fsize(data.length);
			}
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		
		
		dao.insertQna(q);
		ModelAndView mav = new ModelAndView("redirect:/listQna.do");
		return mav;
	
	
	
	
}

}