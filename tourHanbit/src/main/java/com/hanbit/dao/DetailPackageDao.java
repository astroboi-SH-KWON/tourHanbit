//¼¼¿¬
package com.hanbit.dao;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.hanbit.data.DetailPackageManager;
import com.hanbit.vo.ImageVo;
import com.hanbit.vo.PackageVo;
import com.hanbit.vo.ScheduleVo;
import com.hanbit.vo.SubPackageVo;
@Repository
public class DetailPackageDao {

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
}
