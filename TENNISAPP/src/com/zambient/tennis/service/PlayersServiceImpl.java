package com.zambient.tennis.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zambient.tennis.bean.LoginBean;
import com.zambient.tennis.bean.PlayerUserBO;
import com.zambient.tennis.bean.PlayersBean;
import com.zambient.tennis.bean.RankCategoryBean;
import com.zambient.tennis.bean.players;
import com.zambient.tennis.dao.PlayersDao;

@Service ("playersService")
public class PlayersServiceImpl implements PlayersService{
     
	@Autowired
	PlayersDao playersDao;

	@Override
	public String addPlayer(PlayersBean playersBean) {
		return playersDao.addPlayer(playersBean);
	}

	@Override
	public PlayerUserBO playerLogin(LoginBean loginBean) {
		// TODO Auto-generated method stub
		return playersDao.playerLogin(loginBean);
	}

	@Override
	public players getProfile(int id,int loginType) {
		// TODO Auto-generated method stub
		return playersDao.getProfile(id,loginType);
	}

	@Override
	public String changePlayerPassword(int id, String pwd) {
		// TODO Auto-generated method stub
		return playersDao.changePlayerPassword(id, pwd);
	}

	@Override
	public List<players> getPlayerList(int categoryId, int tournamentId) {
		// TODO Auto-generated method stub
		return playersDao.getPlayerList(categoryId, tournamentId);
	}

	@Override
	public String uploadBulkData(List<PlayersBean> playerList) {
		// TODO Auto-generated method stub
		return playersDao.uploadBulkData(playerList);
	}

	@Override
	public boolean isMobileExist(String mobile) {
		// TODO Auto-generated method stub
		return playersDao.isMobileExist(mobile);
	}

	@Override
	public Map<String, Object[]> downloadPlayersListWithDetails() {
		// TODO Auto-generated method stub
		return playersDao.downloadPlayersListWithDetails();
	}

	@Override
	public List<RankCategoryBean> getAllRankCategories() {
		// TODO Auto-generated method stub
		return playersDao.getAllRankCategories();
	}
	
}
