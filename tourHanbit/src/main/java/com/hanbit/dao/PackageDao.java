package com.hanbit.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hanbit.data.PageManager;
import com.hanbit.vo.PackageVo;

@Repository
public class PackageDao {
	private String item01,item02,rownum;
	public List<PackageVo> getMainImage(String page){
		if(page!=null&&page.equals("dom")){
			item01="1999";
			item02="3000";
		}else if(page!=null&&page.equals("inter")){
			item01="999";
			item02="2000";
		}
		return PageManager.getMainImage(item01,item02);
	}
	public List<PackageVo> getBestImage(String page) {
		// TODO Auto-generated method stub
		item01="999";
		item02="2000";
		rownum="2";
		if(page!=null&&page.equals("dom")){
			item01="1999";
			item02="3000";
			rownum="4";
		}else if(page!=null&&page.equals("inter")){
			item01="999";
			item02="2000";
			rownum="4";
		}else if(page!=null&&page.equals("best02")){
			item01="1999";
			item02="3000";
			rownum="2";
		}
		return PageManager.getBestImage(item01,item02,rownum);
	}
	public List<PackageVo> getEventImage(String page) {
		// TODO Auto-generated method stub
		if(page!=null&&page.equals("dom")){
			item01="1999";
			item02="3000";
		}else if(page!=null&&page.equals("inter")){
			item01="999";
			item02="2000";
		}
		System.out.println(item01);
		return PageManager.getEventImage(item01,item02);
	}
}
