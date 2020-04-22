package com.zambient.tennis.dao;

import com.zambient.tennis.bean.CategoryBean;
import com.zambient.tennis.bean.DoubleBulkUploadBean;
import com.zambient.tennis.bean.SingleBulkUploadBean;

public interface PlayersBulkUploadDao {

	public String uploadBulkAndRegisterForSingleMatch(SingleBulkUploadBean singleBulkUploadBean);
	public CategoryBean getMatchCategoryDesc(long category);
	public String uploadBulkAndRegisterForDoubleMatch(DoubleBulkUploadBean doubleBulkUploadBean);
}
