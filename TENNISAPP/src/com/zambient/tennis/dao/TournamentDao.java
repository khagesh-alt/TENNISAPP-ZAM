package com.zambient.tennis.dao;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import com.zambient.tennis.bean.BuildSchedule;
import com.zambient.tennis.bean.CategoryMasterBean;
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
import com.zambient.tennis.bean.TournamentLavelScheduleBean;
import com.zambient.tennis.bean.TournamentList;
import com.zambient.tennis.bean.UpdateMatchScore;

public interface TournamentDao {

	public List<CategoryMasterBean> getTournamentCategories();
	public int buildTournament(JSONObject addtournamentJson, String imagePath);
	public List<TournamentList> getUpcommingTournament(int playerId);
	public int addPaymentForTournamentCategory(PaymentBean paymentBean);
	public String registerPlayerForTournamentCategory(PaymentBean paymentBean,int paymentID,int secPlayerId);
	public List<RoundListWithMatchs> buildCategoryDrwas(int tournamentId,int categoryId);
	public List<MyTournaments> getMyTournaments(int orgId);
	public String addPlayerByOrganizer(PlayersBean playersBean);
	public List<PlayersBean> getPlayerListForEachTournament(int tournamentId, int categoryId);
	public List<TournamentList> getOrganizerTournament(int orgId);
	public List<TournamentList> upcommingTournament(int playerId,String currentDate);
	public List<PlayersBean> getExistingPlayerList(int tournamentId, int categoryId);
	public String registerExistingPlayerUrl(int playerId,int tournamentId,int categoryId,int entryFee, int itaRank);
	public EmailTemplateBean retrieveEmailTemplate(String type);
	public String updateAitaRankByOrganiser(JSONArray playerRank);
	public String addDoublesPlayerForTournament(JSONArray doublesPlayer);
	public List<ScheduleInnerBean> getScheduleList(int tournamentId, int categoryId);
	public BuildSchedule getDaysAndNoOfMatchs(int tournamentId);
	public String saveScheduleData(JSONArray scheduleJson);
	public List<MatchTournamentBean> getTournamentListToUpdateScore(int orgId);
	public String updateMatchScore(UpdateMatchScore bean);
	public List<RoundBean> getDataForSchedule(int tournamentid);
	public boolean isDrwasCreated(int tournamentId);
	public String removePlayerFromTournament(int playerId, int paymentId, int tournamentId, int categoryId);
	public List<PlayersBean> getRagisteredPlayers(int tournamentId, int categoryId);
	public List<MatchTournamentCategoryBean> createTournamentLavelSchedule(int tournamentId);
	public TournamentLavelScheduleBean ViewTournamentLavelSchedule(int tournamentId);
	public List<MatchTournamentBean> getTournamentListForUpdateScore(int orgId);
	public List<MatchRoundBean> getRoundMatchRoundList(int tournamentId, int categoryId);
	public String updateMatchStatus(UpdateMatchScore bean);
	public TournamentList mainCategoryList(int tournamentId);
	public boolean isScheduleCreated(int tournamentId);
	public TournamentList singleTournamentWithCategories(int playerid,String currentDate,int tournamentId);
	public String updatePlayersDetails(JSONArray playerJson);
	public String extendsTournamentDate(ExtendsBean bean);
	public boolean getDrawsPublishMethod(int tournamentId, int categoryId);
	public String setActiveOrInActiveDraw(int tournamentId, int categoryId, int activeVal);
	public String setActiveOrInActivePlayers(int tournamentId, int categoryId, int activeVal);
	public PlayesrListAndPublishPlayer isPlayerListPublish(int tournamentId, int categoryId);
	public boolean getPlayerPublishMethod(int tournamentId, int categoryId);
	public String multiplayerdelete(JSONArray deletePlayerList);
	
	
}
