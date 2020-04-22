package com.zambient.tennis.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zambient.tennis.bean.CategoryBean;
import com.zambient.tennis.bean.DoubleBulkUploadBean;
import com.zambient.tennis.bean.SingleBulkUploadBean;
import com.zambient.tennis.dao.PlayersBulkUploadDao;

@Service ("playersBulkUploadService")
public class PlayersBulkUploadServiceImpl implements PlayersBulkUploadService{
	
	@Autowired
	PlayersBulkUploadDao playersBulkUploadDao;

	@Override
	public String uploadBulkAndRegisterForSingleMatch(SingleBulkUploadBean singleBulkUploadBean) {
		// TODO Auto-generated method stub
		return playersBulkUploadDao.uploadBulkAndRegisterForSingleMatch(singleBulkUploadBean);
	}

	@Override
	public CategoryBean getMatchCategoryDesc(long category) {
		// TODO Auto-generated method stub
		return playersBulkUploadDao.getMatchCategoryDesc(category);
	}

	@Override
	public String uploadBulkAndRegisterForDoubleMatch(DoubleBulkUploadBean doubleBulkUploadBean) {
		// TODO Auto-generated method stub
		return playersBulkUploadDao.uploadBulkAndRegisterForDoubleMatch(doubleBulkUploadBean);
	}

}
