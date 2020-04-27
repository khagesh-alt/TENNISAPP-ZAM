package com.zambient.tennis.service;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zambient.tennis.bean.BuildSchedule;
import com.zambient.tennis.bean.CategoryMasterBean;
import com.zambient.tennis.bean.DrwasFirstAndSecondSets;
import com.zambient.tennis.bean.EmailTemplateBean;
import com.zambient.tennis.bean.ExtendsBean;
import com.zambient.tennis.bean.MatchRoundBean;
import com.zambient.tennis.bean.MatchTournamentBean;
import com.zambient.tennis.bean.MatchTournamentCategoryBean;
import com.zambient.tennis.bean.MyTournaments;
import com.zambient.tennis.bean.PaymentBean;
import com.zambient.tennis.bean.PlayersBean;
import com.zambient.tennis.bean.PlayesrListAndPublishPlayer;
import com.zambient.tennis.bean.RoundBean;
import com.zambient.tennis.bean.RoundListWithMatchs;
import com.zambient.tennis.bean.ScheduleInnerBean;
import com.zambient.tennis.bean.TournamentCategoryBean;
import com.zambient.tennis.bean.TournamentLavelScheduleBean;
import com.zambient.tennis.bean.TournamentList;
import com.zambient.tennis.bean.UpdateMatchScore;
import com.zambient.tennis.dao.TournamentDao;

@Service("tournamentService")
public class TournamentServiceImpl implements TournamentService{

	@Autowired
	TournamentDao tournamentDao;

	@Override
	public List<CategoryMasterBean> getTournamentCategories() {
		return tournamentDao.getTournamentCategories();
	}

	@Override
	public int buildTournament(JSONObject addtournamentJson, String imagePath) {
		return tournamentDao.buildTournament(addtournamentJson,imagePath);
	}

	@Override
	public List<TournamentList> getUpcommingTournament(int playerId) {
		return tournamentDao.getUpcommingTournament(playerId);
	}

	@Override
	public int addPaymentForTournamentCategory(PaymentBean paymentBean) {
		return tournamentDao.addPaymentForTournamentCategory(paymentBean);
	}

	@Override
	public List<RoundListWithMatchs> buildCategoryDrwas(int tournamentId,int categoryId) {
		return tournamentDao.buildCategoryDrwas(tournamentId,categoryId);
	}

	@Override
	public List<MyTournaments> getMyTournaments(int orgId) {
		// TODO Auto-generated method stub
		return tournamentDao.getMyTournaments(orgId);
	}

	@Override
	public List<PlayersBean> getPlayerListForEachTournament(int tournamentId, int categoryId) {
		// TODO Auto-generated method stub
		return tournamentDao.getPlayerListForEachTournament(tournamentId, categoryId);
	}

	@Override
	public List<TournamentList> getOrganizerTournament(int orgId) {
		// TODO Auto-generated method stub
		return tournamentDao.getOrganizerTournament(orgId);
	}

	@Override
	public List<TournamentList> upcommingTournament(int playerId, String currentDate) {
		// TODO Auto-generated method stub
		return tournamentDao.upcommingTournament(playerId, currentDate);
	}

	@Override
	public List<PlayersBean> getExistingPlayerList(int tournamentId, int categoryId) {
		// TODO Auto-generated method stub
		return tournamentDao.getExistingPlayerList(tournamentId, categoryId);
	}

	@Override
	public String registerExistingPlayerUrl(int playerId, int tournamentId, int categoryId, int entryFee, int itaRank) {
		// TODO Auto-generated method stub
		return tournamentDao.registerExistingPlayerUrl(playerId, tournamentId, categoryId, entryFee, itaRank);
	}

	@Override
	public EmailTemplateBean retrieveEmailTemplate(String type) {
		// TODO Auto-generated method stub
		return tournamentDao.retrieveEmailTemplate(type);
	}

	@Override
	public String updateAitaRankByOrganiser(JSONArray playerRank) {
		// TODO Auto-generated method stub
		return tournamentDao.updateAitaRankByOrganiser(playerRank);
	}

	@Override
	public String registerPlayerForTournamentCategory(PaymentBean paymentBean, int paymentID, int secPlayerId) {
		// TODO Auto-generated method stub
		return tournamentDao.registerPlayerForTournamentCategory(paymentBean, paymentID, secPlayerId);
	}

	@Override
	public String addPlayerByOrganizer(PlayersBean playersBean) {
		// TODO Auto-generated method stub
		return tournamentDao.addPlayerByOrganizer(playersBean);
	}

	@Override
	public String addDoublesPlayerForTournament(JSONArray doublesPlayer) {
		// TODO Auto-generated method stub
		return tournamentDao.addDoublesPlayerForTournament(doublesPlayer);
	}

	@Override
	public List<ScheduleInnerBean> getScheduleList(int tournamentId, int categoryId) {
		// TODO Auto-generated method stub
		return tournamentDao.getScheduleList(tournamentId, categoryId);
	}

	@Override
	public BuildSchedule getDaysAndNoOfMatchs(int tournamentId) {
		// TODO Auto-generated method stub
		return tournamentDao.getDaysAndNoOfMatchs(tournamentId);
	}

	@Override
	public String saveScheduleData(JSONArray scheduleJson) {
		// TODO Auto-generated method stub
		return tournamentDao.saveScheduleData(scheduleJson);
	}

	@Override
	public List<MatchTournamentBean> getTournamentListToUpdateScore(int orgId) {
		// TODO Auto-generated method stub
		return tournamentDao.getTournamentListToUpdateScore(orgId);
	}

	@Override
	public String updateMatchScore(UpdateMatchScore bean) {
		// TODO Auto-generated method stub
		return tournamentDao.updateMatchScore(bean);
	}

	@Override
	public List<RoundBean> getDataForSchedule(int tournamentid) {
		// TODO Auto-generated method stub
		return tournamentDao.getDataForSchedule(tournamentid);
	}

	@Override
	public boolean isDrwasCreated(int tournamentId) {
		// TODO Auto-generated method stub
		return tournamentDao.isDrwasCreated(tournamentId);
	}

	@Override
	public String removePlayerFromTournament(int playerId, int paymentId, int tournamentId, int categoryId) {
		// TODO Auto-generated method stub
		return tournamentDao.removePlayerFromTournament(playerId, paymentId, tournamentId, categoryId);
	}

	@Override
	public List<PlayersBean> getRagisteredPlayers(int tournamentId, int categoryId) {
		// TODO Auto-generated method stub
		return tournamentDao.getRagisteredPlayers(tournamentId, categoryId);
	}

	@Override
	public List<MatchTournamentCategoryBean> createTournamentLavelSchedule(int tournamentId) {
		// TODO Auto-generated method stub
		return tournamentDao.createTournamentLavelSchedule(tournamentId);
	}

	@Override
	public TournamentLavelScheduleBean ViewTournamentLavelSchedule(int tournamentId) {
		// TODO Auto-generated method stub
		return tournamentDao.ViewTournamentLavelSchedule(tournamentId);
	}

	@Override
	public List<MatchTournamentBean> getTournamentListForUpdateScore(int orgId) {
		// TODO Auto-generated method stub
		return tournamentDao.getTournamentListForUpdateScore(orgId);
	}

	@Override
	public List<MatchRoundBean> getRoundMatchRoundList(int tournamentId, int categoryId) {
		// TODO Auto-generated method stub
		return tournamentDao.getRoundMatchRoundList(tournamentId, categoryId);
	}

	@Override
	public String updateMatchStatus(UpdateMatchScore bean) {
		// TODO Auto-generated method stub
		return tournamentDao.updateMatchStatus(bean);
	}

	@Override
	public TournamentList mainCategoryList(int tournamentId) {
		// TODO Auto-generated method stub
		return tournamentDao.mainCategoryList(tournamentId);
	}

	@Override
	public boolean isScheduleCreated(int tournamentId) {
		// TODO Auto-generated method stub
		return tournamentDao.isScheduleCreated(tournamentId);
	}

	@Override
	public TournamentList singleTournamentWithCategories(int playerid, String currentDate, int tournamentId) {
		// TODO Auto-generated method stub
		return tournamentDao.singleTournamentWithCategories(playerid, currentDate, tournamentId);
	}

	@Override
	public String updatePlayersDetails(JSONArray playerJson) {
		// TODO Auto-generated method stub
		return tournamentDao.updatePlayersDetails(playerJson);
	}

	@Override
	public String extendsTournamentDate(ExtendsBean bean) {
		// TODO Auto-generated method stub
		return tournamentDao.extendsTournamentDate(bean);
	}

	@Override
	public boolean getDrawsPublishMethod(int tournamentId, int categoryId) {
		// TODO Auto-generated method stub
		return tournamentDao.getDrawsPublishMethod(tournamentId, categoryId);
	}

	@Override
	public String setActiveOrInActiveDraw(int tournamentId, int categoryId, int activeVal) {
		// TODO Auto-generated method stub
		return tournamentDao.setActiveOrInActiveDraw(tournamentId, categoryId, activeVal);
	}

	@Override
	public String setActiveOrInActivePlayers(int tournamentId, int categoryId, int activeVal) {
		// TODO Auto-generated method stub
		return tournamentDao.setActiveOrInActivePlayers(tournamentId, categoryId, activeVal);
	}

	@Override
	public PlayesrListAndPublishPlayer isPlayerListPublish(int tournamentId, int categoryId) {
		// TODO Auto-generated method stub
		return tournamentDao.isPlayerListPublish(tournamentId, categoryId);
	}

	@Override
	public boolean getPlayerPublishMethod(int tournamentId, int categoryId) {
		// TODO Auto-generated method stub
		return tournamentDao.getPlayerPublishMethod(tournamentId, categoryId);
	}

	@Override
	public String multiplayerdelete(JSONArray deletePlayerList) {
		// TODO Auto-generated method stub
		return tournamentDao.multiplayerdelete(deletePlayerList);
	}


}
