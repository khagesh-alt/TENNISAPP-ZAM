package com.zambient.tennis.service;

import com.zambient.tennis.bean.CategoryBean;
import com.zambient.tennis.bean.DoubleBulkUploadBean;
import com.zambient.tennis.bean.SingleBulkUploadBean;

public interface PlayersBulkUploadService {
	
	public String uploadBulkAndRegisterForSingleMatch(SingleBulkUploadBean singleBulkUploadBean);
	public CategoryBean getMatchCategoryDesc(long category);
	public String uploadBulkAndRegisterForDoubleMatch(DoubleBulkUploadBean doubleBulkUploadBean);
}
