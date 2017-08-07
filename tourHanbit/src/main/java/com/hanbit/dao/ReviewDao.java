package com.hanbit.dao;

import org.springframework.stereotype.Repository;

import com.hanbit.data.ReviewManager;
import com.hanbit.vo.ReviewVo;

@Repository
public class ReviewDao {

	public int reviewinsert(ReviewVo r) {
		// TODO Auto-generated method stub
		return ReviewManager.insertreview(r);
	}

}
