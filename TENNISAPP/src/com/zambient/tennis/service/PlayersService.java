package com.zambient.tennis.service;

import java.util.List;
import java.util.Map;

import com.zambient.tennis.bean.LoginBean;
import com.zambient.tennis.bean.PlayerUserBO;
import com.zambient.tennis.bean.PlayersBean;
import com.zambient.tennis.bean.RankCategoryBean;
import com.zambient.tennis.bean.players;

public interface PlayersService {
	
	public String addPlayer(PlayersBean playersBean);
	public List<players> getPlayerList(int categoryId,int tournamentId);
	public PlayerUserBO playerLogin(LoginBean loginBean);
	public players getProfile(int id,int loginType);
	public String changePlayerPassword(int id, String pwd);
	public String uploadBulkData(List<PlayersBean> playerList);
	public boolean isMobileExist(String mobile);
	public Map<String, Object[]> downloadPlayersListWithDetails();
	public List<RankCategoryBean> getAllRankCategories();

}
