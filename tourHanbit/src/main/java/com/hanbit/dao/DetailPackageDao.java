//세연
package com.hanbit.dao;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.hanbit.data.DetailPackageManager;
import com.hanbit.data.QnaManager;
import com.hanbit.vo.ImageVo;
import com.hanbit.vo.PackageVo;
import com.hanbit.vo.QnaVo;
import com.hanbit.vo.ReviewVo;
import com.hanbit.vo.ScheduleVo;
import com.hanbit.vo.SubPackageVo;
@Repository
public class DetailPackageDao {
	public static int pageSIZE = 4;
	public static int totalRecord;
	public static int totalPage;
	public static int pageGroup = 3;

	public PackageVo detailPackage(int item_key){
		return DetailPackageManager.detailPackage(item_key);
	}
	public ImageVo listImage(int item_key){
		return DetailPackageManager.listImage(item_key);
	}
	public List<ScheduleVo> listSchedule(int item_key){
		return DetailPackageManager.listSchedule(item_key);
	}
	public int btnsu(int item_key) {
		// TODO Auto-generated method stub
		
		return DetailPackageManager.btnsu(item_key);
	}
	public List<SubPackageVo> listSubPackage(int item_key) {
		// TODO Auto-generated method stub
		return DetailPackageManager.listSubPackage(item_key);
	}
	public SubPackageVo detailSubPackage(String item_key_sub) {
		// TODO Auto-generated method stub
		return DetailPackageManager.detailSubPackage(item_key_sub);
	}
	public int insertOrder(int item_key, String item_key_sub,int orders_su,String ageGroup, String mem_id, int totPrice) {
		// TODO Auto-generated method stub
		return DetailPackageManager.insertOrder(item_key,item_key_sub,orders_su,ageGroup,mem_id,totPrice);
	}
	public int addHit(int item_key) {
		// TODO Auto-generated method stub
		return DetailPackageManager.addHit(item_key);
	}
	public List<ReviewVo> listReview(int start, int end, int item_key) {
		// TODO Auto-generated method stub
		totalRecord= getTotal();
		totalPage = (int)Math.ceil((double)totalRecord/pageSIZE);
		
		return DetailPackageManager.listReview(start,end,item_key);
	}
	private int getTotal() {
		// TODO Auto-generated method stub
		return DetailPackageManager.getTotal();
		
	}
	public String getPageStr(int pageNUM)
	{
		
		int start = 
				(pageNUM + pageGroup-1) / pageGroup * pageGroup - (pageGroup-1);				
				
				int end = start+pageGroup-1;
				
				if(end > totalPage){ 
					end=totalPage;
				}
				String str = "";
				
				if( start > pageGroup  )
				{
					str = str + "<a id="+(start-1)+">[이전]</a>&nbsp;";
				}
				
				
				for(int i=start; i<= end; i++)
				{
					str = str + "<a id="+i+">"+ i + "</a>&nbsp;";
				}
				   
				if( end < totalPage  )
				{
					str = str + "<a id="+(end+1)+">[다음]</a>&nbsp;";
				}
		
		
		
		return str;
	}
	
}
