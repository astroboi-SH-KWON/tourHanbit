package com.hanbit.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hanbit.data.ReviewManager;
import com.hanbit.vo.ReviewVo;

@Repository
public class ReviewDao {

	public int reviewinsert(ReviewVo r) {
		return ReviewManager.insertreview(r);
	}

/*	public List<ReviewVo> reviewonlyone(int review_item_key) {
		
		return ReviewManager.reivewonlyone(review_item_key);
		
	}*/

}
