package com.hanbit.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hanbit.data.PageManager;
import com.hanbit.vo.PackageVo;

@Repository
public class PackageDao {
	public List<PackageVo> getMainImage(){
		return PageManager.getMainImage();
	}
}
