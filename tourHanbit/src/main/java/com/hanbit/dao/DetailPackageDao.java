//¼¼¿¬
package com.hanbit.dao;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.hanbit.data.DetailPackageManager;
import com.hanbit.vo.ImageVo;
import com.hanbit.vo.PackageVo;
import com.hanbit.vo.ScheduleVo;
@Repository
public class DetailPackageDao {

	public PackageVo listPackage(int item_key){
		return DetailPackageManager.listPackage(item_key);
	}
	public ImageVo listImage(int item_key){
		return DetailPackageManager.listImage(item_key);
	}
	public List<ScheduleVo> listSchedule(int item_key){
		return DetailPackageManager.listSchedule(item_key);
	}
}
