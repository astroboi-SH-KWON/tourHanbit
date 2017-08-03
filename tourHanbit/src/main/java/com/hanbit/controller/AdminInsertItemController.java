package com.hanbit.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.hanbit.dao.AdminDao;
import com.hanbit.vo.PackageVo;
import com.hanbit.vo.ScheduleVo;
import com.hanbit.vo.SubPackageVo;

@Controller
@RequestMapping("/admin/adminInsertItem.do")
public class AdminInsertItemController {

	@Autowired
	AdminDao dao;

	public void setDao(AdminDao dao) {
		this.dao = dao;
	}
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView insertForm()
	{
		ModelAndView mav= new ModelAndView();
			mav.addObject("view", "adminInsertItem.jsp");
			mav.setViewName("/admin/adminTemplate");
		return mav;
	}
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView insertSubmit(PackageVo piv, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView mav= new ModelAndView();
			MultipartHttpServletRequest multipartRequest=
					(MultipartHttpServletRequest)request;
			
			String path= request.getRealPath("resources/img");
			System.out.println(path);
			
			List<MultipartFile> files= multipartRequest.getFiles("upload");
			ArrayList<String> fnames= new ArrayList<String>();
			try{
				String originalFileName="";
				for( int i=0; i<files.size(); i++)
				{
					if(!files.get(i).equals("") && files.get(i)!=null)
					{
						originalFileName = files.get(i).getOriginalFilename();
						fnames.add(originalFileName);
					}
					if(!originalFileName.equals("") && originalFileName!=null)
					{
						byte[] data= files.get(i).getBytes();
						
						FileOutputStream fos= new FileOutputStream(path+"/"+originalFileName);
						
						fos.write(data);
					}	
						
					
				}
				
				int size=0;
				for(int j=0; j<10;j++)
				{
					if(!multipartRequest.getParameter("day"+(j+1)).equals("") && multipartRequest.getParameter("day"+(j+1))!=null)
					{
						size++;
					}
				}
				ArrayList<ScheduleVo> s_list= new ArrayList<ScheduleVo>();
				
				for(int j=0; j<size; j++)
				{	
					ScheduleVo s= new ScheduleVo();
					s.setItem_key(Integer.parseInt(multipartRequest.getParameter("item_key")));
					s.setDay_number(j+1);
					s.setContent(multipartRequest.getParameter("day"+(j+1)));
					s_list.add(s);
					
				}
				
				dao.insertItem(piv,fnames,s_list);
			}catch(Exception e)
			{
				System.out.println("¿¡·¯"+e.getMessage());
			}
			mav.addObject("item_key", piv.getItem_key());
			mav.addObject("view","adminInsertSubItem.jsp");
			mav.setViewName("/admin/adminTemplate");
		return mav;
	}
	
	
	
}
