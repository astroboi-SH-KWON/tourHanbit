//¿Â¡÷»Ø
package com.hanbit.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hanbit.data.AdminManager;
import com.hanbit.data.PageManager;
import com.hanbit.vo.PackageVo;

@Repository
public class AdminDao {
	private String item01,item02,rownum;
	public List<PackageVo> list(){
		return AdminManager.list();
	}
}
