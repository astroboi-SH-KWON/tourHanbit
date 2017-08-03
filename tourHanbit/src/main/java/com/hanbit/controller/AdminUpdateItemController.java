package com.hanbit.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.hanbit.dao.AdminDao;
import com.hanbit.vo.ImageVo;
import com.hanbit.vo.PackageVo;
import com.hanbit.vo.ScheduleVo;

@Controller
@RequestMapping("/admin/adminUpdateItem.do")
public class AdminUpdateItemController {

	@Autowired
	AdminDao dao;

	public void setDao(AdminDao dao) {
		this.dao = dao;
	}
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView updateItemForm(int item_key)
	{
		ModelAndView mav= new ModelAndView();
			
		
		mav.addObject("items", dao.getDetailItem(item_key));
		mav.addObject("schedules", dao.getSchedule(item_key));
		
		
			
			mav.addObject("view", "adminUpdateItem.jsp");
			mav.setViewName("/admin/adminTemplate");
		return mav;
	}
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView updateItemSubmit(PackageVo pv, HttpServletRequest request)
	{
		ModelAndView mav= new ModelAndView("redirect:/admin/adminListItem.do");
		
		MultipartHttpServletRequest multi=(MultipartHttpServletRequest)request;
		String[] days=multi.getParameterValues("day");
		
		
		
		String path = request.getRealPath("resources/img");
		System.out.println(path);
		
		ArrayList<String> oldImage= new ArrayList<String>();
		ArrayList<String> fnames= new ArrayList<String>();
		
		ImageVo images=dao.getImages(pv.getItem_key());
		
		oldImage.add(images.getImage01());
		oldImage.add(images.getImage02());
		oldImage.add(images.getImage03());
		oldImage.add(images.getImage04());
		oldImage.add(images.getImage05());
		oldImage.add(images.getImage06());
		oldImage.add(images.getImage07());
		oldImage.add(images.getImage08());
		oldImage.add(images.getImage09());
		oldImage.add(images.getImage10());
		oldImage.add(images.getImage11());
		
		fnames=(ArrayList<String>)oldImage.clone();	
		//����Ʈ�� ���� �����Ѵ�.	�׳� = ���ξ��� ��������(�ּҿ� ���� ����)�� �ϰԵǾ�
		//�ϳ��� ���� ���ϸ� ������ �ϳ��� ���� ���Ѵ�.
		//������ clone�� ����ϸ� ��������(���� ������ ����)�� �Ͽ� �ϳ��� ���ص� ������ ���� ������ �ʴ´�.
		
		
		List<MultipartFile> files= multi.getFiles("upload");
		
		//������ �ϳ��� ����������
		if(files.get(0).getOriginalFilename() !=null && !files.get(0).getOriginalFilename().equals(""))
		{
			fnames.clear();
		}
		
		String originalName= "";
		try{
			
			for(int i=0; i<files.size();i++)
			{			
				originalName=files.get(i).getOriginalFilename();
				
				if( originalName!=null && !originalName.equals("") )
				{
					fnames.add(originalName);
					
					byte[] data= files.get(i).getBytes();
					FileOutputStream fos= new FileOutputStream(path+"/"+originalName);
					fos.write(data);
					//�߰�
///////////////////////////////////////////////////////////////////////////////////////
					//����
					if(oldImage.get(i) !=null && !oldImage.get(i).equals("") )
					{					
						String oldFname=oldImage.get(i);
						
						File file= new File(path+"/"+oldFname);
						file.delete();
					}
					
					
				}
			}
			int re= dao.adminUpdateItem(fnames,pv,days);
			
			
		}catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		
		
		
		
		return mav;
	}
	
}
