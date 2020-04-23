package com.zambient.tennis.dao;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sun.org.apache.xerces.internal.util.ShadowedSymbolTable;
import com.zambient.tennis.bean.BuildSchedule;
import com.zambient.tennis.bean.CategoryMasterBean;
import com.zambient.tennis.bean.CourtBean;
import com.zambient.tennis.bean.DateBean;
import com.zambient.tennis.bean.DrawsPlayer;
import com.zambient.tennis.bean.DrawsTeam;
import com.zambient.tennis.bean.DrwasFirstAndSecondSets;
import com.zambient.tennis.bean.DrwasMatch;
import com.zambient.tennis.bean.EmailTemplateBean;
import com.zambient.tennis.bean.ExtendsBean;
import com.zambient.tennis.bean.MatchBean;
import com.zambient.tennis.bean.MatchCategoryBean;
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
import com.zambient.tennis.util.CommonUtil;
import com.zambient.tennis.util.UserSession;

@PropertySource("classpath:/com/zambient/tennis/resources/tennisapp.properties")
@Repository("tournamentDao")
public class TournamentDaoImpl implements TournamentDao{
	final static Logger log = Logger.getLogger(TournamentDaoImpl.class);
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired 
	private UserSession userSession;
	
	/**
	 * This method is used to get all tournament categories
	 * */
	@Override
	public List<CategoryMasterBean> getTournamentCategories() {
		log.info("TournamentDaoImpl :: getTournamentCategories method");
		List<CategoryMasterBean> listData = new ArrayList<CategoryMasterBean>();
		String QUERY = "SELECT category_id,category_name FROM `category_master`";
		
		try{
			listData = jdbcTemplate.query(QUERY,new BeanPropertyRowMapper<CategoryMasterBean>(CategoryMasterBean.class));
        }catch(Exception e){
        	e.printStackTrace();
        	return listData;
        }
		return listData;
	}
	/**
	 * This method is used to post or create tournament.
	 * */
	@Override
	public int buildTournament(JSONObject addtournamentJson, String imagePath) {
		String result = null;
		int tournamentId = 0;
		String QUERY1 = "INSERT INTO `tournament` (orgaizer_id,tournament_title,tournament_venue_id,tournament_statrdate,tournament_enddate,organizer_name,organizer_phone,"
				+ "organizer_altphone,organizer_mailId,banner_image,reg_start_date,reg_end_date) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
		
		String QUERY2 = "INSERT INTO `refefree_master` (tournament_id,refefree_name) VALUES(?,?)";
		String QUERY3 = "INSERT INTO `tournament_category` (tournament_id,category_id,prize_money,tournament_fee) VALUES(?,?,?,?)";
		
		synchronized (this) {
			try{
	    		 jdbcTemplate.update(QUERY1, new Object[]{addtournamentJson.getInt("organiserId"),addtournamentJson.getString("tournament"),addtournamentJson.getInt("venueId"),
	    				 addtournamentJson.getString("tournamentStartDate"),addtournamentJson.getString("tournamentEndDate"),addtournamentJson.getString("organizer"),
	    				 addtournamentJson.getString("contactNo"),addtournamentJson.getString("altContactNo"),addtournamentJson.getString("mailId"),imagePath,
	    				 addtournamentJson.getString("regStartDate"),addtournamentJson.getString("regEndDate")});
	    		 tournamentId = jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID(tournament_id) FROM `tournament` ORDER BY tournament_id DESC  LIMIT 1", Integer.class);
	    		 jdbcTemplate.update(QUERY2,new Object[]{tournamentId,addtournamentJson.getString("referee")});
	    		 for (int i = 0; i < addtournamentJson.getJSONArray("category").length(); ++i) {
	    			 JSONObject rec = addtournamentJson.getJSONArray("category").getJSONObject(i);
	    			 jdbcTemplate.update(QUERY3, new Object[]{tournamentId,rec.getInt("categoryId"),rec.getInt("prizeMoney"),rec.getInt("entryFee")});
	    		 }
	    		 result = "Tournament created successfully.";
	    	}catch(Exception e){
	    		result="Some thing went wrong";
	    		tournamentId = 0;
	    		e.printStackTrace();
	    		log.error("Exception In TournamentDaoImpl buildTournament() :: "+e);
	    	}
		}
		return tournamentId;
	}
	/**
	 * This method is used to get created (upcoming) tournament with name, categories and registered players
	 * */
	@Override
	public List<TournamentList> getUpcommingTournament(int playerId) {
		System.out.println("playerId>> "+playerId);
		List<TournamentList> listData = new ArrayList<TournamentList>();
		String QUERY = "SELECT t.`tournament_id`,t.`tournament_title`,t.orgaizer_id,(SELECT v.venue_name FROM `venues` v WHERE v.venue_id = t.`tournament_venue_id`) AS venueName,"
				+ "(SELECT v.venue_location FROM `venues` v WHERE v.venue_id = t.`tournament_venue_id`) AS venue_location,"
				+ "DATE_FORMAT(t.`tournament_date`, '%d-%b-%Y') AS tournament_date,t.`organizer_name`,t.`organizer_phone`,t.`organizer_altphone`,t.`organizer_mailId`,t.`banner_image`,m.`refefree_name`"
				+ " FROM `tournament` t INNER JOIN `refefree_master` m ON t.`tournament_id`=m.`tournament_id`";
		try{
			List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY);
			if(rows != null && rows.size()>0) {
				for(Map row : rows){
					TournamentList bean = new TournamentList();
					bean.setTournamentId(row.get("tournament_id")!=null?Integer.parseInt(row.get("tournament_id").toString()):0);
					bean.setTitle(row.get("tournament_title")!=null?row.get("tournament_title").toString():"");
					bean.setOrgaizerId(row.get("orgaizer_id")!=null?Integer.parseInt(row.get("orgaizer_id").toString()):0);
					bean.setVenueName(row.get("venueName")!=null?row.get("venueName").toString():"");
					bean.setLocation(row.get("venue_location")!=null?row.get("venue_location").toString():"");
					bean.setDate(row.get("tournament_date")!=null?row.get("tournament_date").toString():"");
					bean.setOrganizerName(row.get("organizer_name")!=null?row.get("organizer_name").toString():"");
					bean.setPhone(row.get("organizer_phone")!=null?row.get("organizer_phone").toString():"");
					bean.setAltPhone(row.get("organizer_altphone")!=null?row.get("organizer_altphone").toString():"");
					bean.setEmail(row.get("organizer_mailId")!=null?row.get("organizer_mailId").toString():"");
					bean.setBannerImage(row.get("banner_image")!=null?row.get("banner_image").toString():"");
					bean.setRefereeName(row.get("refefree_name")!=null?row.get("refefree_name").toString():"");
					bean.setCategoryList(jdbcTemplate.query("SELECT c.`category_id`,(SELECT i.`category_name` FROM `category_master` i WHERE i.`category_id` = c.`category_id`) AS categoryName,"
							+ "c.`prize_money`,c.`tournament_fee`,DATE_FORMAT(c.`start_date`, '%d-%b-%Y') AS start_date,DATE_FORMAT(c.`end_date`, '%d-%b-%Y')AS end_date,"
							+ "COALESCE((SELECT t.player_id FROM `player_tournament` t WHERE t.tournament_id = "+(row.get("tournament_id")!=null?Integer.parseInt(row.get("tournament_id").toString()):0)+" AND t.category_id=c.`category_id` AND t.player_id = "+playerId+"),-1) AS playerId"
							+ " FROM `tournament_category` c WHERE c.`tournament_id` = "+(row.get("tournament_id")!=null?Integer.parseInt(row.get("tournament_id").toString()):0)+"",new BeanPropertyRowMapper<TournamentCategoryBean>(TournamentCategoryBean.class)));
					listData.add(bean);
				}
			}
	        }catch(Exception e){
	        	e.printStackTrace();
	        	return listData;
	        }
		return listData;
	}

	@Override
	public int addPaymentForTournamentCategory(PaymentBean paymentBean) {
		log.info("TournamentDaoImpl :: addPaymentForTournamentCategory method");
		log.info("paymentBean ::"+paymentBean);
		int paymentId = -1;
		String QUERY = "INSERT INTO `payment` (category_id,tournament_id,card_holder_name,card_number,card_type,transaction_status,amount) VALUES(?,?,?,?,?,?,?)";
		try{
			 jdbcTemplate.update(QUERY, new Object[]{paymentBean.getCategoryId(),paymentBean.getTournamentId(),paymentBean.getCardHolderName(),paymentBean.getCardNumber(),paymentBean.getCardType(),paymentBean.getTransactionStatus(),paymentBean.getAmount()});
			 paymentId = jdbcTemplate.queryForObject("SELECT payment_id FROM `payment` ORDER BY payment_id DESC LIMIT 1", Integer.class);
		}catch(Exception e){
    		e.printStackTrace();
    		log.error("Exception In TournamentDaoImpl addPaymentForTournamentCategory() :: "+e);
    	}
		return paymentId;
	}

	@Override
	public String registerPlayerForTournamentCategory(PaymentBean paymentBean, int paymentID, int secPlayerId) {
		log.info("TournamentDaoImpl :: registerPlayerForTournamentCategory method");
		log.info("paymentBean ::"+paymentBean);
		int aitaRank = jdbcTemplate.queryForObject("SELECT `player_itarank` FROM `players` WHERE `player_id`="+paymentBean.getPlayerId(), Integer.class);
		
		String result =null;
		String QUERY = "INSERT INTO `player_tournament` (player_id1,player_id2,tournament_id,category_id,custom_aita,payment_id) VALUES(?,?,?,?,?,?)"; 
		try{
			int val = jdbcTemplate.update(QUERY, new Object[]{paymentBean.getPlayerId(),secPlayerId,paymentBean.getTournamentId(),paymentBean.getCategoryId(),aitaRank,paymentID});
			if(val >0)
    			result = "Payment Received Successfully";
    		else
    			result = "Something Wnr Wrong Try again";
		
		}catch(Exception e){
			result = "Something Wnr Wrong Try again";
    		e.printStackTrace();
    		log.error("Exception In TournamentDaoImpl addPaymentForTournamentCategory() :: "+e);
    	}
		return result;
	}
	@Override
	public String updateAitaRankByOrganiser(JSONArray playerRank) {
		int tournamentid=0,categoryid=0;
		String result=null;
		String QUERY ="UPDATE player_tournament SET custom_aita = ? WHERE player_id1 = ? AND tournament_id = ? AND category_id = ?";
		try {
			int val=0;
			for (int i = 0; i < playerRank.length(); ++i) {
			 JSONObject rec;
			    rec = playerRank.getJSONObject(i);
			    tournamentid = rec.getInt("tournamentId");
			    categoryid = rec.getInt("categoryId");
			    val =jdbcTemplate.update(QUERY,new Object[]{rec.getInt("updatedRank"),rec.getInt("playerId"),rec.getInt("tournamentId"),rec.getInt("categoryId")});
			}
			if(val > 0)
				result = createCategoryDrwas(tournamentid,categoryid);
			//result = testDrawsForSixteen(tournamentid,categoryid);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			result="Something Went Wrong.";
			e.printStackTrace();
		}
		return result;
	}
	public synchronized  String createCategoryDrwas(int tournamentId,int categoryId) {
		String result="Draws created successfully.";
		List<DrwasFirstAndSecondSets> listData = new ArrayList<DrwasFirstAndSecondSets>();
		List<DrawsPlayer> listBean = getMatchPlayerList(tournamentId,categoryId);
		List<DrawsPlayer> finalListBean = new ArrayList<DrawsPlayer>();
		DrwasFirstAndSecondSets drwasFirstAndSecondSets = new DrwasFirstAndSecondSets();
		int loopSize = 0;
		/*if(listBean.size() >2 && listBean.size() <= 4)
			loopSize = 4 - listBean.size();*/
		if(listBean.size() >4 && listBean.size() <= 8){
			loopSize = 8 - listBean.size();
			for (int index = 0; index < 2; index++){
				finalListBean.add(listBean.get(0));
				listBean.remove(0);
			}
			finalListBean = CommonUtil.editPlayerListIndex(listBean,finalListBean);
		}
		else if(listBean.size() >8 && listBean.size() <= 16){
			loopSize = 16 - listBean.size();
			for (int index = 0; index < 4; index++){
				finalListBean.add(listBean.get(0));
				listBean.remove(0);
			}
			finalListBean = CommonUtil.editPlayerListIndex(listBean,finalListBean);
		}
		else if(listBean.size() >16 && listBean.size() <= 32){
		    loopSize = 32 - listBean.size();
		    for (int index = 0; index < 8; index++){
				finalListBean.add(listBean.get(0));
				listBean.remove(0);
			}
			finalListBean = CommonUtil.editPlayerListIndex(listBean,finalListBean);
		}
		else if(listBean.size() >32 && listBean.size() <= 64){
		    loopSize = 64 - listBean.size();
		    for (int index = 0; index < 16; index++){
				finalListBean.add(listBean.get(0));
				listBean.remove(0);
			}
			finalListBean = CommonUtil.editPlayerListIndex(listBean,finalListBean);
		}
		else if(listBean.size() >64 && listBean.size() <= 128){
		    loopSize = 128 - listBean.size();
		    finalListBean = listBean;
		}
		
		else{
			return "Minimum Players should be 5";
		}
		for(int i=0; i< loopSize; i++){
			DrawsPlayer bean = new DrawsPlayer();
			bean.setBooleanVal(false);
			bean.setByMatch(true);
			finalListBean.add(bean);
		}
		List<DrwasMatch> firstSet1 = new ArrayList<DrwasMatch>();
		List<DrwasMatch> secondSet1 = new ArrayList<DrwasMatch>();
		for(int index = 0;index < (finalListBean.size()/2); index++){
			List<DrawsPlayer> player = new ArrayList<DrawsPlayer>();
			DrwasMatch match = new DrwasMatch();
			DrawsPlayer pl1 = new DrawsPlayer();
			DrawsPlayer pl2 = new DrawsPlayer();
			 pl1 = finalListBean.get(index);
			 pl2 = finalListBean.get((finalListBean.size()-1)-index);
			player.add(pl1);
			player.add(pl2);
			match.setMatch(player);
			if ( index % 2 == 0 ){
				firstSet1.add(match);
			}else{
				secondSet1.add(match);
			}
		}
		System.out.println("listBean :: "+finalListBean.size());
		if(finalListBean.size() == 8){
			int arr8[] = {0,3,2,1};
			drwasFirstAndSecondSets = getFirstRound(firstSet1,secondSet1,arr8);
		}else if(finalListBean.size() == 16){
			//int arr16[] = {0,7,6,3,2,5,4,1};
			int arr16[] = {0,71,61,31,21,51,41,1};
			ArrayList<Integer> positions=new ArrayList<Integer>();
			positions.add(1);positions.add(2);positions.add(5);positions.add(6);
			ArrayList<Integer> values=new ArrayList<Integer>();
			values.add(4);values.add(5);values.add(6);values.add(7);
			CommonUtil.editArray(arr16,positions,values);
			ArrayList<Integer> positions1=new ArrayList<Integer>();
			positions1.add(3);
			positions1.add(4);
			ArrayList<Integer> values1=new ArrayList<Integer>();
			values1.add(3);
			values1.add(2);
			CommonUtil.editArray(arr16,positions1,values1);
			 drwasFirstAndSecondSets = getFirstRound(firstSet1,secondSet1,arr16);
		}
		else if(finalListBean.size() == 32){
			//int arr32[] = {0, 8, 15, 7, 4, 12, 11, 3, 2, 10, 13, 5, 6, 14, 9, 1};
			int arr32[] = {0, 81, 151, 71, 41, 121, 111, 31, 21, 101, 131, 51, 61, 141, 91, 1};
			ArrayList<Integer> positions=new ArrayList<Integer>();
			positions.add(4);
			positions.add(11);
			ArrayList<Integer> values=new ArrayList<Integer>();
			values.add(3);
			values.add(2);
			CommonUtil.editArray(arr32,positions,values);
			
			ArrayList<Integer> positions2=new ArrayList<Integer>();
			positions2.add(3);positions2.add(7);positions2.add(8);positions2.add(12);
			ArrayList<Integer> values2=new ArrayList<Integer>();
			values2.add(4);values2.add(5);values2.add(6);values2.add(7);
			CommonUtil.editArray(arr32,positions2,values2);
			ArrayList<Integer> positions3=new ArrayList<Integer>();
			positions3.add(1);positions3.add(2);positions3.add(5);positions3.add(6);positions3.add(9);
			positions3.add(10);positions3.add(13);positions3.add(14);
			ArrayList<Integer> values3=new ArrayList<Integer>();
			values3.add(8);values3.add(15);values3.add(12);values3.add(11);values3.add(10);
			values3.add(13);values3.add(14);values3.add(9);
			CommonUtil.editArray(arr32,positions3,values3);
			drwasFirstAndSecondSets = getFirstRound(firstSet1,secondSet1,arr32);
		}else if(finalListBean.size() == 64){
			int arr64[] = {0,24,23,12,11,25,22,7,5,26,21,13,10,27,20,3,2,28,19,14,9,29,18,6,4,30,17,15,8,31,16,1};
			ArrayList<Integer> positions=new ArrayList<Integer>();
			positions.add(4);
			positions.add(27);
			ArrayList<Integer> values=new ArrayList<Integer>();
			values.add(3);
			values.add(2);
			CommonUtil.editArray(arr64,positions,values);
			
			ArrayList<Integer> positions2=new ArrayList<Integer>();
			positions2.add(3);positions2.add(7);positions2.add(8);positions2.add(11);positions2.add(12);positions2.add(15);
			positions2.add(16);positions2.add(19);positions2.add(20);positions2.add(23);positions2.add(24);positions2.add(28);
			ArrayList<Integer> values2=new ArrayList<Integer>();
			values2.add(4);values2.add(5);values2.add(6);values2.add(7);values2.add(8);values2.add(9);values2.add(10);values2.add(11);
			values2.add(12);values2.add(13);values2.add(14);values2.add(15);
			CommonUtil.editArray(arr64,positions2,values2);
			
			ArrayList<Integer> positions3=new ArrayList<Integer>();
			positions3.add(1);positions3.add(2);positions3.add(5);positions3.add(6);positions3.add(9);positions3.add(10);positions3.add(13);
			positions3.add(14);positions3.add(17);positions3.add(18);positions3.add(21);positions3.add(22);positions3.add(25);
			positions3.add(26);positions3.add(29);positions3.add(30);
			ArrayList<Integer> values3=new ArrayList<Integer>();
			values3.add(16);values3.add(28);values3.add(18);values3.add(25);values3.add(30);values3.add(17);values3.add(21);values3.add(23);
			values3.add(19);values3.add(24);values3.add(20);values3.add(26);values3.add(22);values3.add(27);values3.add(31);values3.add(29);
			CommonUtil.editArray(arr64,positions3,values3);
			drwasFirstAndSecondSets = getFirstRound(firstSet1,secondSet1,arr64);
		}
		 List<DrwasMatch> firstSet = drwasFirstAndSecondSets.getFirstSet();
	     List<DrwasMatch> secondSet = drwasFirstAndSecondSets.getSecondSet();
		/*drwasFirstAndSecondSets.setFirstSet(firstSet);
		drwasFirstAndSecondSets.setSecondSet(secondSet);*/
		 if(drwasFirstAndSecondSets !=null)
		listData.add(drwasFirstAndSecondSets);
		int customSize = firstSet.size();
		for(int j=0;j<customSize;j++){
			if(firstSet.size() == 1)
				break;
			List<DrwasMatch> innerfirstSet = getRound(firstSet);
			List<DrwasMatch> innersecondSet = getRound(secondSet);
			DrwasFirstAndSecondSets outerInnerBean = new DrwasFirstAndSecondSets();
			outerInnerBean.setFirstSet(innerfirstSet);
			outerInnerBean.setSecondSet(innersecondSet);
			listData.add(outerInnerBean);
			firstSet = innerfirstSet;
			secondSet = innersecondSet;
		}
		DrwasFirstAndSecondSets outerBeanSec = new DrwasFirstAndSecondSets();
		List<DrawsPlayer> playerFirst = new ArrayList<DrawsPlayer>();
		List<DrwasMatch> outerfirstSet = new ArrayList<DrwasMatch>();
		DrwasMatch playersFirst = new DrwasMatch();
		DrawsPlayer pl1 = new DrawsPlayer();
		playerFirst.add(pl1);
		playersFirst.setMatch(playerFirst);
		outerfirstSet.add(playersFirst);
		outerBeanSec.setFirstSet(outerfirstSet);
		
		List<DrawsPlayer> playerSec = new ArrayList<DrawsPlayer>();
		List<DrwasMatch> outerSecondSet = new ArrayList<DrwasMatch>();
		DrwasMatch playersSec = new DrwasMatch();
		DrawsPlayer pl2 = new DrawsPlayer();
		playerSec.add(pl2);
		playersSec.setMatch(playerSec);
		outerSecondSet.add(playersSec);
		outerBeanSec.setSecondSet(outerSecondSet);
		listData.add(outerBeanSec);
		
		if(listData.size() > 0){
			System.out.println("listData.size() "+listData.size());
			if(listData.size() == 5){
				List<DrwasFirstAndSecondSets> persistlistData = updateOrdeiInList(listData);
			    result = saveDrawsDetail(persistlistData,tournamentId,categoryId);
			}
			else if(listData.size() == 4){
				List<DrwasFirstAndSecondSets> persistlistData = update16OrdeiInList(listData);
			    result = saveDrawsDetail(persistlistData,tournamentId,categoryId);
			}
			else if(listData.size() == 3){
				List<DrwasFirstAndSecondSets> persistlistData = update8OrdeiInList(listData);
			    result = saveDrawsDetail(persistlistData,tournamentId,categoryId);
			} else if(listData.size() == 6){
				List<DrwasFirstAndSecondSets> persistlistData = update64OrdeiInList(listData);
			    result = saveDrawsDetail(persistlistData,tournamentId,categoryId);
			}
			else
				result = saveDrawsDetail(listData,tournamentId,categoryId);
			}
		
		return result;
	}


	private List<DrwasFirstAndSecondSets> update8OrdeiInList(List<DrwasFirstAndSecondSets> listData) {
		List<DrwasFirstAndSecondSets> tempList = new ArrayList<DrwasFirstAndSecondSets>();
		for (int round = 0; round < listData.size(); round++) {
			if (round == 0) {
				DrwasFirstAndSecondSets drawBean = new DrwasFirstAndSecondSets();
				List<DrwasMatch> firstSet = new ArrayList<DrwasMatch>();
				List<DrwasMatch> drwasMatchFirstSet = listData.get(round).getFirstSet();
				for (int firstset = 0; firstset < drwasMatchFirstSet.size(); firstset++) {
						firstSet.add(drwasMatchFirstSet.get(firstset));
				}
				drawBean.setFirstSet(firstSet);
				List<DrwasMatch> drwasMatchSecondSet = listData.get(round).getSecondSet();
				List<DrwasMatch> SecondSet = new ArrayList<DrwasMatch>();
				for (int firstset = 0; firstset < drwasMatchSecondSet.size(); firstset++) {
					if(firstset == 1){
				    List<DrawsPlayer> tempplayerList = new ArrayList<DrawsPlayer>();
					List<DrawsPlayer> playerList = drwasMatchSecondSet.get(firstset).getMatch();
					tempplayerList.add(playerList.get(1));
					tempplayerList.add(playerList.get(0));
					DrwasMatch match = new DrwasMatch();
					match.setMatch(tempplayerList);
					SecondSet.add(match);
					//drawBean1.setSecondSet(SecondSet);
					}
					else{
						SecondSet.add(drwasMatchSecondSet.get(firstset));
						//drawBean1.setSecondSet(SecondSet);
					}
				}
				drawBean.setSecondSet(SecondSet);
				tempList.add(drawBean);
			}else{
				tempList.add(listData.get(round));
			}
		}
		return tempList;
	}

	private List<DrwasFirstAndSecondSets> update16OrdeiInList(List<DrwasFirstAndSecondSets> listData) {
		List<DrwasFirstAndSecondSets> tempList = new ArrayList<DrwasFirstAndSecondSets>();
		for (int round = 0; round < listData.size(); round++) {
			if (round == 0) {
				DrwasFirstAndSecondSets drawBean = new DrwasFirstAndSecondSets();
				List<DrwasMatch> firstSet = new ArrayList<DrwasMatch>();
				List<DrwasMatch> drwasMatchFirstSet = listData.get(round).getFirstSet();
				for (int firstset = 0; firstset < drwasMatchFirstSet.size(); firstset++) {
					if(firstset == 3){
				    List<DrawsPlayer> tempplayerList = new ArrayList<DrawsPlayer>();
					List<DrawsPlayer> playerList = drwasMatchFirstSet.get(firstset).getMatch();
					tempplayerList.add(playerList.get(1));
					tempplayerList.add(playerList.get(0));
					DrwasMatch match = new DrwasMatch();
					match.setMatch(tempplayerList);
					firstSet.add(match);
					//drawBean.setFirstSet(firstSet);
					}
					else{
						firstSet.add(drwasMatchFirstSet.get(firstset));
						//drawBean.setFirstSet(firstSet);
					}
					
				}
				drawBean.setFirstSet(firstSet);
				List<DrwasMatch> drwasMatchSecondSet = listData.get(round).getSecondSet();
				List<DrwasMatch> SecondSet = new ArrayList<DrwasMatch>();
				for (int firstset = 0; firstset < drwasMatchSecondSet.size(); firstset++) {
					if(firstset == 3){
				    List<DrawsPlayer> tempplayerList = new ArrayList<DrawsPlayer>();
					List<DrawsPlayer> playerList = drwasMatchSecondSet.get(firstset).getMatch();
					tempplayerList.add(playerList.get(1));
					tempplayerList.add(playerList.get(0));
					DrwasMatch match = new DrwasMatch();
					match.setMatch(tempplayerList);
					SecondSet.add(match);
					//drawBean1.setSecondSet(SecondSet);
					}
					else{
						SecondSet.add(drwasMatchSecondSet.get(firstset));
						//drawBean1.setSecondSet(SecondSet);
					}
				}
				drawBean.setSecondSet(SecondSet);
				tempList.add(drawBean);
			}else{
				tempList.add(listData.get(round));
			}
		}
		return tempList;
	}

	private List<DrwasFirstAndSecondSets> updateOrdeiInList(List<DrwasFirstAndSecondSets> listData) {
		List<DrwasFirstAndSecondSets> tempList = new ArrayList<DrwasFirstAndSecondSets>();
		for (int round = 0; round < listData.size(); round++) {
			if (round == 0) {
				DrwasFirstAndSecondSets drawBean = new DrwasFirstAndSecondSets();
				List<DrwasMatch> firstSet = new ArrayList<DrwasMatch>();
				List<DrwasMatch> drwasMatchFirstSet = listData.get(round).getFirstSet();
				for (int firstset = 0; firstset < drwasMatchFirstSet.size(); firstset++) {
					if(firstset == 3 || firstset == 7){
				    List<DrawsPlayer> tempplayerList = new ArrayList<DrawsPlayer>();
					List<DrawsPlayer> playerList = drwasMatchFirstSet.get(firstset).getMatch();
					tempplayerList.add(playerList.get(1));
					tempplayerList.add(playerList.get(0));
					DrwasMatch match = new DrwasMatch();
					match.setMatch(tempplayerList);
					firstSet.add(match);
					//drawBean.setFirstSet(firstSet);
					}
					else{
						firstSet.add(drwasMatchFirstSet.get(firstset));
						//drawBean.setFirstSet(firstSet);
					}
					
				}
				drawBean.setFirstSet(firstSet);
				List<DrwasMatch> drwasMatchSecondSet = listData.get(round).getSecondSet();
				List<DrwasMatch> SecondSet = new ArrayList<DrwasMatch>();
				for (int firstset = 0; firstset < drwasMatchSecondSet.size(); firstset++) {
					if(firstset == 3 || firstset == 7){
				    List<DrawsPlayer> tempplayerList = new ArrayList<DrawsPlayer>();
					List<DrawsPlayer> playerList = drwasMatchSecondSet.get(firstset).getMatch();
					tempplayerList.add(playerList.get(1));
					tempplayerList.add(playerList.get(0));
					DrwasMatch match = new DrwasMatch();
					match.setMatch(tempplayerList);
					SecondSet.add(match);
					//drawBean1.setSecondSet(SecondSet);
					}
					else{
						SecondSet.add(drwasMatchSecondSet.get(firstset));
						//drawBean1.setSecondSet(SecondSet);
					}
				}
				drawBean.setSecondSet(SecondSet);
				tempList.add(drawBean);
			}else{
				tempList.add(listData.get(round));
			}
		}
		return tempList;
	}
	private List<DrwasFirstAndSecondSets> update64OrdeiInList(List<DrwasFirstAndSecondSets> listData) {
		List<DrwasFirstAndSecondSets> tempList = new ArrayList<DrwasFirstAndSecondSets>();
		for (int round = 0; round < listData.size(); round++) {
			if (round == 0) {
				DrwasFirstAndSecondSets drawBean = new DrwasFirstAndSecondSets();
				List<DrwasMatch> firstSet = new ArrayList<DrwasMatch>();
				List<DrwasMatch> drwasMatchFirstSet = listData.get(round).getFirstSet();
				for (int firstset = 0; firstset < drwasMatchFirstSet.size(); firstset++) {
					if(firstset == 3 || firstset == 7 || firstset == 11 || firstset == 15){
				    List<DrawsPlayer> tempplayerList = new ArrayList<DrawsPlayer>();
					List<DrawsPlayer> playerList = drwasMatchFirstSet.get(firstset).getMatch();
					tempplayerList.add(playerList.get(1));
					tempplayerList.add(playerList.get(0));
					DrwasMatch match = new DrwasMatch();
					match.setMatch(tempplayerList);
					firstSet.add(match);
					}
					else{
						firstSet.add(drwasMatchFirstSet.get(firstset));
					}
					
				}
				drawBean.setFirstSet(firstSet);
				List<DrwasMatch> drwasMatchSecondSet = listData.get(round).getSecondSet();
				List<DrwasMatch> SecondSet = new ArrayList<DrwasMatch>();
				for (int firstset = 0; firstset < drwasMatchSecondSet.size(); firstset++) {
					if(firstset == 3 || firstset == 7 || firstset == 11 || firstset == 15){
				    List<DrawsPlayer> tempplayerList = new ArrayList<DrawsPlayer>();
					List<DrawsPlayer> playerList = drwasMatchSecondSet.get(firstset).getMatch();
					tempplayerList.add(playerList.get(1));
					tempplayerList.add(playerList.get(0));
					DrwasMatch match = new DrwasMatch();
					match.setMatch(tempplayerList);
					SecondSet.add(match);
					}
					else{
						SecondSet.add(drwasMatchSecondSet.get(firstset));
					}
				}
				drawBean.setSecondSet(SecondSet);
				tempList.add(drawBean);
			}else{
				tempList.add(listData.get(round));
			}
		}
		return tempList;
	}
	private List<DrwasMatch> getRound(List<DrwasMatch> firstSet) {
		List<DrwasMatch> innerfirstSet = new ArrayList<DrwasMatch>();
		for(int index = 0;index < firstSet.size(); index+=2){
			int secInd = index+1;
			List<DrawsPlayer> player = new ArrayList<DrawsPlayer>();
			DrwasMatch players = new DrwasMatch();
			DrawsPlayer pl1 = new DrawsPlayer();
			DrawsPlayer pl2 = new DrawsPlayer();
			if(!(firstSet.get(index).getMatch().get(0).isBooleanVal())){
				//pl1.setAge(firstSet.get(index).getMatch().get(1).getAge());
				pl1.setCategoryId(firstSet.get(index).getMatch().get(1).getCategoryId());
				pl1.setMobile(firstSet.get(index).getMatch().get(1).getMobile());
				pl1.setMobile2(firstSet.get(index).getMatch().get(1).getMobile2());
				pl1.setName(firstSet.get(index).getMatch().get(1).getName());
				pl1.setName2(firstSet.get(index).getMatch().get(1).getName2());
				pl1.setPlayerId(firstSet.get(index).getMatch().get(1).getPlayerId());
				pl1.setPlayerId2(firstSet.get(index).getMatch().get(1).getPlayerId2());
				pl1.setRank(firstSet.get(index).getMatch().get(1).getRank());
				pl1.setTournamentId(firstSet.get(index).getMatch().get(1).getTournamentId());
				pl1.setTeam(firstSet.get(index).getMatch().get(1).getTeam());
				pl1.setMatchType(firstSet.get(index).getMatch().get(1).getMatchType());
				pl1.setBooleanVal(true);
				player.add(pl1);
			}
			else if(!(firstSet.get(index).getMatch().get(1).isBooleanVal())){
				//pl1.setAge(firstSet.get(index).getMatch().get(0).getAge());
				pl1.setCategoryId(firstSet.get(index).getMatch().get(0).getCategoryId());
				pl1.setMobile(firstSet.get(index).getMatch().get(0).getMobile());
				pl1.setMobile2(firstSet.get(index).getMatch().get(0).getMobile2());
				pl1.setName(firstSet.get(index).getMatch().get(0).getName());
				pl1.setName2(firstSet.get(index).getMatch().get(0).getName2());
				pl1.setPlayerId(firstSet.get(index).getMatch().get(0).getPlayerId());
				pl1.setPlayerId2(firstSet.get(index).getMatch().get(0).getPlayerId2());
				pl1.setRank(firstSet.get(index).getMatch().get(0).getRank());
				pl1.setTournamentId(firstSet.get(index).getMatch().get(0).getTournamentId());
				pl1.setTeam(firstSet.get(index).getMatch().get(0).getTeam());
				pl1.setMatchType(firstSet.get(index).getMatch().get(0).getMatchType());
				pl1.setBooleanVal(true);
				player.add(pl1);
			}
			else{
				//pl1.setPlayerId((long) -1);
				pl1.setBooleanVal(true);
				player.add(pl1);
			}
			if(!(firstSet.get(secInd).getMatch().get(0).isBooleanVal())){
				//pl2.setAge(firstSet.get(secInd).getMatch().get(1).getAge());
				pl2.setCategoryId(firstSet.get(secInd).getMatch().get(1).getCategoryId());
				pl2.setMobile(firstSet.get(secInd).getMatch().get(1).getMobile());
				pl2.setMobile2(firstSet.get(secInd).getMatch().get(1).getMobile2());
				pl2.setName(firstSet.get(secInd).getMatch().get(1).getName());
				pl2.setName2(firstSet.get(secInd).getMatch().get(1).getName2());
				pl2.setPlayerId(firstSet.get(secInd).getMatch().get(1).getPlayerId());
				pl2.setPlayerId2(firstSet.get(secInd).getMatch().get(1).getPlayerId2());
				pl2.setRank(firstSet.get(secInd).getMatch().get(1).getRank());
				pl2.setTournamentId(firstSet.get(secInd).getMatch().get(1).getTournamentId());
				pl2.setTeam(firstSet.get(secInd).getMatch().get(1).getTeam());
				pl2.setMatchType(firstSet.get(secInd).getMatch().get(1).getMatchType());
				pl2.setBooleanVal(true);
				player.add(pl2);
			}
			else if(!(firstSet.get(secInd).getMatch().get(1).isBooleanVal())){
				//pl2.setAge(firstSet.get(secInd).getMatch().get(0).getAge());
				pl2.setCategoryId(firstSet.get(secInd).getMatch().get(0).getCategoryId());
				pl2.setMobile(firstSet.get(secInd).getMatch().get(0).getMobile());
				pl2.setMobile2(firstSet.get(secInd).getMatch().get(0).getMobile2());
				pl2.setName(firstSet.get(secInd).getMatch().get(0).getName());
				pl2.setName2(firstSet.get(secInd).getMatch().get(0).getName2());
				pl2.setPlayerId(firstSet.get(secInd).getMatch().get(0).getPlayerId());
				pl2.setPlayerId2(firstSet.get(secInd).getMatch().get(0).getPlayerId2());
				pl2.setRank(firstSet.get(secInd).getMatch().get(0).getRank());
				pl2.setTournamentId(firstSet.get(secInd).getMatch().get(0).getTournamentId());
				pl2.setTeam(firstSet.get(secInd).getMatch().get(0).getTeam());
				pl2.setMatchType(firstSet.get(secInd).getMatch().get(0).getMatchType());
				pl2.setBooleanVal(true);
				player.add(pl2);
			}
			else{
				pl2.setBooleanVal(true);
				player.add(pl2);
			}
			players.setMatch(player);
			innerfirstSet.add(players);
		}
		return innerfirstSet;
	}
	private List<DrawsPlayer> getMatchPlayerList(int tournamentId,int categoryId) {
		List<DrawsPlayer> drwasList = new ArrayList<DrawsPlayer>();
		String QUERY = "SELECT t.`player_id1`,t.`player_id2`,t.`custom_aita`,"
				+ "(SELECT IF((SELECT c.category_desc FROM category_master c WHERE c.category_id = "+categoryId+") = 1, 'SINGLE', 'DOUBLE'))AS matchType,"
				+ " (SELECT p.player_name FROM `players` p WHERE p.player_id = t.`player_id1`) AS player1,"
				+ "(SELECT p.player_name FROM `players` p WHERE p.player_id = t.`player_id2`) AS player2,"
				+ " (SELECT p.player_email FROM `players` p WHERE p.player_id = t.`player_id1`) AS playerEmail1,"
				+ "(SELECT p.player_email FROM `players` p WHERE p.player_id = t.`player_id2`) AS playerEmail2,"
				+ " (SELECT p.player_phone FROM `players` p WHERE p.player_id = t.`player_id1`) AS playerPhone1,"
				+ "(SELECT p.player_phone FROM `players` p WHERE p.player_id = t.`player_id2`) AS playerPhone2,"
				+ "(SELECT p.player_itarank FROM `players` p WHERE p.player_id = t.`player_id1`) AS player_itarank "
				+ " FROM `player_tournament` t WHERE t.`category_id`="+categoryId+" AND t.`tournament_id`="+tournamentId+" AND t.`payment_id` IS NOT NULL ORDER BY t.`custom_aita` ASC";
		try{
			List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY);
			if(rows != null && rows.size()>0) {
				for(Map row : rows){
					DrawsPlayer bean = new DrawsPlayer();
					bean.setPlayerId(row.get("player_id1")!=null?Long.parseLong(row.get("player_id1").toString()):-1);
					bean.setPlayerId2(row.get("player_id2")!=null?Long.parseLong(row.get("player_id2").toString()):-1);
					bean.setName(row.get("player2")!=null?row.get("player2").toString():"");
					bean.setName(row.get("player1")!=null?row.get("player1").toString():"");
					bean.setMobile(row.get("playerPhone1")!=null?row.get("playerPhone1").toString():"");
					bean.setMobile2(row.get("playerPhone2")!=null?row.get("playerPhone2").toString():"");
					bean.setRank(row.get("custom_aita")!=null?Long.parseLong(row.get("custom_aita").toString()):-1);
					bean.setTournamentId((long) tournamentId);
					bean.setCategoryId((long) categoryId);
					bean.setRank(row.get("custom_aita")!=null?Long.parseLong(row.get("custom_aita").toString()):-1);
					bean.setTeam(String.valueOf(row.get("player_id1")!=null?Long.parseLong(row.get("player_id1").toString()):-1) +","+String.valueOf(row.get("player_id2")!=null?Long.parseLong(row.get("player_id2").toString()):-1));
					bean.setMatchType(row.get("matchType")!=null?row.get("matchType").toString():"");
					bean.setBooleanVal(true);
					bean.setByMatch(false);
					drwasList.add(bean);
				}
			}
	        }catch(Exception e){
	        	e.printStackTrace();
	        	return drwasList;
	        }
		return drwasList;
	}

	/*private List<DrawsPlayer> getMatchPlayerList(int tournamentId,int categoryId) {
		List<DrawsPlayer> drwasList = new ArrayList<DrawsPlayer>();
		String QUERY = "SELECT  p.`player_id`,p.`player_name`,TIMESTAMPDIFF(YEAR,p.player_dob, NOW()) AS player_age,p.`player_phone`,t.`tournament_id`,t.`category_id`,"
				+ "r.`player_ranks`,p.player_itarank,t.`custom_aita` "
				+ " FROM players p INNER JOIN `player_tournament` t ON p.`player_id`=t.`player_id` INNER JOIN playerranks r ON p.`player_id`=r.`player_id`"
				+ " INNER JOIN payment p1 ON  p.`player_id`=p1.`player_id` WHERE t.`tournament_id`= "+tournamentId+" AND t.`category_id`="+categoryId+" AND"
				+ " p1.`transaction_status`='SUCCESS' GROUP BY p.`player_id` ORDER BY t.`custom_aita` ASC";
		try{
			List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY);
			if(rows != null && rows.size()>0) {
				for(Map row : rows){
					DrawsPlayer bean = new DrawsPlayer();
					bean.setPlayerId(row.get("player_id")!=null?Long.parseLong(row.get("player_id").toString()):-1);
					bean.setName(row.get("player_name")!=null?row.get("player_name").toString():"");
					bean.setAge(row.get("player_age")!=null?Long.parseLong(row.get("player_age").toString()):0);
					bean.setMobile(row.get("player_phone")!=null?row.get("player_phone").toString():"");
					bean.setTournamentId(row.get("tournament_id")!=null?Long.parseLong(row.get("tournament_id").toString()):-1);
					bean.setCategoryId(row.get("category_id")!=null?Long.parseLong(row.get("category_id").toString()):-1);
					bean.setRank(row.get("custom_aita")!=null?Long.parseLong(row.get("custom_aita").toString()):-1);
					bean.setBooleanVal(true);
					drwasList.add(bean);
				}
			}
	        }catch(Exception e){
	        	e.printStackTrace();
	        	return drwasList;
	        }
		return drwasList;
	}*/

	private synchronized String saveDrawsDetail(List<DrwasFirstAndSecondSets> listData, int tournamentId, int categoryId) {
		String result="Draws created successfully";
		jdbcTemplate.update("DELETE FROM matchs WHERE tournament_id=? AND category_id=?", new Object[]{tournamentId,categoryId});
		
		String status=null;
		for (int round = 0; round < listData.size(); round++) {
			if (round < listData.size() - 1) {
				List<DrwasMatch> drwasMatchFirstSet = listData.get(round).getFirstSet();
				List<DrwasMatch> drwasMatchSecondSet = listData.get(round).getSecondSet();
                
				for (int firstset = 0; firstset < drwasMatchFirstSet.size(); firstset++) {
					List<DrawsPlayer> playerList = drwasMatchFirstSet.get(firstset).getMatch();
					if(round == 0)
					status = playerList.get(0).getMatchType();
					if(status == null || status.length() == 0)
						status = playerList.get(1).getMatchType();
					
					try{
						if(playerList.get(1).isByMatch()){
							jdbcTemplate.update("INSERT INTO `matchs` (tournament_id,category_id,match_type,match_round,match_status,match_player1,match_player2,"
									+ "match_player3,match_player4,team1,team2,match_winner1,score) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)", new Object[]{tournamentId,categoryId,status,round+1,"COMPLETED",
											playerList.get(0).getPlayerId(),playerList.get(0).getPlayerId2(),playerList.get(1).getPlayerId(),playerList.get(1).getPlayerId2(),
											playerList.get(0).getTeam(),playerList.get(1).getTeam(),playerList.get(0).getTeam(),"0-0,0-0,0-0"});
							
						}else if(playerList.get(0).isByMatch()){
							jdbcTemplate.update("INSERT INTO `matchs` (tournament_id,category_id,match_type,match_round,match_status,match_player1,match_player2,"
									+ "match_player3,match_player4,team1,team2,match_winner1,score) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)", new Object[]{tournamentId,categoryId,status,round+1,"COMPLETED",
											playerList.get(0).getPlayerId(),playerList.get(0).getPlayerId2(),playerList.get(1).getPlayerId(),playerList.get(1).getPlayerId2(),
											playerList.get(0).getTeam(),playerList.get(1).getTeam(),playerList.get(1).getTeam(),"0-0,0-0,0-0"});
						}
						else{
						jdbcTemplate.update("INSERT INTO `matchs` (tournament_id,category_id,match_type,match_round,match_status,match_player1,match_player2,"
								+ "match_player3,match_player4,team1,team2) VALUES(?,?,?,?,?,?,?,?,?,?,?)", new Object[]{tournamentId,categoryId,status,round+1,"YET-TO-PLAY",
										playerList.get(0).getPlayerId(),playerList.get(0).getPlayerId2(),playerList.get(1).getPlayerId(),playerList.get(1).getPlayerId2(),
										playerList.get(0).getTeam(),playerList.get(1).getTeam()});
						}
					}catch(Exception e){
						e.printStackTrace();
						result ="Failure";
					}
				}
				for (int secondset = 0; secondset < drwasMatchSecondSet.size(); secondset++) {
					List<DrawsPlayer> playerList = drwasMatchSecondSet.get(secondset).getMatch();
					try{
						if(playerList.get(1).isByMatch()){
							jdbcTemplate.update("INSERT INTO `matchs` (tournament_id,category_id,match_type,match_round,match_status,match_player1,match_player2,"
									+ "match_player3,match_player4,team1,team2,match_winner1,score) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)", new Object[]{tournamentId,categoryId,status,round+1,"COMPLETED",
											playerList.get(0).getPlayerId(),playerList.get(0).getPlayerId2(),playerList.get(1).getPlayerId(),playerList.get(1).getPlayerId2(),
											playerList.get(0).getTeam(),playerList.get(1).getTeam(),playerList.get(0).getTeam(),"0-0,0-0,0-0"});
							
						}else if(playerList.get(0).isByMatch()){
							jdbcTemplate.update("INSERT INTO `matchs` (tournament_id,category_id,match_type,match_round,match_status,match_player1,match_player2,"
									+ "match_player3,match_player4,team1,team2,match_winner1,score) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)", new Object[]{tournamentId,categoryId,status,round+1,"COMPLETED",
											playerList.get(0).getPlayerId(),playerList.get(0).getPlayerId2(),playerList.get(1).getPlayerId(),playerList.get(1).getPlayerId2(),
											playerList.get(0).getTeam(),playerList.get(1).getTeam(),playerList.get(1).getTeam(),"0-0,0-0,0-0"});
						}
						else{
						jdbcTemplate.update("INSERT INTO `matchs` (tournament_id,category_id,match_type,match_round,match_status,match_player1,match_player2,"
								+ "match_player3,match_player4,team1,team2) VALUES(?,?,?,?,?,?,?,?,?,?,?)", new Object[]{tournamentId,categoryId,status,round+1,"YET-TO-PLAY",
										playerList.get(0).getPlayerId(),playerList.get(0).getPlayerId2(),playerList.get(1).getPlayerId(),playerList.get(1).getPlayerId2(),
										playerList.get(0).getTeam(),playerList.get(1).getTeam()});
						}
					}catch(Exception e){
						e.printStackTrace();
						result ="Failure";
					}
				}

			}else{
				//List<DrwasMatch> drwasMatchFirstSet = listData.get(round).getFirstSet();
				//List<DrwasMatch> drwasMatchSecondSet = listData.get(round).getSecondSet();
				try{
					jdbcTemplate.update("INSERT INTO `matchs` (tournament_id,category_id,match_type,match_round,match_status) VALUES(?,?,?,?,?)", new Object[]{tournamentId,categoryId,status,round+1,"YET-TO-PLAY"});
				
				}catch(Exception e){
					e.printStackTrace();
					result ="Failure";
				}
			}
		}
		return result;
		
	}
	
	@Override
	public List<MyTournaments> getMyTournaments(int orgId) {
		List<MyTournaments> listData = new ArrayList<MyTournaments>();
		String QUERY = "SELECT t.`tournament_id`,t.`tournament_title`,t.orgaizer_id,t.`banner_image`,DATE_FORMAT(t.`tournament_date`, '%d-%M-%Y') AS tournament_date,"
				+ "m.`refefree_name`,ms.`category_name`,DATE_FORMAT(c.`start_date`, '%d-%M-%Y') AS startDate,DATE_FORMAT(c.`end_date`, '%d-%M-%Y') "
				+ "AS endDate,c.`category_id`,c.`prize_money`,c.`tournament_fee`,v.`venue_name`,v.`venue_location` FROM `tournament` t INNER JOIN `refefree_master` m "
				+ "ON t.`tournament_id` = m.`tournament_id` INNER JOIN `tournament_category` c ON t.`tournament_id` = c.`tournament_id` "
				+ "INNER JOIN `category_master` ms ON c.`category_id` = ms.`category_id` INNER JOIN venues v ON v.`venue_id`= t.`tournament_venue_id` WHERE  t.`orgaizer_id`="+orgId+"";
		try{
			List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY);
			if(rows != null && rows.size()>0) {
				for(Map row : rows){
					MyTournaments bean = new MyTournaments();
					bean.setTournamentId(row.get("tournament_id")!=null?Long.parseLong(row.get("tournament_id").toString()):-1);
					bean.setCategoryId(row.get("category_id")!=null?Long.parseLong(row.get("category_id").toString()):-1);
					bean.setTitle(row.get("tournament_title")!=null?row.get("tournament_title").toString():"");
					bean.setEndDate(row.get("endDate")!=null?row.get("endDate").toString():"");
					bean.setOrgId((long)orgId);
					bean.setPrizeMoney(row.get("prize_money")!=null?Long.parseLong(row.get("prize_money").toString()):0);
					bean.setReferee(row.get("refefree_name")!=null?row.get("refefree_name").toString():"");
					bean.setStartDate(row.get("startDate")!=null?row.get("startDate").toString():"");
					bean.setTournamentDate(row.get("tournament_date")!=null?row.get("tournament_date").toString():"");
					bean.setTournamentFee(row.get("tournament_fee")!=null?Long.parseLong(row.get("tournament_fee").toString()):0);
					bean.setCategoryName(row.get("category_name")!=null?row.get("category_name").toString():"");
					bean.setBannerImage(row.get("banner_image")!=null?row.get("banner_image").toString():"");
					bean.setVenueName(row.get("venue_name")!=null?row.get("venue_name").toString():"");
					bean.setLocation(row.get("venue_location")!=null?row.get("venue_location").toString():"");
					bean.setPlayerBean(getPlayers(row.get("tournament_id")!=null?Long.parseLong(row.get("tournament_id").toString()):-1,row.get("category_id")!=null?Long.parseLong(row.get("category_id").toString()):-1));
					listData.add(bean);
				}
			}
	        }catch(Exception e){
	        	e.printStackTrace();
	        	return listData;
	        }
		return listData;
	}

	private List<PlayersBean> getPlayers(long tournamentId, long categoryId) {
		List<PlayersBean> playerList = new ArrayList<PlayersBean>();
		/*String QUERY = "SELECT DISTINCT p.`player_name`,p.player_id,p.`player_phone`,p.`player_email`,p.`player_id`,t.`custom_aita`,p.`player_itarank` FROM `player_tournament` t INNER JOIN `players` p ON t.`player_id1` = p.`player_id` "
				+ "WHERE t.`category_id`="+categoryId+" AND t.`tournament_id`="+tournamentId+" ORDER BY t.`custom_aita` ASC";*/
		String QUERY = "SELECT t.`player_id1`,t.`player_id2`,t.`custom_aita`,t.registered_by,t.payment_id,"
				+ "(SELECT TIMESTAMPDIFF(YEAR,p.player_dob, NOW()) FROM `players` p WHERE p.player_id = t.`player_id1`) AS age1,"
				+ "(SELECT TIMESTAMPDIFF(YEAR,p.player_dob, NOW()) FROM `players` p WHERE p.player_id = t.`player_id2`) AS age2,"
				+ " (SELECT p.player_name FROM `players` p WHERE p.player_id = t.`player_id1`) AS player1,"
				+ "(SELECT p.player_name FROM `players` p WHERE p.player_id = t.`player_id2`) AS player2,"
				+ " (SELECT p.player_email FROM `players` p WHERE p.player_id = t.`player_id1`) AS playerEmail1,"
				+ "(SELECT p.player_email FROM `players` p WHERE p.player_id = t.`player_id2`) AS playerEmail2,"
				+ " (SELECT p.player_phone FROM `players` p WHERE p.player_id = t.`player_id1`) AS playerPhone1,"
				+ "(SELECT p.player_phone FROM `players` p WHERE p.player_id = t.`player_id2`) AS playerPhone2,"
				+ "(SELECT p.player_itaid FROM `players` p WHERE p.player_id = t.`player_id1`) AS player_itaid,"
				+ "(SELECT p.player_itarank FROM `players` p WHERE p.player_id = t.`player_id1`) AS player_itarank "
				+ "FROM `player_tournament` t WHERE t.`category_id`="+categoryId+" AND t.`tournament_id`="+tournamentId+" ORDER BY t.`custom_aita` ASC";
		try{
			List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY);
			if(rows != null && rows.size()>0) {
				for(Map row : rows){
					PlayersBean bean = new PlayersBean();
					if((row.get("player_id2")!=null?Long.parseLong(row.get("player_id2").toString()):-1) >=0){
						bean.setPlayerId(row.get("player_id1")!=null?Long.parseLong(row.get("player_id1").toString()):-1);
						bean.setPlayerId2(row.get("player_id2")!=null?Long.parseLong(row.get("player_id2").toString()):-1);
						bean.setName((row.get("player1")!=null?row.get("player1").toString():"")+" & "+(row.get("player2")!=null?row.get("player2").toString():""));
						bean.setPlayerAge((row.get("age1")!=null?row.get("age1").toString():"")+" & "+(row.get("age2")!=null?row.get("age2").toString():""));
						bean.setPhone(row.get("playerPhone1")!=null?row.get("playerPhone1").toString():"");
						bean.setEmail(row.get("playerEmail1")!=null?row.get("playerEmail1").toString():"");
						bean.setItaRank(row.get("custom_aita")!=null?Long.parseLong(row.get("custom_aita").toString()):0);
						bean.setItaId(row.get("player_itaid")!=null?Long.parseLong(row.get("player_itaid").toString()):0);
						bean.setPoints(row.get("player_itarank")!=null?Long.parseLong(row.get("player_itarank").toString()):0);
						bean.setRegisteredBy(row.get("registered_by")!=null?Long.parseLong(row.get("registered_by").toString()):0);
						bean.setPaymentId(row.get("payment_id")!=null?Long.parseLong(row.get("payment_id").toString()):0);
						playerList.add(bean);
					}else{
					bean.setPlayerId(row.get("player_id1")!=null?Long.parseLong(row.get("player_id1").toString()):-1);
					bean.setPlayerAge(row.get("age1")!=null?row.get("age1").toString():"");
					bean.setName(row.get("player1")!=null?row.get("player1").toString():"");
					bean.setPhone(row.get("playerPhone1")!=null?row.get("playerPhone1").toString():"");
					bean.setEmail(row.get("playerEmail1")!=null?row.get("playerEmail1").toString():"");
					bean.setItaRank(row.get("custom_aita")!=null?Long.parseLong(row.get("custom_aita").toString()):0);
					bean.setItaId(row.get("player_itaid")!=null?Long.parseLong(row.get("player_itaid").toString()):0);
					bean.setPoints(row.get("player_itarank")!=null?Long.parseLong(row.get("player_itarank").toString()):0);
					bean.setRegisteredBy(row.get("registered_by")!=null?Long.parseLong(row.get("registered_by").toString()):0);
					bean.setPaymentId(row.get("payment_id")!=null?Long.parseLong(row.get("payment_id").toString()):0);
					playerList.add(bean);
				  }
				}
			}
	        }catch(Exception e){
	        	e.printStackTrace();
	        	return playerList;
	        }
		return playerList;
	}

	@Override
	public String addPlayerByOrganizer(PlayersBean playersBean) {
		log.info("TournamentDaoImpl :: addPlayerByOrganizer method");
		log.info("playersBean ::"+playersBean);
		String QUERY="INSERT INTO `players` (player_name,player_add,player_lavel,"
				+ "player_phone,player_email,player_itaid,player_itarank,player_pwd,player_repwd,gender,player_dob) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
		
		String QUERY2 = "INSERT INTO `playerranks` (player_id,player_points,player_ranks) VALUES(LAST_INSERT_ID(),?,?)";
		String result=null;
		try{
			int size = jdbcTemplate.queryForObject("SELECT COUNT(player_phone) FROM players WHERE `player_phone`='"+playersBean.getPhone()+"'",Integer.class);
    		if(size <= 0){
			int val = jdbcTemplate.update(QUERY, new Object[]{playersBean.getName(),playersBean.getAddress(),playersBean.getLavel()
    				,playersBean.getPhone(),playersBean.getEmail(),playersBean.getItaId(),playersBean.getItaRank(),"tennis","tennis",playersBean.getGender(),playersBean.getDateOfBirth()});
			jdbcTemplate.update(QUERY2, new Object[]{playersBean.getPoints(),playersBean.getRank()});
    		if(val >0)
    			result = "Player Registered Successfully";
    			//result = registerPlayerForTournamentByOrganizer(playersBean,categoryId,tournamentId,amount,secPlayerId);
    		else
    			result = "fail";
    		}else{
    			result = "Player Already Registered";
    		}
    			
    	}catch(Exception e){
    		result="All Fields Are Mandatory";
    		e.printStackTrace();
    		log.error("Exception In PlayersDaoImpl addPlayer() :: "+e);
    	}
		return result;
	}

	private String registerPlayerForTournamentByOrganizer(PlayersBean playersBean, int categoryId, int tournamentId,int amount,int secPlayerId) {
		int playerId = jdbcTemplate.queryForObject("SELECT `player_id` FROM `players` ORDER BY `player_id` DESC LIMIT 1", Integer.class);
		int val1,val2 = 0,paymentId = -1;String result=null;
		if(playerId >= 0){
			String QUERY = "INSERT INTO `payment` (category_id,tournament_id,transaction_status,amount,card_or_cash) VALUES(?,?,?,?,?)";
			try{
				val1 = jdbcTemplate.update(QUERY, new Object[]{categoryId,tournamentId,"SUCCESS",amount,"CASH"});
				paymentId = jdbcTemplate.queryForObject("SELECT payment_id FROM `payment` ORDER BY payment_id DESC LIMIT 1", Integer.class);
				if(paymentId >= 0)
				val2 = jdbcTemplate.update("INSERT INTO `player_tournament` (player_id1,player_id2,tournament_id,category_id,custom_aita,payment_id) VALUES(?,?,?,?,?,?)", new Object[]{playerId,secPlayerId,tournamentId,categoryId,playersBean.getItaRank(),paymentId});
				if(val1 >0 && val2 >0)
	    			result = "Player Registered Successfully";
	    		else
	    			result = "Something Wnr Wrong Try again";
			
			}catch(Exception e){
	    		e.printStackTrace();
	    		log.error("Exception In TournamentDaoImpl addPaymentForTournamentCategory() :: "+e);
	    	}
			
		}
		return result;
	}

	@Override
	public List<PlayersBean> getPlayerListForEachTournament(int tournamentId, int categoryId) {
		// TODO Auto-generated method stub
		List<PlayersBean> playerList = getPlayers(tournamentId,categoryId);
		return playerList;
	}

	@Override
	public List<TournamentList> getOrganizerTournament(int orgId) {
		String currentDate =new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		
		List<TournamentList> listData = new ArrayList<TournamentList>();
		String QUERY = "SELECT t.`tournament_id`,t.`tournament_title`,t.orgaizer_id,"
				+ "DATE_FORMAT(t.tournament_statrdate,'%Y-%m-%d') AS tStart,DATE_FORMAT(t.tournament_enddate,'%Y-%m-%d') AS tEnd,DATE_FORMAT(t.reg_start_date,'%Y-%m-%d') AS rStart,DATE_FORMAT(t.reg_end_date,'%Y-%m-%d') AS rEnd,(SELECT v.venue_name FROM `venues` v WHERE v.venue_id = t.`tournament_venue_id`) AS venueName,"
				+ "(SELECT v.venue_location FROM `venues` v WHERE v.venue_id = t.`tournament_venue_id`) AS venue_location,"
				+ "DATE_FORMAT(t.`tournament_statrdate`, '%d-%b-%Y') AS tournament_statrdate,DATE_FORMAT(t.`tournament_enddate`, '%d-%b-%Y') AS tournament_enddate,"
				+ "t.`organizer_name`,t.`organizer_phone`,t.`organizer_altphone`,t.`organizer_mailId`,t.`banner_image`,m.`refefree_name`,"
				+ "DATE_FORMAT(t.`reg_start_date`, '%d-%b-%Y') AS reg_start_date,DATE_FORMAT(t.`reg_end_date`, '%d-%b-%Y') AS reg_end_date,"
				+ "IF('"+currentDate+"' BETWEEN t.`reg_start_date` AND t.`reg_end_date`,'true','false') AS boleanVal,"
				+ "IF(CURDATE() <= t.`tournament_enddate`,'pactive','inactive') AS activestatus "
				+ " FROM `tournament` t INNER JOIN `refefree_master` m ON t.`tournament_id`=m.`tournament_id` AND t.`orgaizer_id`="+orgId+" AND t.`active`=1";
		//System.out.println(QUERY);
		try{
			List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY);
			if(rows != null && rows.size()>0) {
				for(Map row : rows){
					TournamentList bean = new TournamentList();
					List<TournamentCategoryBean> categoryList = getTournamentCategoryList(row.get("tournament_id")!=null?Integer.parseInt(row.get("tournament_id").toString()):0);
					bean.setTournamentId(row.get("tournament_id")!=null?Integer.parseInt(row.get("tournament_id").toString()):0);
					bean.setTitle(row.get("tournament_title")!=null?row.get("tournament_title").toString():"");
					bean.setActive(row.get("activestatus")!=null?row.get("activestatus").toString():"");
					bean.setOrgaizerId(row.get("orgaizer_id")!=null?Integer.parseInt(row.get("orgaizer_id").toString()):0);
					bean.setVenueName(row.get("venueName")!=null?row.get("venueName").toString():"");
					bean.setLocation(row.get("venue_location")!=null?row.get("venue_location").toString():"");
					bean.setDate(row.get("tournament_statrdate")!=null?row.get("tournament_statrdate").toString():"");
					bean.setOrganizerName(row.get("organizer_name")!=null?row.get("organizer_name").toString():"");
					bean.setPhone(row.get("organizer_phone")!=null?row.get("organizer_phone").toString():"");
					bean.setAltPhone(row.get("organizer_altphone")!=null?row.get("organizer_altphone").toString():"");
					bean.setEmail(row.get("organizer_mailId")!=null?row.get("organizer_mailId").toString():"");
					bean.setBannerImage(row.get("banner_image")!=null?row.get("banner_image").toString():"");
					bean.setRefereeName(row.get("refefree_name")!=null?row.get("refefree_name").toString():"");
					bean.setTournamentStartDate(row.get("tournament_statrdate")!=null?row.get("tournament_statrdate").toString():"");
					bean.setTournamentEndDate(row.get("tournament_enddate")!=null?row.get("tournament_enddate").toString():"");
					bean.setRegStartDate(row.get("reg_start_date")!=null?row.get("reg_start_date").toString():"");
					bean.setRegEndDate(row.get("reg_end_date")!=null?row.get("reg_end_date").toString():"");
					bean.setConditionVal(row.get("boleanVal")!=null?Boolean.parseBoolean(row.get("boleanVal").toString()):false);
					bean.setActive(row.get("activestatus")!=null?row.get("activestatus").toString():"");
					bean.settStartDate(row.get("tStart")!=null?row.get("tStart").toString():"");
					bean.settEndDate(row.get("tEnd")!=null?row.get("tEnd").toString():"");
					bean.setrStartDate(row.get("rStart")!=null?row.get("rStart").toString():"");
					bean.setrEndDate(row.get("rEnd")!=null?row.get("rEnd").toString():"");
					bean.setCategoryList(categoryList);
					listData.add(bean);
				}
			}
	        }catch(Exception e){
	        	e.printStackTrace();
	        	return listData;
	        }
		return listData;
	}

	private List<TournamentCategoryBean> getTournamentCategoryList(int tournamentid) {
		List<TournamentCategoryBean> listData =  new ArrayList<TournamentCategoryBean>();
		String QUERY = "SELECT c.`category_id`,(SELECT i.`category_name` FROM `category_master` i WHERE i.`category_id` = c.`category_id`) AS categoryName,"
				+ "(SELECT i.`category_desc` FROM `category_master` i WHERE i.`category_id` = c.`category_id`) AS singleordouble,"
							+ "c.`prize_money`,c.`tournament_fee`,CASE WHEN c.`isDrawsActive`= 1 THEN 'true' ELSE 'false' END AS actbol"
							+ " FROM `tournament_category` c WHERE c.`tournament_id` ="+tournamentid+"";
		try{
			List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY);
			if(rows != null && rows.size()>0) {
				for(Map row : rows){
					TournamentCategoryBean bean = new TournamentCategoryBean();
					bean.setIsDrawsActive(row.get("actbol")!=null?Boolean.parseBoolean(row.get("actbol").toString()):false);
					int val1= jdbcTemplate.queryForObject("SELECT COUNT(`match_date`) AS matchdate FROM `matchs` WHERE `tournament_id`="+tournamentid+" AND `category_id` = "+(row.get("category_id")!=null?Integer.parseInt(row.get("category_id").toString()):-1)+" AND `match_date` IS NOT NULL", Integer.class);
					if(val1 > 0)
						bean.setScheduleCreated(true);
					int val2= jdbcTemplate.queryForObject("SELECT COUNT(`match_id`) AS matchid FROM `matchs` WHERE `tournament_id`="+tournamentid+" AND `category_id` = "+(row.get("category_id")!=null?Integer.parseInt(row.get("category_id").toString()):-1)+"", Integer.class);
					if(val2 > 0)
						bean.setDrawsCreated(true);
					bean.setMatchType(row.get("singleordouble")!=null?Long.parseLong(row.get("singleordouble").toString()):-1);
					bean.setCategoryName(row.get("categoryName")!=null?row.get("categoryName").toString():"");
					bean.setCategoryId(row.get("category_id")!=null?Integer.parseInt(row.get("category_id").toString()):-1);
					bean.setPrizeMoney(row.get("prize_money")!=null?Integer.parseInt(row.get("prize_money").toString()):0);
					bean.setTournamentFee(row.get("tournament_fee")!=null?Integer.parseInt(row.get("tournament_fee").toString()):0);
					bean.setPlayerList(getPlayers(tournamentid,row.get("category_id")!=null?Integer.parseInt(row.get("category_id").toString()):-1));
					listData.add(bean);
				}
			}
	        }catch(Exception e){
	        	e.printStackTrace();
	        	return listData;
	        }
		return listData;
	}

	@Override
	public List<TournamentList> upcommingTournament(int playerId, String currentDate) {
		int playerage=0,gender=-1;
          try{
        	  List<Map<String, Object>> rows = jdbcTemplate.queryForList("SELECT TIMESTAMPDIFF(YEAR,player_dob, NOW()) AS age, gender FROM players WHERE `player_id`="+playerId+"");
  			if(rows != null && rows.size()>0) {
  				for(Map row : rows){
  					playerage = row.get("age")!=null?Integer.parseInt(row.get("age").toString()):-1;
  					gender = row.get("gender")!=null?Integer.parseInt(row.get("gender").toString()):-1;
  				}
  			}
          }catch(Exception e){
        	  e.printStackTrace();
          }		
		List<TournamentList> listData = new ArrayList<TournamentList>();
		String QUERY = "SELECT t.`tournament_id`,t.`tournament_title`,t.orgaizer_id,(SELECT v.venue_name FROM `venues` v WHERE v.venue_id = t.`tournament_venue_id`) AS venueName,"
				+ "(SELECT v.venue_location FROM `venues` v WHERE v.venue_id = t.`tournament_venue_id`) AS venue_location,"
				+ "DATE_FORMAT(t.`tournament_statrdate`, '%d-%b-%Y') AS tournament_statrdate,DATE_FORMAT(t.`tournament_enddate`, '%d-%b-%Y') AS tournament_enddate,"
				+ "t.`organizer_name`,t.`organizer_phone`,t.`organizer_altphone`,t.`organizer_mailId`,t.`banner_image`,m.`refefree_name`,"
				+ "DATE_FORMAT(t.`reg_start_date`, '%d-%b-%Y') AS reg_start_date,DATE_FORMAT(t.`reg_end_date`, '%d-%b-%Y') AS reg_end_date,"
				+ "IF('"+currentDate+"' BETWEEN t.`reg_start_date` AND t.`reg_end_date`,'true','false') AS boleanVal,"
				+ "IF(CURDATE() <= t.`tournament_enddate`,'pactive','inactive') AS activestatus,IF(CURDATE() < t.`tournament_statrdate`,'true','false') AS live"
				+ " FROM `tournament` t INNER JOIN `refefree_master` m ON t.`tournament_id`=m.`tournament_id` AND t.`tournament_enddate` >= '"+currentDate+"' AND t.`active`=1";
		System.out.println(QUERY);
		try{
			List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY);
			if(rows != null && rows.size()>0) {
				for(Map row : rows){
					List<TournamentCategoryBean> categoryList = getTournamentCategoryList(playerId,row.get("tournament_id")!=null?Integer.parseInt(row.get("tournament_id").toString()):0,currentDate,playerage,gender);
					if(categoryList.size() > 0){
					TournamentList bean = new TournamentList();
					bean.setCategoryList(categoryList);
					bean.setTournamentId(row.get("tournament_id")!=null?Integer.parseInt(row.get("tournament_id").toString()):0);
					bean.setTitle(row.get("tournament_title")!=null?row.get("tournament_title").toString():"");
					bean.setActive(row.get("activestatus")!=null?row.get("activestatus").toString():"");
					bean.setOrgaizerId(row.get("orgaizer_id")!=null?Integer.parseInt(row.get("orgaizer_id").toString()):0);
					bean.setVenueName(row.get("venueName")!=null?row.get("venueName").toString():"");
					bean.setLocation(row.get("venue_location")!=null?row.get("venue_location").toString():"");
					bean.setDate(row.get("tournament_statrdate")!=null?row.get("tournament_statrdate").toString():"");
					bean.setOrganizerName(row.get("organizer_name")!=null?row.get("organizer_name").toString():"");
					bean.setPhone(row.get("organizer_phone")!=null?row.get("organizer_phone").toString():"");
					bean.setAltPhone(row.get("organizer_altphone")!=null?row.get("organizer_altphone").toString():"");
					bean.setEmail(row.get("organizer_mailId")!=null?row.get("organizer_mailId").toString():"");
					bean.setBannerImage(row.get("banner_image")!=null?row.get("banner_image").toString():"");
					bean.setRefereeName(row.get("refefree_name")!=null?row.get("refefree_name").toString():"");
					bean.setTournamentStartDate(row.get("tournament_statrdate")!=null?row.get("tournament_statrdate").toString():"");
					bean.setTournamentEndDate(row.get("tournament_enddate")!=null?row.get("tournament_enddate").toString():"");
					bean.setRegStartDate(row.get("reg_start_date")!=null?row.get("reg_start_date").toString():"");
					bean.setRegEndDate(row.get("reg_end_date")!=null?row.get("reg_end_date").toString():"");
					bean.setConditionVal(row.get("boleanVal")!=null?Boolean.parseBoolean(row.get("boleanVal").toString()):false);
					bean.setLive(row.get("live")!=null?Boolean.parseBoolean(row.get("live").toString()):false);
					listData.add(bean);
					}
				}
			}
	        }catch(Exception e){
	        	e.printStackTrace();
	        	return listData;
	        }
		return listData;
	}

	public List<TournamentCategoryBean> getTournamentCategoryList(int playerId,int tournamentId, String currentDate, int playerage, int gender) {
		List<TournamentCategoryBean> listData =  new ArrayList<TournamentCategoryBean>();
		String QUERY = "SELECT c.`category_id`,(SELECT i.`category_name` FROM `category_master` i WHERE i.`category_id` = c.`category_id`) AS categoryName,"
				+ "(SELECT i.`category_age` FROM `category_master` i WHERE i.`category_id` = c.`category_id`) AS categoryAge,"
				+ "(SELECT i.`category_gender` FROM `category_master` i WHERE i.`category_id` = c.`category_id`) AS categoryGender,"
				+ "(SELECT i.`category_desc` FROM `category_master` i WHERE i.`category_id` = c.`category_id`) AS singleordouble,"
				+ "c.`prize_money`,c.`tournament_fee`,c.isDrawsActive,CASE WHEN c.`isDrawsActive`= 1 THEN 'true' ELSE 'false' END AS actbol,"
				+ "COALESCE((SELECT DISTINCT t.player_id1 FROM `player_tournament` t WHERE t.tournament_id = "+tournamentId+" AND t.category_id=c.`category_id` AND t.player_id1 = "+playerId+"),-1) AS playerId1,"
				+ "COALESCE((SELECT DISTINCT t.player_id2 FROM `player_tournament` t WHERE t.tournament_id = "+tournamentId+" AND t.category_id=c.`category_id` AND t.player_id2 = "+playerId+"),-1) AS playerId2"
				+ " FROM `tournament_category` c WHERE c.`tournament_id` = "+tournamentId+"";
		try{
			List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY);
			if(rows != null && rows.size()>0) {
				for(Map row : rows){
					TournamentCategoryBean bean = new TournamentCategoryBean();
					bean.setIsDrawsActive(row.get("actbol")!=null?Boolean.parseBoolean(row.get("actbol").toString()):false);
					int val1= jdbcTemplate.queryForObject("SELECT COUNT(`match_date`) AS matchdate FROM `matchs` WHERE `tournament_id`="+tournamentId+" AND `category_id` = "+(row.get("category_id")!=null?Integer.parseInt(row.get("category_id").toString()):-1)+" AND `match_date` IS NOT NULL", Integer.class);
					if(val1 > 0)
						bean.setScheduleCreated(true);
					int val2= jdbcTemplate.queryForObject("SELECT COUNT(`match_id`) AS matchid FROM `matchs` WHERE `tournament_id`="+tournamentId+" AND `category_id` = "+(row.get("category_id")!=null?Integer.parseInt(row.get("category_id").toString()):-1)+"", Integer.class);
					if(val2 > 0)
						bean.setDrawsCreated(true);
					int categoryAge = row.get("categoryAge")!=null?Integer.parseInt(row.get("categoryAge").toString()):-2;
					int categoryGender = row.get("categoryGender")!=null?Integer.parseInt(row.get("categoryGender").toString()):-2;
					int player = row.get("playerId1")!=null?Integer.parseInt(row.get("playerId1").toString()):-1;
					if(playerId <= -1){
					bean.setCategoryName(row.get("categoryName")!=null?row.get("categoryName").toString():"");
					bean.setCategoryId(row.get("category_id")!=null?Integer.parseInt(row.get("category_id").toString()):-1);
					bean.setMatchType(row.get("singleordouble")!=null?Long.parseLong(row.get("singleordouble").toString()):-1);
					bean.setPrizeMoney(row.get("prize_money")!=null?Integer.parseInt(row.get("prize_money").toString()):0);
					bean.setTournamentFee(row.get("tournament_fee")!=null?Integer.parseInt(row.get("tournament_fee").toString()):0);
					if(player >= 0)
					bean.setPlayerId(player);
					else
						bean.setPlayerId(row.get("playerId2")!=null?Integer.parseInt(row.get("playerId2").toString()):-1);
					bean.setPlayerList(getPlayers(tournamentId,row.get("category_id")!=null?Integer.parseInt(row.get("category_id").toString()):-1));
					listData.add(bean);
					}else{
						if(categoryGender == gender)
							bean.setCategoryGender(true);
						if((playerage <= categoryAge) || (categoryAge >= 17))
							bean.setCatAge(true);
						bean.setCategoryName(row.get("categoryName")!=null?row.get("categoryName").toString():"");
						bean.setCategoryId(row.get("category_id")!=null?Integer.parseInt(row.get("category_id").toString()):-1);
						bean.setMatchType(row.get("singleordouble")!=null?Long.parseLong(row.get("singleordouble").toString()):-1);
						bean.setPrizeMoney(row.get("prize_money")!=null?Integer.parseInt(row.get("prize_money").toString()):0);
						bean.setTournamentFee(row.get("tournament_fee")!=null?Integer.parseInt(row.get("tournament_fee").toString()):0);
						if(player >= 0)
						bean.setPlayerId(player);
						else
							bean.setPlayerId(row.get("playerId2")!=null?Integer.parseInt(row.get("playerId2").toString()):-1);
						bean.setPlayerList(getPlayers(tournamentId,row.get("category_id")!=null?Integer.parseInt(row.get("category_id").toString()):-1));
						listData.add(bean);
					}
					/*else if(categoryGender == gender){
						if(playerage <= categoryAge){
							bean.setCategoryName(row.get("categoryName")!=null?row.get("categoryName").toString():"");
							bean.setCategoryId(row.get("category_id")!=null?Integer.parseInt(row.get("category_id").toString()):-1);
							bean.setMatchType(row.get("singleordouble")!=null?Long.parseLong(row.get("singleordouble").toString()):-1);
							bean.setPrizeMoney(row.get("prize_money")!=null?Integer.parseInt(row.get("prize_money").toString()):0);
							bean.setTournamentFee(row.get("tournament_fee")!=null?Integer.parseInt(row.get("tournament_fee").toString()):0);
							if(player >= 0)
							bean.setPlayerId(player);
							else
								bean.setPlayerId(row.get("playerId2")!=null?Integer.parseInt(row.get("playerId2").toString()):-1);
							bean.setPlayerList(getPlayers(tournamentId,row.get("category_id")!=null?Integer.parseInt(row.get("category_id").toString()):-1));
							listData.add(bean);
						}else if(categoryAge >=17){
							bean.setCategoryName(row.get("categoryName")!=null?row.get("categoryName").toString():"");
							bean.setCategoryId(row.get("category_id")!=null?Integer.parseInt(row.get("category_id").toString()):-1);
							bean.setMatchType(row.get("singleordouble")!=null?Long.parseLong(row.get("singleordouble").toString()):-1);
							bean.setPrizeMoney(row.get("prize_money")!=null?Integer.parseInt(row.get("prize_money").toString()):0);
							bean.setTournamentFee(row.get("tournament_fee")!=null?Integer.parseInt(row.get("tournament_fee").toString()):0);
							if(player >= 0)
							bean.setPlayerId(player);
							else
								bean.setPlayerId(row.get("playerId2")!=null?Integer.parseInt(row.get("playerId2").toString()):-1);
							bean.setPlayerList(getPlayers(tournamentId,row.get("category_id")!=null?Integer.parseInt(row.get("category_id").toString()):-1));
							listData.add(bean);
						}else{
							
						}
						
					}*/
				}
			}
	        }catch(Exception e){
	        	e.printStackTrace();
	        	return listData;
	        }
		return listData;
	}

	@Override
	public List<PlayersBean> getExistingPlayerList(int tournamentId, int categoryId) {
		String QUERY = "SELECT DISTINCT p.`player_name`,p.`player_phone`,p.`player_email`,p.`player_id`,p.player_itaid,p.player_itarank, "
				+ "TIMESTAMPDIFF(YEAR,p.player_dob, NOW()) AS age,p.player_dob,p.`gender` FROM `players` p "
				+ "WHERE NOT EXISTS(SELECT 1 FROM `player_tournament` t WHERE (t.player_id1 = p.`player_id` OR t.player_id2 = p.`player_id`)"
				+ " AND t.`tournament_id`="+tournamentId+" AND t.`category_id`="+categoryId+") AND p.`gender` = (SELECT c.category_gender FROM category_master c WHERE c.category_id = "+categoryId+")";
	System.out.println(QUERY);
		List<PlayersBean> listData = new ArrayList<PlayersBean>();
		try{
			int catAge = jdbcTemplate.queryForObject("SELECT c.category_age FROM category_master c WHERE c.category_id = "+categoryId+"", Integer.class);
			List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY);
			if(rows != null && rows.size()>0) {
				for(Map row : rows){
					if((row.get("age")!=null?Integer.parseInt(row.get("age").toString()):0) <=  catAge){
					PlayersBean bean = new PlayersBean();
					bean.setPlayerAge(row.get("age")!=null?row.get("age").toString():"");
					bean.setPlayerId(row.get("player_id")!=null?Long.parseLong(row.get("player_id").toString()):-1);
					bean.setName(row.get("player_name")!=null?row.get("player_name").toString():"");
					bean.setPhone(row.get("player_phone")!=null?row.get("player_phone").toString():"");
					bean.setEmail(row.get("player_email")!=null?row.get("player_email").toString():"");
					bean.setItaId(row.get("player_itaid")!=null?Long.parseLong(row.get("player_itaid").toString()):0);
					bean.setPoints(row.get("player_itarank")!=null?Long.parseLong(row.get("player_itarank").toString()):0);
					bean.setItaRank(row.get("player_itarank")!=null?Long.parseLong(row.get("player_itarank").toString()):0);
					listData.add(bean);
					}
					else if(catAge >=17){
						PlayersBean bean = new PlayersBean();
						bean.setPlayerAge(row.get("age")!=null?row.get("age").toString():"");
						bean.setPlayerId(row.get("player_id")!=null?Long.parseLong(row.get("player_id").toString()):-1);
						bean.setName(row.get("player_name")!=null?row.get("player_name").toString():"");
						bean.setPhone(row.get("player_phone")!=null?row.get("player_phone").toString():"");
						bean.setEmail(row.get("player_email")!=null?row.get("player_email").toString():"");
						bean.setItaId(row.get("player_itaid")!=null?Long.parseLong(row.get("player_itaid").toString()):0);
						bean.setPoints(row.get("player_itarank")!=null?Long.parseLong(row.get("player_itarank").toString()):0);
						bean.setItaRank(row.get("player_itarank")!=null?Long.parseLong(row.get("player_itarank").toString()):0);
						listData.add(bean);
						
					}else{}
					
				}
			}
	        }catch(Exception e){
	        	e.printStackTrace();
	        	return listData;
	        }
		return listData;
	}

	@Override
	public String registerExistingPlayerUrl(int playerId, int tournamentId, int categoryId, int entryFee, int itaRank) {
		int val1,val2=0,paymentId=-1;String result=null;
			String QUERY = "INSERT INTO `payment` (category_id,tournament_id,transaction_status,amount,card_or_cash) VALUES(?,?,?,?,?)";
			try{
				val1 = jdbcTemplate.update(QUERY, new Object[]{categoryId,tournamentId,"SUCCESS",entryFee,"CASH"});
				paymentId = jdbcTemplate.queryForObject("SELECT payment_id FROM `payment` ORDER BY payment_id DESC LIMIT 1", Integer.class);
				if(paymentId >=0)
				val2 = jdbcTemplate.update("INSERT INTO `player_tournament` (player_id1,player_id2,tournament_id,category_id,custom_aita,payment_id,registered_by) VALUES(?,?,?,?,?,?,?)", new Object[]{playerId,-1,tournamentId,categoryId,itaRank,paymentId,1});
				if(val1 >0 && val2 >0)
	    			result = "Success";
	    		else
	    			result = "Something Went Wrong Try again";
			
			}catch(Exception e){
	    		e.printStackTrace();
	    		log.error("Exception In TournamentDaoImpl addPaymentForTournamentCategory() :: "+e);
	    	}
			
		return result;
	}

	@Override
	public EmailTemplateBean retrieveEmailTemplate(String type) {
		EmailTemplateBean emailTemplateBean = null;
		List<Map<String, Object>> rows = this.jdbcTemplate.queryForList("select id,from_email, subject, body from email_templates where type=?", new Object[]{type});
		if(rows != null && rows.size()>0) {
			emailTemplateBean = new EmailTemplateBean();
			for (Map row : rows) {
				emailTemplateBean.setId(Long.parseLong(row.get("id").toString()));
				emailTemplateBean.setFromEmail(row.get("from_email").toString());
				emailTemplateBean.setSubject(row.get("subject").toString());
				emailTemplateBean.setBody(row.get("body").toString());
				emailTemplateBean.setType(type);
				//body=body.replace("{{EMAIL_BASE_URL}}";
			}
		}
		return emailTemplateBean;
	}

	@Override
	public List<RoundListWithMatchs> buildCategoryDrwas(int tournamentId, int categoryId) {
		List<RoundListWithMatchs> beanlist =  new ArrayList<RoundListWithMatchs>();
		String QUERY1  = "SELECT DISTINCT m.`match_round` FROM matchs m WHERE m.`category_id`=? AND m.`tournament_id`=?";
		
		String QUERY2  = "SELECT m.match_id, m.`tournament_id`,m.`category_id`,m.`match_player1`,m.`match_player2`,m.`match_player3`,m.`match_player4`,m.`match_round`,m.match_type,"
				+ "m.`match_status`,m.`match_type`,m.team1,m.team2,m.score,"
				+ "(SELECT pt.custom_aita FROM player_tournament pt WHERE pt.player_id1 = m.`match_player1` AND pt.`category_id`="+categoryId+" AND pt.`tournament_id`="+tournamentId+") AS seeding1,"
				+ "(SELECT pt.custom_aita FROM player_tournament pt WHERE pt.player_id1 = m.`match_player3` AND pt.`category_id`="+categoryId+" AND pt.`tournament_id`="+tournamentId+") AS seeding3,"
				+ "(SELECT p.player_name FROM players p WHERE p.player_id = m.`match_player1`) AS player1,"
				+ "(SELECT p.player_name FROM players p WHERE p.player_id = m.`match_player2`) AS player2,"
				+ "(SELECT p.player_name FROM players p WHERE p.player_id = m.`match_player3`) AS player3,"
				+ "(SELECT p.player_name FROM players p WHERE p.player_id = m.`match_player4`) AS player4, m.`match_winner1`,"
				+ "(SELECT p.player_itaid FROM players p WHERE p.player_id = m.`match_player1`) AS player_itarank1,"
				+ "(SELECT p.player_itaid FROM players p WHERE p.player_id = m.`match_player3`) AS player_itarank2"
				+ " FROM matchs m WHERE m.`category_id`=? AND m.`tournament_id`=? AND m.`match_round`=?";
		//System.out.println(QUERY2);
		List<Map<String, Object>> outerrows = this.jdbcTemplate.queryForList(QUERY1, new Object[]{categoryId,tournamentId});
		System.out.println("Shiva outerrows :: "+outerrows.size());
		if (outerrows != null && outerrows.size() > 0) {
			for (Map outrow : outerrows) {
				RoundListWithMatchs roundListWithMatchs = new RoundListWithMatchs();
				List<DrawsTeam> matchlist = new ArrayList<DrawsTeam>();
				List<Map<String, Object>> rows = this.jdbcTemplate.queryForList(QUERY2,new Object[] { categoryId, tournamentId, outrow.get("match_round") != null? Integer.parseInt(outrow.get("match_round").toString()) : -1 });
				if (rows != null && rows.size() > 0) {
					for (Map row : rows) {
						DrawsTeam bean = new DrawsTeam();
						String winner = row.get("match_winner1")!=null?row.get("match_winner1").toString():"";
						int play1 = -1,play2=-1;
						if(winner !=null && !winner.equals("(NULL)") && winner != ""){
							String[] words = winner.split(",");
							 play1 = Integer.parseInt(words[0]);
							 play2 = Integer.parseInt(words[1]);
							 if((row.get("match_type")!=null?row.get("match_type").toString():"").equals("SINGLE")){
							 bean.setWinner(jdbcTemplate.queryForObject("SELECT p.player_name FROM players p WHERE p.player_id = "+play1+"", String.class));
							 bean.setWinnerId((long)play1);
							 if(bean.getWinnerId() == (row.get("match_player1")!=null?Long.parseLong(row.get("match_player1").toString()):-1)){
								 if(outerrows.size() == 3 && ((row.get("seeding1")!=null?Long.parseLong(row.get("seeding1").toString()):0) <=2))
								    bean.setWinnerSeed(row.get("seeding1")!=null?Long.parseLong(row.get("seeding1").toString()):0);
								 else if(outerrows.size() == 4 && ((row.get("seeding1")!=null?Long.parseLong(row.get("seeding1").toString()):0) <=4))
									 bean.setWinnerSeed(row.get("seeding1")!=null?Long.parseLong(row.get("seeding1").toString()):0);
								 else if(outerrows.size() == 5 && ((row.get("seeding1")!=null?Long.parseLong(row.get("seeding1").toString()):0) <=8))
									 bean.setWinnerSeed(row.get("seeding1")!=null?Long.parseLong(row.get("seeding1").toString()):0);
								 else if(outerrows.size() == 6 && ((row.get("seeding1")!=null?Long.parseLong(row.get("seeding1").toString()):0) <=16))
									 bean.setWinnerSeed(row.get("seeding1")!=null?Long.parseLong(row.get("seeding1").toString()):0);
							 }else{
								 //bean.setWinnerSeed(row.get("seeding3")!=null?Long.parseLong(row.get("seeding3").toString()):0);
								 if(outerrows.size() == 3 && ((row.get("seeding3")!=null?Long.parseLong(row.get("seeding3").toString()):0) <=2))
									    bean.setWinnerSeed(row.get("seeding3")!=null?Long.parseLong(row.get("seeding3").toString()):0);
									 else if(outerrows.size() == 4 && ((row.get("seeding3")!=null?Long.parseLong(row.get("seeding3").toString()):0) <=4))
										 bean.setWinnerSeed(row.get("seeding3")!=null?Long.parseLong(row.get("seeding3").toString()):0);
									 else if(outerrows.size() == 5 && ((row.get("seeding3")!=null?Long.parseLong(row.get("seeding3").toString()):0) <=8))
										 bean.setWinnerSeed(row.get("seeding1")!=null?Long.parseLong(row.get("seeding3").toString()):0);
									 else if(outerrows.size() == 6 && ((row.get("seeding3")!=null?Long.parseLong(row.get("seeding3").toString()):0) <=16))
										 bean.setWinnerSeed(row.get("seeding3")!=null?Long.parseLong(row.get("seeding3").toString()):0);
							 }
							 }
							 else{
							 String first = jdbcTemplate.queryForObject("SELECT p.player_name FROM players p WHERE p.player_id = "+play1+"", String.class);
							 String second = jdbcTemplate.queryForObject("SELECT p.player_name FROM players p WHERE p.player_id = "+play2+"", String.class);
							 bean.setWinner(first+" & "+second);
							 bean.setWinnerId((long)play1);
							 if(bean.getWinnerId() == (row.get("match_player1")!=null?Long.parseLong(row.get("match_player1").toString()):-1)){
								 //bean.setWinnerSeed(row.get("seeding1")!=null?Long.parseLong(row.get("seeding1").toString()):0);
								 if(outerrows.size() == 3 && ((row.get("seeding1")!=null?Long.parseLong(row.get("seeding1").toString()):0) <=2))
									    bean.setWinnerSeed(row.get("seeding1")!=null?Long.parseLong(row.get("seeding1").toString()):0);
									 else if(outerrows.size() == 4 && ((row.get("seeding1")!=null?Long.parseLong(row.get("seeding1").toString()):0) <=4))
										 bean.setWinnerSeed(row.get("seeding1")!=null?Long.parseLong(row.get("seeding1").toString()):0);
									 else if(outerrows.size() == 5 && ((row.get("seeding1")!=null?Long.parseLong(row.get("seeding1").toString()):0) <=8))
										 bean.setWinnerSeed(row.get("seeding1")!=null?Long.parseLong(row.get("seeding1").toString()):0);
									 else if(outerrows.size() == 6 && ((row.get("seeding1")!=null?Long.parseLong(row.get("seeding1").toString()):0) <=16))
										 bean.setWinnerSeed(row.get("seeding1")!=null?Long.parseLong(row.get("seeding1").toString()):0);
							 }else{
								 if(outerrows.size() == 3 && ((row.get("seeding3")!=null?Long.parseLong(row.get("seeding3").toString()):0) <=2))
									    bean.setWinnerSeed(row.get("seeding3")!=null?Long.parseLong(row.get("seeding3").toString()):0);
									 else if(outerrows.size() == 4 && ((row.get("seeding3")!=null?Long.parseLong(row.get("seeding3").toString()):0) <=4))
										 bean.setWinnerSeed(row.get("seeding3")!=null?Long.parseLong(row.get("seeding3").toString()):0);
									 else if(outerrows.size() == 5 && ((row.get("seeding3")!=null?Long.parseLong(row.get("seeding3").toString()):0) <=8))
										 bean.setWinnerSeed(row.get("seeding3")!=null?Long.parseLong(row.get("seeding3").toString()):0);
									 else if(outerrows.size() == 6 && ((row.get("seeding3")!=null?Long.parseLong(row.get("seeding3").toString()):0) <=16))
										 bean.setWinnerSeed(row.get("seeding3")!=null?Long.parseLong(row.get("seeding3").toString()):0);
								// bean.setWinnerSeed(row.get("seeding3")!=null?Long.parseLong(row.get("seeding3").toString()):0);
							 }
							 }
							 
						}
						bean.setMatchId(row.get("match_id")!=null?Long.parseLong(row.get("match_id").toString()):-1);
						long matchround = row.get("match_round")!=null?Long.parseLong(row.get("match_round").toString()):-1;
						String player1 = row.get("player1")!=null?row.get("player1").toString():"";
						String player3 = row.get("player3")!=null?row.get("player3").toString():"";
						String player2 = row.get("player2")!=null?row.get("player2").toString():"";
						String player4 = row.get("player4")!=null?row.get("player4").toString():"";
						int seeding1 = row.get("seeding1")!=null?Integer.parseInt(row.get("seeding1").toString()):0;
						int seeding3 = row.get("seeding3")!=null?Integer.parseInt(row.get("seeding3").toString()):0;
						if((row.get("match_type")!=null?row.get("match_type").toString():"").equals("SINGLE")){
							long aita1 = row.get("player_itarank1")!=null?Long.parseLong(row.get("player_itarank1").toString()):-1;
							long aita2 = row.get("player_itarank2")!=null?Long.parseLong(row.get("player_itarank2").toString()):-1;
							if(!(aita1 == 11111111 || aita1 == -1))
								bean.setAitaRank1(aita1);
							if(!(aita2 == 11111111 || aita2 == -1))
								bean.setAitaRank2(aita2);
							
								if(player1 != ""){
							     bean.setPlayerName1(row.get("player1")!=null?row.get("player1").toString():"");
							     if(outerrows.size() == 3 && seeding1 <=2)
							     bean.setSeeding1(""+seeding1+"");
							     else if(outerrows.size() == 4 && seeding1 <=4)
							    	 bean.setSeeding1(""+seeding1+"");
							     else if(outerrows.size() == 5 && seeding1 <=8)
							    	 bean.setSeeding1(""+seeding1+"");
							     else if(outerrows.size() == 6 && seeding1 <=16)
							    	 bean.setSeeding1(""+seeding1+"");
								}
								else
								 bean.setPlayerName1(row.get("player1")!=null?row.get("player1").toString():"");
								if(player3 != ""){
							     bean.setPlayerName2(row.get("player3")!=null?row.get("player3").toString():"");
							     if(outerrows.size() == 3 && seeding3 <=2)
								     bean.setSeeding2(""+seeding3+"");
								     else if(outerrows.size() == 4 && seeding3 <=4)
								    	 bean.setSeeding2(""+seeding3+"");
								     else if(outerrows.size() == 5 && seeding3 <=8)
								    	 bean.setSeeding2(""+seeding3+"");
								     else if(outerrows.size() == 6 && seeding3 <=16)
								    	 bean.setSeeding2(""+seeding3+"");
							     //bean.setSeeding2(""+seeding3+"");
								}
								else
								 bean.setPlayerName2(row.get("player3")!=null?row.get("player3").toString():"");
						}else{
							long aita1 = row.get("player_itarank1")!=null?Long.parseLong(row.get("player_itarank1").toString()):-1;
							long aita2 = row.get("player_itarank2")!=null?Long.parseLong(row.get("player_itarank2").toString()):-1;
							if(!(aita1 == 11111111 || aita1 == -1))
								bean.setAitaRank1(aita1);
							if(!(aita2 == 11111111 || aita2 == -1))
								bean.setAitaRank2(aita2);
							
								if(player1 != "" && player2 != ""){
								  bean.setPlayerName1((row.get("player1")!=null?row.get("player1").toString():"")+" & "+(row.get("player2")!=null?row.get("player2").toString():""));
								  //bean.setSeeding1(""+seeding1+"");
								if (outerrows.size() == 3 && seeding1 <= 2)
									bean.setSeeding1("" + seeding1 + "");
								else if (outerrows.size() == 4 && seeding1 <= 4)
									bean.setSeeding1("" + seeding1 + "");
								else if (outerrows.size() == 5 && seeding1 <= 8)
									bean.setSeeding1("" + seeding1 + "");
								else if (outerrows.size() == 6 && seeding1 <= 16)
									bean.setSeeding1("" + seeding1 + "");
								}
								else
								  bean.setPlayerName1((row.get("player1")!=null?row.get("player1").toString():"")+" & "+(row.get("player2")!=null?row.get("player2").toString():""));
								if(player3 != "" && player4 != ""){
								  bean.setPlayerName2((row.get("player3")!=null?row.get("player3").toString():"")+" & "+(row.get("player4")!=null?row.get("player4").toString():""));
								  //bean.setSeeding2(""+seeding3+"");
									if (outerrows.size() == 3 && seeding3 <= 2)
										bean.setSeeding2("" + seeding3 + "");
									else if (outerrows.size() == 4 && seeding3 <= 4)
										bean.setSeeding2("" + seeding3 + "");
									else if (outerrows.size() == 5 && seeding3 <= 8)
										bean.setSeeding2("" + seeding3 + "");
									else if (outerrows.size() == 6 && seeding3 <= 16)
										bean.setSeeding2("" + seeding3 + "");
								}
								else
								  bean.setPlayerName2((row.get("player3")!=null?row.get("player3").toString():"")+" & "+(row.get("player4")!=null?row.get("player4").toString():""));
						}
						if(matchround ==1 && player1 == ""){
							bean.setByMatch(true);
							bean.setPlayerName1("BYE");
						}
						if(matchround ==1 && player3 == ""){
							bean.setByMatch(true);
							bean.setPlayerName2("BYE");
						}
						
						bean.setCategoryid(row.get("category_id")!=null?Long.parseLong(row.get("category_id").toString()):-1);
						bean.setTournamentid(row.get("tournament_id")!=null?Long.parseLong(row.get("tournament_id").toString()):-1);
						bean.setMatchtype(row.get("match_type")!=null?row.get("match_type").toString():"");
						bean.setPlayerId1(row.get("match_player1")!=null?Long.parseLong(row.get("match_player1").toString()):-1);
						bean.setPlayerId2(row.get("match_player3")!=null?Long.parseLong(row.get("match_player3").toString()):-1);
						
						bean.setRound(row.get("match_round")!=null?Long.parseLong(row.get("match_round").toString()):-1);
						bean.setStatus(row.get("match_status")!=null?row.get("match_status").toString():"");
						bean.setTeam1(row.get("team1")!=null?row.get("team1").toString():"");
						bean.setTeam2(row.get("team2")!=null?row.get("team2").toString():"");
						if(!((row.get("score")!=null?row.get("score").toString():"").equals("0-0,0-0,0-0")))
						bean.setScore(row.get("score")!=null?row.get("score").toString():"");
						matchlist.add(bean);
					}
				}
				roundListWithMatchs.setMatchlist(matchlist);
				beanlist.add(roundListWithMatchs);
			}
		}
		return beanlist;
	}

	@Override
	public String addDoublesPlayerForTournament(JSONArray doublesPlayer) {
		String result=null;
		try {
			 JSONObject rec = doublesPlayer.getJSONObject(0);
			 JSONObject rec2 = doublesPlayer.getJSONObject(1);
			    int val1,val2=0,paymentId=-1;
				String QUERY = "INSERT INTO `payment` (category_id,tournament_id,transaction_status,amount,card_or_cash) VALUES(?,?,?,?,?)";
				val1 = jdbcTemplate.update(QUERY, new Object[]{rec.getInt("categoryId"),rec.getInt("tournamentId"),"SUCCESS",rec.getInt("entryFee"),"CASH"});
				paymentId = jdbcTemplate.queryForObject("SELECT payment_id FROM `payment` ORDER BY payment_id DESC LIMIT 1", Integer.class);
				if(paymentId >=0)
				val2 = jdbcTemplate.update("INSERT INTO `player_tournament` (player_id1,player_id2,tournament_id,category_id,custom_aita,payment_id,registered_by) VALUES(?,?,?,?,?,?,?)", new Object[]{rec.getInt("playerId"),rec2.getInt("playerId"),rec.getInt("tournamentId"),rec.getInt("categoryId"),rec.getInt("aitaRank"),paymentId,1});
				if(val1 >0 && val2 >0)
	    			result = "Players registered successfully.";
	    		else
	    			result = "Something Wnr Wrong Try again";
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			result="Something Went Wrong.";
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<ScheduleInnerBean> getScheduleList(int tournamentId, int categoryId) {
		int index=0;
		List<ScheduleInnerBean> beanList = new ArrayList<ScheduleInnerBean>();
		String QUERY="SELECT m.`match_id`,m.`match_type`,m.`match_round`,m.`match_status`,m.`score`,m.match_winner1,m.team1,m.team2,"
				+ "(SELECT cm.category_name FROM category_master cm WHERE cm.category_id = "+categoryId+") AS categoryName,"
				+ "m.`match_date`,TIME_FORMAT(m.start_time, '%h:%i %p') AS starttime,"
				+ "(SELECT c.court_name FROM courts c WHERE c.court_id = m.`courtId`) AS court,"
				+ "TIME_FORMAT(m.end_time, '%h:%i %p') AS endtime,(SELECT p.player_name FROM players p WHERE p.player_id = m.`match_player1`) AS player1,"
				+ "(SELECT p.player_name FROM players p WHERE p.player_id = m.`match_player2`) AS player2,"
				+ "(SELECT p.player_name FROM players p WHERE p.player_id = m.`match_player3`) AS player3,"
				+ "(SELECT p.player_name FROM players p WHERE p.player_id = m.`match_player4`) AS player4,"
				+ "(SELECT p.player_id FROM players p WHERE p.player_id = m.`match_player1`) AS playerId1,"
				+ "(SELECT p.player_id FROM players p WHERE p.player_id = m.`match_player2`) AS playerId2,"
				+ "(SELECT p.player_id FROM players p WHERE p.player_id = m.`match_player3`) AS playerId3,"
				+ "(SELECT p.player_id FROM players p WHERE p.player_id = m.`match_player4`) AS playerId4"
				+ " FROM matchs m WHERE `tournament_id`=? AND `category_id`=?";
				List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY,new Object[] { tournamentId, categoryId});
				if (rows != null && rows.size() > 0) {
					for (Map row : rows) {
						ScheduleInnerBean bean = new ScheduleInnerBean();
						bean.setCategoryName(row.get("categoryName")!=null?row.get("categoryName").toString():"");
						bean.setRoundNo(row.get("match_round")!=null?Integer.parseInt(row.get("match_round").toString()):0);
						bean.setMatchId(row.get("match_id")!=null?Integer.parseInt(row.get("match_id").toString()):0);
						bean.setMatchType(row.get("match_type")!=null?row.get("match_type").toString():"");
						bean.setMatchRound(row.get("match_round")!=null?Integer.parseInt(row.get("match_round").toString()):0);
						if(index == rows.size() - 1)
							bean.setRound("Final");
						else if((index == rows.size() - 2) || (index == rows.size() - 3))
							bean.setRound("Semi");
						else
							bean.setRound(String.valueOf(row.get("match_round")!=null?Integer.parseInt(row.get("match_round").toString()):0));
						
						bean.setMatchStatus(row.get("match_status")!=null?row.get("match_status").toString():"");
						bean.setScore(row.get("score")!=null?row.get("score").toString():"");
						bean.setScheduleDate(row.get("match_date")!=null?row.get("match_date").toString():"");
						bean.setCourt(row.get("court")!=null?row.get("court").toString():"");
						bean.setStartTime(row.get("starttime")!=null?row.get("starttime").toString():"");
						bean.setEndTime(row.get("endtime")!=null?row.get("endtime").toString():"");
						
						if((row.get("match_type")!=null?row.get("match_type").toString():"").equals("SINGLE")){
							bean.setPlayer1(row.get("player1")!=null?row.get("player1").toString():"");
							bean.setPlayer2(row.get("player3")!=null?row.get("player3").toString():"");
							if((row.get("match_winner1")!=null?row.get("match_winner1").toString():"").equals(row.get("team1")!=null?row.get("team1").toString():""))
								  bean.setWinner(1);
							else
								bean.setWinner(3);
						}else{
							bean.setPlayer1((row.get("player1")!=null?row.get("player1").toString():"")+" & "+(row.get("player2")!=null?row.get("player2").toString():""));
							bean.setPlayer2((row.get("player3")!=null?row.get("player3").toString():"")+" & "+(row.get("player4")!=null?row.get("player4").toString():""));
							if((row.get("match_winner1")!=null?row.get("match_winner1").toString():"").equals(row.get("team1")!=null?row.get("team1").toString():""))
								  bean.setWinner(1);
							else
								bean.setWinner(3);
						
						}
						if(userSession.getPlayerId() != null){
						if(((row.get("playerId1")!=null?Integer.parseInt(row.get("playerId1").toString()):-1) == userSession.getPlayerId()) || 
								((row.get("playerId2")!=null?Integer.parseInt(row.get("playerId2").toString()):-1) == userSession.getPlayerId()) ||
								((row.get("playerId3")!=null?Integer.parseInt(row.get("playerId3").toString()):-1) == userSession.getPlayerId()) ||
								((row.get("playerId4")!=null?Integer.parseInt(row.get("playerId4").toString()):-1) == userSession.getPlayerId())){
							bean.setLoginPlayer(String.valueOf(userSession.getPlayerId()));
						}else{
							bean.setLoginPlayer(String.valueOf(-1));
						}
						}
						if(bean.getMatchStatus().equals("COMPLETED") && (bean.getPlayer2() == "" || bean.getPlayer2().equals(" & ")) && bean.getMatchRound() == 1){
							bean.setIsbyMatch(true);
						}
						if(bean.getMatchStatus().equals("COMPLETED") && (bean.getPlayer1() == "" || bean.getPlayer1().equals(" & ")) && bean.getMatchRound() == 1){
							bean.setIsbyMatch(true);
						}
							
						index++;
						beanList.add(bean);
					}
				}
		return beanList;
	}

	@Override
	public BuildSchedule getDaysAndNoOfMatchs(int tournamentId) {
		System.out.println("tournamentId>> "+tournamentId);
		BuildSchedule bean = new BuildSchedule();
	  String QUERY= "SELECT DISTINCT t.`tournament_id`,t.tournament_statrdate,t.tournament_enddate,t.`tournament_venue_id`"
	  		+ " FROM `tournament` t INNER JOIN `tournament_category` c"
	  		+ " ON t.`tournament_id` = c.`tournament_id` WHERE t.`tournament_id`=? ";
	  List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY, new Object[]{tournamentId});
		if(rows != null && rows.size()>0) {
			for (Map row : rows) {
			//bean.setCategoryId(categoryId);
			bean.setTournamentId(tournamentId);
			bean.setDays(getDaysList(row.get("tournament_statrdate")!=null?row.get("tournament_statrdate").toString():"",row.get("tournament_enddate")!=null?row.get("tournament_enddate").toString():""));
			bean.setCourt(getCourtDetails(row.get("tournament_venue_id")!=null?Integer.parseInt(row.get("tournament_venue_id").toString()):0));
			bean.setMatchs(getMatchs(tournamentId));
			}
		}
		return bean;
	}

	private List<MatchBean> getMatchs(int tournamentId) {
		List<MatchBean> matchList = new ArrayList<MatchBean>();
		String QUERY="SELECT m.`match_id`"
				+ " FROM matchs m WHERE m.`tournament_id`=? AND m.`match_status` != 'COMPLETED' ORDER BY  m.`match_round` ASC, m.`match_id` ASC";
		 List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY, new Object[]{tournamentId});
			if(rows != null && rows.size()>0) {
				for (Map row : rows) {
					MatchBean bean = new MatchBean();
					bean.setMatch_id(row.get("match_id")!=null?Integer.parseInt(row.get("match_id").toString()):0);
					/*bean.setMatchType(row.get("match_type")!=null?row.get("match_type").toString():"");
					bean.setMatchRound(row.get("match_round")!=null?Integer.parseInt(row.get("match_round").toString()):0);
					bean.setMatchStatus(row.get("match_status")!=null?row.get("match_status").toString():"");
					bean.setScore(row.get("score")!=null?row.get("score").toString():"");
					bean.setStartTime(row.get("start_time")!=null?row.get("start_time").toString():"");
					bean.setEndTime(row.get("end_time")!=null?row.get("end_time").toString():"");
					if((row.get("match_type")!=null?row.get("match_type").toString():"").equals("SINGLE")){
						bean.setPlayer1(row.get("player1")!=null?row.get("player1").toString():"");
						bean.setPlayer2(row.get("player3")!=null?row.get("player3").toString():"");
					}else{
						bean.setPlayer1((row.get("player1")!=null?row.get("player1").toString():"")+" & "+(row.get("player2")!=null?row.get("player2").toString():""));
						bean.setPlayer2((row.get("player3")!=null?row.get("player3").toString():"")+" & "+(row.get("player4")!=null?row.get("player4").toString():""));
					}*/
					matchList.add(bean);
				}
			}
		return matchList;
	}

	private List<CourtBean> getCourtDetails(int id) {
		 List<CourtBean> courts = new ArrayList<CourtBean>();
		 String QUERY="SELECT court_name,court_id FROM courts WHERE venue_id = ?";
		 List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY, new Object[]{id});
			if(rows != null && rows.size()>0) {
				for (Map row : rows) {
					CourtBean bean = new CourtBean();
					bean.setCourtId(row.get("court_id")!=null?Integer.parseInt(row.get("court_id").toString()):-1);
					bean.setCourtName(row.get("court_name")!=null?row.get("court_name").toString():"");
					courts.add(bean);
				}
			}
		return courts;
	}

	private List<DateBean> getDaysList(String str_date, String end_date) {
		List<DateBean> dates = new ArrayList<DateBean>();
		DateFormat formatter ; 
		  formatter = new SimpleDateFormat("yyyy-MM-dd");
		  Date startDate = null;
		  Date endDate = null;
		  try {
		   startDate = (Date)formatter.parse(str_date);
		   endDate = (Date)formatter.parse(end_date);
		  } catch (ParseException e) {
		   e.printStackTrace();
		  } 
		  long interval = 24*1000 * 60 * 60;
		  long endTime =endDate.getTime() ;
		  long curTime = startDate.getTime();
		  while (curTime <= endTime) {
			  DateBean bean = new DateBean();
			  Date lDate = new Date(curTime);
			  bean.setDate(formatter.format(lDate));
			  dates.add(bean);
		      curTime += interval;
		  }
		return dates;
	}

	@Override
	public String saveScheduleData(JSONArray scheduleJson) {
		String result = null;
		String QUERY = "UPDATE matchs SET start_time = ?, end_time = ?,match_date=?,courtId=? WHERE match_id=?";
		try {
			for (int i = 0; i < scheduleJson.length(); ++i) {
				JSONObject rec;
				rec = scheduleJson.getJSONObject(i);
				int val = jdbcTemplate.update(QUERY, new Object[] { rec.getString("starttime"),
						rec.getString("endtime"), rec.getString("day"),rec.getInt("court"),rec.getInt("matchId") });
				if (val > 0)
					result = "Success";
			}
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			result = "Something Went Wrong.";
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<MatchTournamentBean> getTournamentListToUpdateScore(int orgId) {
    String QUERY="SELECT t.`tournament_id`,t.`tournament_title`,t.orgaizer_id,(SELECT v.venue_name FROM `venues` v "
    		+ "WHERE v.venue_id = t.`tournament_venue_id`) AS venueName,DATE_FORMAT(t.`tournament_statrdate`, '%d-%M-%Y') AS tournament_statrdate,"
    		+ "DATE_FORMAT(t.`tournament_enddate`, '%d-%M-%Y') AS tournament_enddate,"
    		+ "(SELECT v.venue_location FROM `venues` v WHERE v.venue_id = t.`tournament_venue_id`) AS venue_location"
    		+ " FROM `tournament` t INNER JOIN `refefree_master` m ON t.`tournament_id`=m.`tournament_id` AND t.`orgaizer_id`=?";
           List<MatchTournamentBean> beanList = new ArrayList<MatchTournamentBean>();
           try{
		    List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY, new Object[]{orgId});
			if(rows != null && rows.size()>0) {
				for (Map row : rows) {
					MatchTournamentBean bean = new MatchTournamentBean();
					List<MatchTournamentCategoryBean> matchTournamentList = getMatchTournamentCategory(row.get("tournament_id")!=null?Integer.parseInt(row.get("tournament_id").toString()):-1);
					bean.setTournamentId(row.get("tournament_id")!=null?Integer.parseInt(row.get("tournament_id").toString()):-1);
					bean.setTitle(row.get("tournament_title")!=null?row.get("tournament_title").toString():"");
					bean.setOrgaizerId(row.get("orgaizer_id")!=null?Integer.parseInt(row.get("orgaizer_id").toString()):-1);
					bean.setVenueName(row.get("venueName")!=null?row.get("venueName").toString():"");
					bean.setLocation(row.get("venue_location")!=null?row.get("venue_location").toString():"");
					bean.setStartDate(row.get("tournament_statrdate")!=null?row.get("tournament_statrdate").toString():"");
					bean.setEndDate(row.get("tournament_enddate")!=null?row.get("tournament_enddate").toString():"");
					bean.setMatchTournamentCategoryBean(matchTournamentList);
					if(matchTournamentList.size() > 0)
					beanList.add(bean);
				}
			}
           }catch(Exception e){
        	   e.printStackTrace();
        	   return beanList;
           }
		
		return beanList;
	}

	private List<MatchTournamentCategoryBean> getMatchTournamentCategory(int tournamentid) {
		List<MatchTournamentCategoryBean> listData =  new ArrayList<MatchTournamentCategoryBean>();
		String QUERY = "SELECT c.`category_id`,(SELECT i.`category_name` FROM `category_master` i WHERE i.`category_id` = c.`category_id`) AS categoryName,"
				+ "(SELECT i.`category_desc` FROM `category_master` i WHERE i.`category_id` = c.`category_id`) AS singleordouble,"
							+ "c.`prize_money`,c.`tournament_fee`"
							+ " FROM `tournament_category` c WHERE c.`tournament_id` ="+tournamentid+"";
		try{
			List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY);
			if(rows != null && rows.size()>0) {
				for(Map row : rows){
					MatchTournamentCategoryBean bean = new MatchTournamentCategoryBean();
					bean.setCheckSchedule(jdbcTemplate.queryForObject("SELECT COUNT(`match_date`) FROM `matchs` WHERE "
							+ "`tournament_id`="+tournamentid+" AND `category_id`= "+(row.get("category_id")!=null?Integer.parseInt(row.get("category_id").toString()):-1)+" AND `match_date` IS NOT NULL", Integer.class));
					List<MatchRoundBean> roundBeanList = getMatchRounds(tournamentid,row.get("category_id")!=null?Integer.parseInt(row.get("category_id").toString()):-1);
					bean.setCategoryName(row.get("categoryName")!=null?row.get("categoryName").toString():"");
					bean.setCategoryId(row.get("category_id")!=null?Integer.parseInt(row.get("category_id").toString()):-1);
					bean.setTournamentFee(row.get("tournament_fee")!=null?Double.parseDouble(row.get("tournament_fee").toString()):0);
					bean.setPrizeMoney(row.get("prize_money")!=null?Double.parseDouble(row.get("prize_money").toString()):0);
					bean.setMatchRoundBean(roundBeanList);
					if(roundBeanList.size() > 0)
					listData.add(bean);
				}
			}
	        }catch(Exception e){
	        	e.printStackTrace();
	        	return listData;
	        }
		return listData;
	}

	private List<MatchRoundBean> getMatchRounds(int tournamentid, int categoryId) {
		List<MatchRoundBean> listData = new ArrayList<MatchRoundBean>();
		try{
			List<Map<String, Object>> rows = jdbcTemplate.queryForList("SELECT DISTINCT m.`match_round` FROM `matchs` m WHERE m.`category_id`="+categoryId+" AND m.`tournament_id`="+tournamentid+"");
			if(rows != null && rows.size()>0) {
				for(Map row : rows){
					MatchRoundBean outerBean = new MatchRoundBean();
					List<MatchBean> roundList = new ArrayList<MatchBean>();
					List<Map<String, Object>> innerrows = jdbcTemplate.queryForList("SELECT DISTINCT m.`match_round`,m.`match_id`,m.`match_status`,m.`match_type`,m.team1,m.team2,"
							+ "(SELECT p.player_name FROM players p WHERE p.player_id = m.`match_player1`) AS player1,"
							+ "(SELECT p.player_name FROM players p WHERE p.player_id = m.`match_player2`) AS player2,"
							+ "(SELECT p.player_name FROM players p WHERE p.player_id = m.`match_player3`) AS player3,"
							+ "(SELECT p.player_name FROM players p WHERE p.player_id = m.`match_player4`) AS player4"
							+ " FROM `matchs` m WHERE m.`category_id`=? AND m.`tournament_id`=? AND match_status !='COMPLETED' AND m.`match_round`=?", new Object[]{categoryId,tournamentid,
									row.get("match_round")!=null?Integer.parseInt(row.get("match_round").toString()):-1});
					if(innerrows != null && innerrows.size()>0) {
						for(Map innerrow : innerrows){
							MatchBean matchBean = new MatchBean();
							matchBean.setMatch_id(innerrow.get("match_id")!=null?Integer.parseInt(innerrow.get("match_id").toString()):0);
							matchBean.setMatchRound(innerrow.get("match_round")!=null?Integer.parseInt(innerrow.get("match_round").toString()):0);
							matchBean.setMatchStatus(innerrow.get("match_status")!=null?innerrow.get("match_status").toString():"");
							matchBean.setTeam1(innerrow.get("team1")!=null?innerrow.get("team1").toString():"");
							matchBean.setTeam2(innerrow.get("team2")!=null?innerrow.get("team2").toString():"");
							if((innerrow.get("match_type")!=null?innerrow.get("match_type").toString():"").equals("SINGLE")){
								matchBean.setPlayer1(innerrow.get("player1")!=null?innerrow.get("player1").toString():"");
								matchBean.setPlayer2(innerrow.get("player3")!=null?innerrow.get("player3").toString():"");
							}else{
								matchBean.setPlayer1((innerrow.get("player1")!=null?innerrow.get("player1").toString():"")+" & "+(innerrow.get("player2")!=null?innerrow.get("player2").toString():""));
								matchBean.setPlayer2((innerrow.get("player3")!=null?innerrow.get("player3").toString():"")+" & "+(innerrow.get("player4")!=null?innerrow.get("player4").toString():""));
							}
							roundList.add(matchBean);
							//outerBean.setRoundList(roundList);
						}
					}
					if(roundList.size() > 0){
					outerBean.setRoundList(roundList);
					outerBean.setRound("Round: "+(row.get("match_round")!=null?Integer.parseInt(row.get("match_round").toString()):-1));
					listData.add(outerBean);
					}
				}
			}
	        }catch(Exception e){
	        	e.printStackTrace();
	        	return listData;
	        }
		return listData;
	}

	@Override
	public String updateMatchScore(UpdateMatchScore bean) {
	 String result = null;
     String QUERY = "UPDATE matchs SET match_status = ?, match_winner1 = ?, score = ? WHERE tournament_id = ? AND category_id = ? AND match_id =?";
        try{
       int value =  jdbcTemplate.update(QUERY,new Object[]{bean.getStatues(),bean.getWinner(),bean.getScore(),bean.getTournamentid(),bean.getCategoryid(),bean.getMatchid()});
		if(value > 0){
			if(bean.getWinner() !=null && bean.getWinner() != "(NULL)"){
				String[] words = bean.getWinner().split(",");
				int player1 = Integer.parseInt(words[0]);
				int player2 = Integer.parseInt(words[1]);
				int round = jdbcTemplate.queryForObject("SELECT `match_round` FROM matchs WHERE tournament_id = "+bean.getTournamentid()+" AND `category_id`="+bean.getCategoryid()+" AND `match_id`="+bean.getMatchid()+"", Integer.class);
                ArrayList<Integer> matchIdFirst = new ArrayList<Integer>();
                ArrayList<Integer> matchIdSecond = new ArrayList<Integer>();
                List<Map<String, Object>> rows = jdbcTemplate.queryForList("SELECT `match_id` FROM matchs WHERE tournament_id = "+bean.getTournamentid()+" AND `category_id`="+bean.getCategoryid()+" AND `match_round`="+round+" ORDER BY `match_id` ASC");
    			if(rows != null && rows.size()>0) {
    				for(Map row : rows){
    					matchIdFirst.add(row.get("match_id")!=null?Integer.parseInt(row.get("match_id").toString()):0);
    				}
    			}
    			List<Map<String, Object>> secrows = jdbcTemplate.queryForList("SELECT `match_id` FROM matchs WHERE tournament_id = "+bean.getTournamentid()+" AND `category_id`="+bean.getCategoryid()+" AND `match_round`="+(round+1)+" ORDER BY `match_id` ASC");
    			if(secrows != null && secrows.size()>0) {
    				for(Map row : secrows){
    					matchIdSecond.add(row.get("match_id")!=null?Integer.parseInt(row.get("match_id").toString()):0);
    				}
    			}
			     int innerIndex =0;
    			for(int index = 0;index < matchIdFirst.size(); index+=2){
    				if(matchIdSecond.size() > 0){
    				int mid1 = matchIdFirst.get(index);
    				int mid2 = matchIdFirst.get(index+1);
    				if(mid1 == bean.getMatchid()){
    					jdbcTemplate.update("UPDATE matchs SET match_player1 = ?, match_player2 = ?, team1 = ? WHERE tournament_id = ? AND category_id = ? AND match_id =?",
    							new Object[]{player1,player2,bean.getWinner(),bean.getTournamentid(),bean.getCategoryid(),matchIdSecond.get(innerIndex)});
    				}
    				if(mid2 == bean.getMatchid()){
    					jdbcTemplate.update("UPDATE matchs SET match_player3 = ?, match_player4 = ?, team2 = ? WHERE tournament_id = ? AND category_id = ? AND match_id =?",
    							new Object[]{player1,player2,bean.getWinner(),bean.getTournamentid(),bean.getCategoryid(),matchIdSecond.get(innerIndex)});
    				}
    				innerIndex++;
    			  }
    			}
			
			
			}
			result = "Match updated successfully.";
		}
		else
			result = "Something went wrong";
        }catch(Exception e){
			result = "Something went wrong";
        	log.error("Exception In updateMatchScore() :: "+e);
        	e.printStackTrace();
        }
		return result;
	}

	
	@Override
	public List<RoundBean> getDataForSchedule(int tournamentid) {
		List<RoundBean> listData = new ArrayList<RoundBean>();
		int noOfRounds = 0;
		ArrayList<Integer> category = new ArrayList<Integer>();
     String QUERY1= "SELECT COUNT(DISTINCT `match_round`) AS totalround,`tournament_id`,`category_id` FROM matchs WHERE tournament_id = "+tournamentid+" GROUP BY `category_id`";
     try{
			List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY1);
			if(rows != null && rows.size()>0) {
				for(Map row : rows){
					category.add(row.get("category_id")!=null?Integer.parseInt(row.get("category_id").toString()):0);
					if((row.get("totalround")!=null?Integer.parseInt(row.get("totalround").toString()):0) > noOfRounds)
					 noOfRounds = row.get("totalround")!=null?Integer.parseInt(row.get("totalround").toString()):0;
				}
			}
			for(int round = 1; round <= noOfRounds; round++){
				RoundBean roundBean = new RoundBean();
				List<MatchCategoryBean> categoryList = new ArrayList<MatchCategoryBean>();
				for(int cat: category){
					MatchCategoryBean matchCategoryBean = new MatchCategoryBean();
					List<MatchBean> match =	getCategoryWithMatchList(round,cat,tournamentid);
					matchCategoryBean.setCategoryId(cat);
					matchCategoryBean.setMatch(match);
					categoryList.add(matchCategoryBean);
				}
				roundBean.setCategories(categoryList);
				roundBean.setRound(round);
				listData.add(roundBean);
			}
	        }catch(Exception e){
	        	e.printStackTrace();
	        	return listData;
	        }
		return listData;
	}

	private List<MatchBean> getCategoryWithMatchList(int round, int cat, int tournamentid) {
		List<MatchBean> beanList =  new ArrayList<MatchBean>();
		String QUERY="SELECT DISTINCT m.`match_round`,m.`match_id`,m.`match_status`,m.`match_type`,m.team1,m.team2,"
				+ "(SELECT p.player_name FROM players p WHERE p.player_id = m.`match_player1`) AS player1,"
				+ "(SELECT p.player_name FROM players p WHERE p.player_id = m.`match_player2`) AS player2,"
				+ "(SELECT p.player_name FROM players p WHERE p.player_id = m.`match_player3`) AS player3,"
				+ "(SELECT p.player_name FROM players p WHERE p.player_id = m.`match_player4`) AS player4"
				+ " FROM `matchs` m WHERE m.`category_id`=? AND m.`tournament_id`=? AND m.`match_round`=?";
		try {
			List<Map<String, Object>> innerrows = jdbcTemplate.queryForList(QUERY,
					new Object[] { cat, tournamentid, round });
			if (innerrows != null && innerrows.size() > 0) {
				for (Map innerrow : innerrows) {
					MatchBean matchBean = new MatchBean();
					matchBean.setMatch_id(innerrow.get("match_id") != null
							? Integer.parseInt(innerrow.get("match_id").toString()) : 0);
					matchBean.setMatchRound(innerrow.get("match_round") != null
							? Integer.parseInt(innerrow.get("match_round").toString()) : 0);
					matchBean.setMatchStatus(
							innerrow.get("match_status") != null ? innerrow.get("match_status").toString() : "");
					matchBean.setTeam1(innerrow.get("team1") != null ? innerrow.get("team1").toString() : "");
					matchBean.setTeam2(innerrow.get("team2") != null ? innerrow.get("team2").toString() : "");
					if ((innerrow.get("match_type") != null ? innerrow.get("match_type").toString() : "")
							.equals("SINGLE")) {
						matchBean.setPlayer1(innerrow.get("player1") != null ? innerrow.get("player1").toString() : "");
						matchBean.setPlayer2(innerrow.get("player3") != null ? innerrow.get("player3").toString() : "");
					} else {
						matchBean.setPlayer1((innerrow.get("player1") != null ? innerrow.get("player1").toString() : "")
								+ " & " + (innerrow.get("player2") != null ? innerrow.get("player2").toString() : ""));
						matchBean.setPlayer2((innerrow.get("player3") != null ? innerrow.get("player3").toString() : "")
								+ " & " + (innerrow.get("player4") != null ? innerrow.get("player4").toString() : ""));
					}
					beanList.add(matchBean);
				}
			}
		}catch(Exception e){
	        	e.printStackTrace();
	        	return beanList;
	        }
		return beanList;
	}

	@Override
	public boolean isDrwasCreated(int tournamentId) {
         try{
		  List<Map<String, Object>> innerrows = jdbcTemplate.queryForList("SELECT * FROM matchs m WHERE m.`tournament_id`="+tournamentId+"");
		  if (innerrows != null && innerrows.size() > 0) {
			  return true;
		  }
		  else
			  return false;
         }catch(Exception e){
        	 e.printStackTrace();
        	 return false;
         }
	}

	private DrwasFirstAndSecondSets getFirstRound(List<DrwasMatch> firstSet, List<DrwasMatch> secondSet, int[] arr32) {
		//int arr32[] = { 0, 8, 15, 7, 2, 10, 13, 5, 1, 9, 14, 6, 3, 11, 12, 5};
		List<DrwasMatch> dmatch = new ArrayList<DrwasMatch>();
		for (int first = 0; first < firstSet.size(); first++) {
			DrwasMatch mbean = new DrwasMatch();
			mbean.setMatch(firstSet.get(first).getMatch());
			dmatch.add(mbean);
			DrwasMatch mbean1 = new DrwasMatch();
			mbean1.setMatch(secondSet.get(first).getMatch());
			dmatch.add(mbean1);

		}
		System.out.println(dmatch);
		/*for (int second = 0; second < secondSet.size(); second++) {
			DrwasMatch mbean = new DrwasMatch();
			mbean.setMatch(secondSet.get(second).getMatch());
			dmatch.add(mbean);

		}*/
		List<DrwasMatch> roundFirstmatch = new ArrayList<DrwasMatch>();
		for (int i = 0; i < arr32.length; i++) {
			DrwasMatch mbean = new DrwasMatch();
			mbean = dmatch.get(arr32[i]);
			roundFirstmatch.add(mbean);
		}
		DrwasFirstAndSecondSets drwasFirstAndSecondSets = new DrwasFirstAndSecondSets();
		List<DrwasMatch> firstSet1 = new ArrayList<DrwasMatch>();
		List<DrwasMatch> secondSet1 = new ArrayList<DrwasMatch>();
		for(int r = 0; r<roundFirstmatch.size(); r++){
			   if(r < roundFirstmatch.size()/2)
            	firstSet1.add(roundFirstmatch.get(r));
			   else
				   secondSet1.add(roundFirstmatch.get(r));
			
		}
		drwasFirstAndSecondSets.setFirstSet(firstSet1);
		drwasFirstAndSecondSets.setSecondSet(secondSet1);
		return drwasFirstAndSecondSets;
	}
	@Override
	public String removePlayerFromTournament(int playerId, int paymentId, int tournamentId, int categoryId) {
		int payment = 0;
          try{
        	 int matchVal =  jdbcTemplate.queryForObject("SELECT COUNT(`match_id`) AS matchid FROM matchs WHERE (match_player1 ="+playerId+" OR match_player2 ="+playerId+""
        	  		+ " OR match_player3 ="+playerId+" OR match_player4 ="+playerId+")  AND tournament_id="+tournamentId+" AND category_id="+categoryId+"", Integer.class);
        	  if(matchVal > 0){
        		  jdbcTemplate.update("DELETE FROM matchs WHERE tournament_id=? AND category_id=? AND (match_player1=? OR match_player2=? OR match_player3=? OR match_player4=?)", 
        				  new Object[]{tournamentId,categoryId,playerId,playerId,playerId,playerId});
        	  }
        	 int tournament_reg = jdbcTemplate.update("DELETE FROM player_tournament WHERE tournament_id=? AND category_id=? AND player_id1=? AND payment_id=? AND registered_by=1", new Object[]{tournamentId,categoryId,playerId,paymentId});
        	  if(tournament_reg > 0){
        		  payment = jdbcTemplate.update("DELETE FROM payment WHERE tournament_id=? AND category_id=? AND payment_id=?", new Object[]{tournamentId,categoryId,paymentId});
        	  }
        	  if(payment > 0 && matchVal > 0)
        		  return "Player got removed !. please update the draws.";
        	  else if(payment > 0 && matchVal <= 0)
        		  return "Player got removed !";
        	  else
        		  return "Something went wrong!";
          }catch(Exception e){
        	  e.printStackTrace();
        	  return "Something went wrong!";
          }
         
	}

	@Override
	public List<PlayersBean> getRagisteredPlayers(int tournamentId, int categoryId) {
		List<PlayersBean> playerList = getPlayers(tournamentId, categoryId);
		return playerList;
	}

	@Override
	public List<MatchTournamentCategoryBean> createTournamentLavelSchedule(int tournamentId) {
      String QUERY = "SELECT t.tournament_id,t.`category_id`,m.`category_name` FROM `tournament_category` t INNER JOIN `category_master` m ON t.`category_id`=m.`category_id` AND t.`tournament_id`="+tournamentId+"";
      List<MatchTournamentCategoryBean> listdata = new ArrayList<MatchTournamentCategoryBean>();
      try{
			List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY);
			if(rows != null && rows.size()>0) {
				for(Map row : rows){
					MatchTournamentCategoryBean bean = new MatchTournamentCategoryBean();
					int category = row.get("category_id")!=null?Integer.parseInt(row.get("category_id").toString()):-1; 
					int isdrawscreated = jdbcTemplate.queryForObject("SELECT COUNT(match_id) AS matchid FROM `matchs` WHERE `tournament_id`="+tournamentId+" AND `category_id`="+category+"", Integer.class);
					if(isdrawscreated <= 0){
						bean.setCategoryId(category);
						bean.setCategoryName(row.get("category_name")!=null?row.get("category_name").toString():"");
						listdata.add(bean);
					}
					
				}
			}
	        }catch(Exception e){
	        	e.printStackTrace();
	        	return listdata;
	        }
		return listdata;
	}

	@Override
	public TournamentLavelScheduleBean ViewTournamentLavelSchedule(int tournamentId) {
		TournamentLavelScheduleBean bean = new TournamentLavelScheduleBean();
		List<ScheduleInnerBean> listBean = new ArrayList<ScheduleInnerBean>();
		try{
			int matchLength = jdbcTemplate.queryForObject("SELECT COUNT(`match_date`) AS matchid FROM `matchs` WHERE `tournament_id`="+tournamentId+" AND `match_date` IS NOT NULL", Integer.class);
			if(matchLength > 0){
				List<Map<String, Object>> rows = jdbcTemplate.queryForList("SELECT DISTINCT category_id FROM `matchs` WHERE `tournament_id`="+tournamentId+" AND `match_date` IS NOT NULL");
				if(rows != null && rows.size()>0) {
					for(Map row : rows){
						List<ScheduleInnerBean> list = getScheduleList(tournamentId, (row.get("category_id")!=null?Integer.parseInt(row.get("category_id").toString()):-1));
						listBean.addAll(list);
					}
				}
				bean.setScheduleList(listBean);
				
			}else{
				bean.setConditionVal(true);
				return bean;
			}
			
		}catch(Exception e){
			e.printStackTrace();
			return bean;
		}
		return bean;
	}

	@Override
	public List<MatchTournamentBean> getTournamentListForUpdateScore(int orgId) {
	    String QUERY="SELECT t.`tournament_id`,t.`tournament_title`,t.orgaizer_id,(SELECT v.venue_name FROM `venues` v "
	    		+ "WHERE v.venue_id = t.`tournament_venue_id`) AS venueName,DATE_FORMAT(t.`tournament_statrdate`, '%d-%M-%Y') AS tournament_statrdate,"
	    		+ "DATE_FORMAT(t.`tournament_enddate`, '%d-%M-%Y') AS tournament_enddate,"
	    		+ "(SELECT v.venue_location FROM `venues` v WHERE v.venue_id = t.`tournament_venue_id`) AS venue_location"
	    		+ " FROM `tournament` t INNER JOIN `refefree_master` m ON t.`tournament_id`=m.`tournament_id` AND t.`orgaizer_id`=?";
	           List<MatchTournamentBean> beanList = new ArrayList<MatchTournamentBean>();
	           try{
			    List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY, new Object[]{orgId});
				if(rows != null && rows.size()>0) {
					for (Map row : rows) {
						MatchTournamentBean bean = new MatchTournamentBean();
						List<MatchTournamentCategoryBean> matchTournamentList = getTournamentCategoryForUpdte(row.get("tournament_id")!=null?Integer.parseInt(row.get("tournament_id").toString()):-1);
						bean.setTournamentId(row.get("tournament_id")!=null?Integer.parseInt(row.get("tournament_id").toString()):-1);
						bean.setTitle(row.get("tournament_title")!=null?row.get("tournament_title").toString():"");
						bean.setOrgaizerId(row.get("orgaizer_id")!=null?Integer.parseInt(row.get("orgaizer_id").toString()):-1);
						bean.setVenueName(row.get("venueName")!=null?row.get("venueName").toString():"");
						bean.setLocation(row.get("venue_location")!=null?row.get("venue_location").toString():"");
						bean.setStartDate(row.get("tournament_statrdate")!=null?row.get("tournament_statrdate").toString():"");
						bean.setEndDate(row.get("tournament_enddate")!=null?row.get("tournament_enddate").toString():"");
						bean.setMatchTournamentCategoryBean(matchTournamentList);
						if(matchTournamentList.size() > 0)
						beanList.add(bean);
					}
				}
	           }catch(Exception e){
	        	   e.printStackTrace();
	        	   return beanList;
	           }
			
			return beanList;
		}

	private List<MatchTournamentCategoryBean> getTournamentCategoryForUpdte(int tournamentid) {
		List<MatchTournamentCategoryBean> listData =  new ArrayList<MatchTournamentCategoryBean>();
		String QUERY = "SELECT c.`category_id`,(SELECT i.`category_name` FROM `category_master` i WHERE i.`category_id` = c.`category_id`) AS categoryName,"
				+ "(SELECT i.`category_desc` FROM `category_master` i WHERE i.`category_id` = c.`category_id`) AS singleordouble,"
							+ "c.`prize_money`,c.`tournament_fee`"
							+ " FROM `tournament_category` c WHERE c.`tournament_id` ="+tournamentid+"";
		try{
			List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY);
			if(rows != null && rows.size()>0) {
				for(Map row : rows){
					MatchTournamentCategoryBean bean = new MatchTournamentCategoryBean();
					bean.setCheckSchedule(jdbcTemplate.queryForObject("SELECT COUNT(`match_date`) FROM `matchs` WHERE "
							+ "`tournament_id`="+tournamentid+" AND `category_id`= "+(row.get("category_id")!=null?Integer.parseInt(row.get("category_id").toString()):-1)+" AND `match_date` IS NOT NULL", Integer.class));
					bean.setCategoryName(row.get("categoryName")!=null?row.get("categoryName").toString():"");
					bean.setCategoryId(row.get("category_id")!=null?Integer.parseInt(row.get("category_id").toString()):-1);
					bean.setTournamentFee(row.get("tournament_fee")!=null?Double.parseDouble(row.get("tournament_fee").toString()):0);
					bean.setPrizeMoney(row.get("prize_money")!=null?Double.parseDouble(row.get("prize_money").toString()):0);
					listData.add(bean);
				}
			}
	        }catch(Exception e){
	        	e.printStackTrace();
	        	return listData;
	        }
		return listData;
	}

	@Override
	public List<MatchRoundBean> getRoundMatchRoundList(int tournamentid, int categoryId) {
		int index=0;
		List<MatchRoundBean> listData = new ArrayList<MatchRoundBean>();
		try{
			List<Map<String, Object>> rows = jdbcTemplate.queryForList("SELECT DISTINCT m.`match_round` FROM `matchs` m WHERE m.`category_id`="+categoryId+" AND m.`tournament_id`="+tournamentid+"");
			if(rows != null && rows.size()>0) {
				for(Map row : rows){
					MatchRoundBean outerBean = new MatchRoundBean();
					List<MatchBean> roundList = new ArrayList<MatchBean>();
					List<Map<String, Object>> innerrows = jdbcTemplate.queryForList("SELECT DISTINCT m.`match_round`,m.`match_id`,m.`match_status`,m.`match_type`,m.team1,m.team2,"
							+ "m.match_date,TIME_FORMAT(m.start_time, '%h:%i %p') AS starttime,TIME_FORMAT(m.end_time, '%h:%i %p') AS endtime,m.score,m.match_winner1,"
							+ "(SELECT c.court_name FROM courts c WHERE c.court_id = m.`courtId`) AS court,"
							+ "(SELECT p.player_name FROM players p WHERE p.player_id = m.`match_player1`) AS player1,"
							+ "(SELECT p.player_name FROM players p WHERE p.player_id = m.`match_player2`) AS player2,"
							+ "(SELECT p.player_name FROM players p WHERE p.player_id = m.`match_player3`) AS player3,"
							+ "(SELECT p.player_name FROM players p WHERE p.player_id = m.`match_player4`) AS player4"
							+ " FROM `matchs` m WHERE m.`category_id`=? AND m.`tournament_id`=? AND m.`match_round`=? AND `match_date` IS NOT NULL", new Object[]{categoryId,tournamentid,
									row.get("match_round")!=null?Integer.parseInt(row.get("match_round").toString()):-1});
					if(innerrows != null && innerrows.size()>0) {
						for(Map innerrow : innerrows){
							MatchBean matchBean = new MatchBean();
							matchBean.setCourt(innerrow.get("court")!=null?innerrow.get("court").toString():"");
							matchBean.setMatch_id(innerrow.get("match_id")!=null?Integer.parseInt(innerrow.get("match_id").toString()):0);
							matchBean.setMatchRound(innerrow.get("match_round")!=null?Integer.parseInt(innerrow.get("match_round").toString()):0);
							matchBean.setMatchStatus(innerrow.get("match_status")!=null?innerrow.get("match_status").toString():"");
							matchBean.setTeam1(innerrow.get("team1")!=null?innerrow.get("team1").toString():"");
							matchBean.setTeam2(innerrow.get("team2")!=null?innerrow.get("team2").toString():"");
							matchBean.setScheduleDate(innerrow.get("match_date")!=null?innerrow.get("match_date").toString():"");
							matchBean.setStartTime(innerrow.get("starttime")!=null?innerrow.get("starttime").toString():"");
							matchBean.setEndTime(innerrow.get("endtime")!=null?innerrow.get("endtime").toString():"");
							matchBean.setScore(innerrow.get("score")!=null?innerrow.get("score").toString():"");
							
							if((innerrow.get("match_type")!=null?innerrow.get("match_type").toString():"").equals("SINGLE")){
								matchBean.setPlayer1(innerrow.get("player1")!=null?innerrow.get("player1").toString():"");
								matchBean.setPlayer2(innerrow.get("player3")!=null?innerrow.get("player3").toString():"");
								if((innerrow.get("match_winner1")!=null?innerrow.get("match_winner1").toString():"").equals(innerrow.get("team1")!=null?innerrow.get("team1").toString():""))
									matchBean.setWinner(1);
								else
									matchBean.setWinner(3);
							}else{
								matchBean.setPlayer1((innerrow.get("player1")!=null?innerrow.get("player1").toString():"")+" & "+(innerrow.get("player2")!=null?innerrow.get("player2").toString():""));
								matchBean.setPlayer2((innerrow.get("player3")!=null?innerrow.get("player3").toString():"")+" & "+(innerrow.get("player4")!=null?innerrow.get("player4").toString():""));
								if((innerrow.get("match_winner1")!=null?innerrow.get("match_winner1").toString():"").equals(innerrow.get("team1")!=null?innerrow.get("team1").toString():""))
									matchBean.setWinner(1);
								else
									matchBean.setWinner(3);
							
							}
							roundList.add(matchBean);
						}
					}
					if(roundList.size() > 0){
					outerBean.setRoundList(roundList);
					if(index == rows.size() - 1)
						outerBean.setRound("Final");
					else if(index == rows.size() - 2)
						outerBean.setRound("Semi");
					else
						outerBean.setRound(String.valueOf(row.get("match_round")!=null?Integer.parseInt(row.get("match_round").toString()):0));
					//outerBean.setRound("Round: "+(row.get("match_round")!=null?Integer.parseInt(row.get("match_round").toString()):-1));
					index++;
					listData.add(outerBean);
					}
				}
			}
	        }catch(Exception e){
	        	e.printStackTrace();
	        	return listData;
	        }
		return listData;
	}

	@Override
	public String updateMatchStatus(UpdateMatchScore bean) {
		String QUERY = "UPDATE matchs SET match_status = ? WHERE match_id = ? AND tournament_id = ? AND category_id = ?";
		// val =jdbcTemplate.update(QUERY,new Object[]{rec.getInt("updatedRank"),rec.getInt("playerId"),rec.getInt("tournamentId"),rec.getInt("categoryId")});
	  //  UPDATE player_tournament SET custom_aita = ? WHERE player_id1 = ? AND tournament_id = ? AND category_id = ?
			try{
				int val = jdbcTemplate.update(QUERY,new Object[]{bean.getStatues(),bean.getMatchid(),bean.getTournamentid(),bean.getCategoryid()});
				if(val > 0)
					return "Match status got changed.";
				else
					return "Something went please try again";
			}catch(Exception e){
				e.printStackTrace();
				return "Something went please try again";
			}
	}

	@Override
	public TournamentList mainCategoryList(int tournamentId) {
		TournamentList bean = new TournamentList();
		String QUERY = "SELECT DISTINCT t.`tournament_id`,t.`tournament_title`,t.orgaizer_id,(SELECT v.venue_name FROM `venues` v "
				+ "WHERE v.venue_id = t.`tournament_venue_id`) AS venueName,(SELECT v.venue_location FROM `venues` v WHERE v.venue_id = t.`tournament_venue_id`) "
				+ "AS venue_location,DATE_FORMAT(t.`tournament_statrdate`, '%d-%b-%Y') AS tournament_statrdate,"
				+ "DATE_FORMAT(t.`tournament_enddate`, '%d-%b-%Y') AS tournament_enddate,t.`organizer_name`,t.`organizer_phone`,t.`organizer_altphone`,"
				+ "t.`organizer_mailId`,t.`banner_image`,m.`refefree_name`,DATE_FORMAT(t.`reg_start_date`, '%d-%b-%Y') AS reg_start_date,"
				+ "DATE_FORMAT(t.`reg_end_date`, '%d-%b-%Y') AS reg_end_date FROM `tournament` t INNER JOIN `refefree_master` m ON t.`tournament_id`=+"+tournamentId+"";
		try{
			List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY);
			if(rows != null && rows.size()>0) {
				for(Map row : rows){
					List<TournamentCategoryBean> categoryList = getTournamentCategoryList(tournamentId);
					bean.setTournamentId(row.get("tournament_id")!=null?Integer.parseInt(row.get("tournament_id").toString()):0);
					bean.setTitle(row.get("tournament_title")!=null?row.get("tournament_title").toString():"");
					bean.setOrgaizerId(row.get("orgaizer_id")!=null?Integer.parseInt(row.get("orgaizer_id").toString()):0);
					bean.setVenueName(row.get("venueName")!=null?row.get("venueName").toString():"");
					bean.setLocation(row.get("venue_location")!=null?row.get("venue_location").toString():"");
					bean.setDate(row.get("tournament_statrdate")!=null?row.get("tournament_statrdate").toString():"");
					bean.setOrganizerName(row.get("organizer_name")!=null?row.get("organizer_name").toString():"");
					bean.setPhone(row.get("organizer_phone")!=null?row.get("organizer_phone").toString():"");
					bean.setAltPhone(row.get("organizer_altphone")!=null?row.get("organizer_altphone").toString():"");
					bean.setEmail(row.get("organizer_mailId")!=null?row.get("organizer_mailId").toString():"");
					bean.setBannerImage(row.get("banner_image")!=null?row.get("banner_image").toString():"");
					bean.setRefereeName(row.get("refefree_name")!=null?row.get("refefree_name").toString():"");
					bean.setTournamentStartDate(row.get("tournament_statrdate")!=null?row.get("tournament_statrdate").toString():"");
					bean.setTournamentEndDate(row.get("tournament_enddate")!=null?row.get("tournament_enddate").toString():"");
					bean.setRegStartDate(row.get("reg_start_date")!=null?row.get("reg_start_date").toString():"");
					bean.setRegEndDate(row.get("reg_end_date")!=null?row.get("reg_end_date").toString():"");
					bean.setCategoryList(categoryList);
				}
			}
	        }catch(Exception e){
	        	e.printStackTrace();
	        	return bean;
	        }
		return bean;
	}

	@Override
	public boolean isScheduleCreated(int tournamentId) {
		try{
		int val = 	jdbcTemplate.queryForObject("SELECT COUNT(`match_date`) AS matchid FROM `matchs` WHERE `tournament_id`="+tournamentId+" AND `match_date` IS NOT NULL", Integer.class);
			if(val > 0)
				return true;
			else 
				return false;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public TournamentList singleTournamentWithCategories(int playerId, String currentDate, int tournamentId) {
		int playerage=0,gender=-1;
        try{
      	  List<Map<String, Object>> rows = jdbcTemplate.queryForList("SELECT TIMESTAMPDIFF(YEAR,player_dob, NOW()) AS age, gender FROM players WHERE `player_id`="+playerId+"");
			if(rows != null && rows.size()>0) {
				for(Map row : rows){
					playerage = row.get("age")!=null?Integer.parseInt(row.get("age").toString()):-1;
					gender = row.get("gender")!=null?Integer.parseInt(row.get("gender").toString()):-1;
				}
			}
        }catch(Exception e){
      	  e.printStackTrace();
        }		
        TournamentList bean = new TournamentList();
		String QUERY = "SELECT t.`tournament_id`,t.`tournament_title`,t.orgaizer_id,(SELECT v.venue_name FROM `venues` v WHERE v.venue_id = t.`tournament_venue_id`) AS venueName,"
				+ "(SELECT v.venue_location FROM `venues` v WHERE v.venue_id = t.`tournament_venue_id`) AS venue_location,"
				+ "DATE_FORMAT(t.`tournament_statrdate`, '%d-%b-%Y') AS tournament_statrdate,DATE_FORMAT(t.`tournament_enddate`, '%d-%b-%Y') AS tournament_enddate,"
				+ "t.`organizer_name`,t.`organizer_phone`,t.`organizer_altphone`,t.`organizer_mailId`,t.`banner_image`,m.`refefree_name`,"
				+ "DATE_FORMAT(t.`reg_start_date`, '%d-%b-%Y') AS reg_start_date,DATE_FORMAT(t.`reg_end_date`, '%d-%b-%Y') AS reg_end_date,"
				+ "IF('"+currentDate+"' BETWEEN t.`reg_start_date` AND t.`reg_end_date`,'true','false') AS boleanVal,"
						+ "IF(CURDATE() <= t.`tournament_enddate`,'pactive','inactive') AS activestatus"
				+ " FROM `tournament` t INNER JOIN `refefree_master` m ON t.`tournament_id`=m.`tournament_id` AND t.`tournament_enddate` >= '"+currentDate+"' AND t.`tournament_id`= "+tournamentId+"";
		//System.out.println(QUERY);
		try{
			List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY);
			if(rows != null && rows.size()>0) {
				for(Map row : rows){
					List<TournamentCategoryBean> categoryList = getTournamentCategoryList(playerId,tournamentId,currentDate,playerage,gender);
					if(categoryList.size() > 0){
					bean.setCategoryList(categoryList);
					bean.setTournamentId(row.get("tournament_id")!=null?Integer.parseInt(row.get("tournament_id").toString()):0);
					bean.setActive(row.get("activestatus")!=null?row.get("activestatus").toString():"");
					bean.setTitle(row.get("tournament_title")!=null?row.get("tournament_title").toString():"");
					bean.setOrgaizerId(row.get("orgaizer_id")!=null?Integer.parseInt(row.get("orgaizer_id").toString()):0);
					bean.setVenueName(row.get("venueName")!=null?row.get("venueName").toString():"");
					bean.setLocation(row.get("venue_location")!=null?row.get("venue_location").toString():"");
					bean.setDate(row.get("tournament_statrdate")!=null?row.get("tournament_statrdate").toString():"");
					bean.setOrganizerName(row.get("organizer_name")!=null?row.get("organizer_name").toString():"");
					bean.setPhone(row.get("organizer_phone")!=null?row.get("organizer_phone").toString():"");
					bean.setAltPhone(row.get("organizer_altphone")!=null?row.get("organizer_altphone").toString():"");
					bean.setEmail(row.get("organizer_mailId")!=null?row.get("organizer_mailId").toString():"");
					bean.setBannerImage(row.get("banner_image")!=null?row.get("banner_image").toString():"");
					bean.setRefereeName(row.get("refefree_name")!=null?row.get("refefree_name").toString():"");
					bean.setTournamentStartDate(row.get("tournament_statrdate")!=null?row.get("tournament_statrdate").toString():"");
					bean.setTournamentEndDate(row.get("tournament_enddate")!=null?row.get("tournament_enddate").toString():"");
					bean.setRegStartDate(row.get("reg_start_date")!=null?row.get("reg_start_date").toString():"");
					bean.setRegEndDate(row.get("reg_end_date")!=null?row.get("reg_end_date").toString():"");
					bean.setConditionVal(row.get("boleanVal")!=null?Boolean.parseBoolean(row.get("boleanVal").toString()):false);
					}
				}
			}
	        }catch(Exception e){
	        	e.printStackTrace();
	        	return bean;
	        }
		return bean;
	}

	@Override
	public String updatePlayersDetails(JSONArray playerJson) {
		String result = null;
		String QUERY ="UPDATE players SET player_name = ? WHERE player_id = ?";
			 try {
				 for (int i = 0; i < playerJson.length(); ++i) {
				  JSONObject rec = playerJson.getJSONObject(i);
				int val =   jdbcTemplate.update(QUERY,new Object[]{rec.get("playername"),rec.getInt("playerid")});
				if(val  > 0)
					result = "Success";
				 }
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				result = "Something went wrong please try agian!";
				e.printStackTrace();
				
			}
		
		return result;
	}

	@Override
	public String extendsTournamentDate(ExtendsBean bean) {
		String result=null;
		String QUERY ="UPDATE tournament SET tournament_statrdate = ?,tournament_enddate = ?,reg_start_date = ?,reg_end_date = ? WHERE tournament_id = ? AND orgaizer_id = ?";
		try {
			   int val =jdbcTemplate.update(QUERY,new Object[]{bean.getTournamentStartDate(),bean.getTournamentEndDate(),bean.getRegStartDate(),bean.getRegEndDate(),bean.getTournamentid(),bean.getOrganiserid()});
			if(val > 0)
				result = "Success";
		} catch (Exception e) {
			result="Something Went Wrong.";
			e.printStackTrace();
		}
		return result;
	}

	public String testDrawsForSixteen(int tournamentId,int categoryId) {
		//System.out.println("TournamentDaoImpl.testDrawsForSixteen()");
		String result="Draws created successfully.";
		List<DrwasFirstAndSecondSets> listData = new ArrayList<DrwasFirstAndSecondSets>();
		List<DrawsPlayer> listBean = getMatchPlayerList(tournamentId,categoryId);
		List<DrawsPlayer> finalListBean = new ArrayList<DrawsPlayer>();
		DrwasFirstAndSecondSets drwasFirstAndSecondSets = new DrwasFirstAndSecondSets();
		int loopSize = 0;
		if(listBean.size() >8 && listBean.size() <= 16){
			loopSize = 16 - listBean.size();
			for (int index = 0; index < 4; index++){
				finalListBean.add(listBean.get(0));
				listBean.remove(0);
			}
			finalListBean = CommonUtil.editPlayerListIndex(listBean,finalListBean);
		}
		 for(int i=0; i< loopSize; i++){
			DrawsPlayer bean = new DrawsPlayer();
			bean.setBooleanVal(false);
			bean.setByMatch(true);
			finalListBean.add(bean);
		 }
		    List<DrwasMatch> firstSet1 = new ArrayList<DrwasMatch>();
			List<DrwasMatch> secondSet1 = new ArrayList<DrwasMatch>();
			for(int index = 0;index < (finalListBean.size()/2); index++){
				List<DrawsPlayer> player = new ArrayList<DrawsPlayer>();
				DrwasMatch match = new DrwasMatch();
				DrawsPlayer pl1 = new DrawsPlayer();
				DrawsPlayer pl2 = new DrawsPlayer();
				 pl1 = finalListBean.get(index);
				 pl2 = finalListBean.get((finalListBean.size()-1)-index);
				player.add(pl1);
				player.add(pl2);
				match.setMatch(player);
				if ( index % 2 == 0 ){
					firstSet1.add(match);
				}else{
					secondSet1.add(match);
				}
			}
			int arr16[] = {0,71,61,31,21,51,41,1};
			ArrayList<Integer> positions=new ArrayList<Integer>();
			positions.add(1);
			positions.add(2);
			positions.add(5);
			positions.add(6);
			ArrayList<Integer> values=new ArrayList<Integer>();
			values.add(4);
			values.add(5);
			values.add(6);
			values.add(7);
			CommonUtil.editArray(arr16,positions,values);
			ArrayList<Integer> positions1=new ArrayList<Integer>();
			positions1.add(3);
			positions1.add(4);
			ArrayList<Integer> values1=new ArrayList<Integer>();
			values1.add(3);
			values1.add(2);
			CommonUtil.editArray(arr16,positions1,values1);
			drwasFirstAndSecondSets = getFirstRound(firstSet1,secondSet1,arr16);
			
			 List<DrwasMatch> firstSet = drwasFirstAndSecondSets.getFirstSet();
		     List<DrwasMatch> secondSet = drwasFirstAndSecondSets.getSecondSet();
			/*drwasFirstAndSecondSets.setFirstSet(firstSet);
			drwasFirstAndSecondSets.setSecondSet(secondSet);*/
			 if(drwasFirstAndSecondSets !=null)
			listData.add(drwasFirstAndSecondSets);
			int customSize = firstSet.size();
			for(int j=0;j<customSize;j++){
				if(firstSet.size() == 1)
					break;
				List<DrwasMatch> innerfirstSet = getRound(firstSet);
				List<DrwasMatch> innersecondSet = getRound(secondSet);
				DrwasFirstAndSecondSets outerInnerBean = new DrwasFirstAndSecondSets();
				outerInnerBean.setFirstSet(innerfirstSet);
				outerInnerBean.setSecondSet(innersecondSet);
				listData.add(outerInnerBean);
				firstSet = innerfirstSet;
				secondSet = innersecondSet;
			}
			DrwasFirstAndSecondSets outerBeanSec = new DrwasFirstAndSecondSets();
			List<DrawsPlayer> playerFirst = new ArrayList<DrawsPlayer>();
			List<DrwasMatch> outerfirstSet = new ArrayList<DrwasMatch>();
			DrwasMatch playersFirst = new DrwasMatch();
			DrawsPlayer pl1 = new DrawsPlayer();
			playerFirst.add(pl1);
			playersFirst.setMatch(playerFirst);
			outerfirstSet.add(playersFirst);
			outerBeanSec.setFirstSet(outerfirstSet);
			
			List<DrawsPlayer> playerSec = new ArrayList<DrawsPlayer>();
			List<DrwasMatch> outerSecondSet = new ArrayList<DrwasMatch>();
			DrwasMatch playersSec = new DrwasMatch();
			DrawsPlayer pl2 = new DrawsPlayer();
			playerSec.add(pl2);
			playersSec.setMatch(playerSec);
			outerSecondSet.add(playersSec);
			outerBeanSec.setSecondSet(outerSecondSet);
			listData.add(outerBeanSec);
			
			if(listData.size() > 0){
					List<DrwasFirstAndSecondSets> persistlistData = update16OrdeiInList(listData);
				    result = saveDrawsDetail(persistlistData,tournamentId,categoryId);
				}
			

		return "Draws created successfully."; 
	}

	@Override
	public boolean getDrawsPublishMethod(int tournamentId, int categoryId) {
		boolean result;
		try{
		String QUERY = "SELECT CASE WHEN c.`isDrawsActive`= 1 THEN 'true' ELSE 'false' END AS actbol FROM `tournament_category` c WHERE c.tournament_id=? AND c.category_id=?";
		result =  jdbcTemplate.queryForObject(QUERY, new Object[]{tournamentId, categoryId},Boolean.class);
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		return result;
	}

	@Override
	public String setActiveOrInActiveDraw(int tournamentId, int categoryId, int activeVal) {
		System.out.println("tournamentId :: "+tournamentId+" categoryId :: "+categoryId+" activeVal:: "+activeVal);
		String result=null;
        try{
           int row = jdbcTemplate.update("UPDATE tournament_category set isDrawsActive=? WHERE tournament_id=? AND category_id=?", new Object[]{activeVal,tournamentId,categoryId});
           if(row >0) result="Data Updated successfully";
       }catch(Exception e){
           result="Something went wrong";
           e.printStackTrace();
           return result;
       }
        return result;
	}
	@Override
	public String setActiveOrInActivePlayers(int tournamentId, int categoryId, int activeVal) {
		System.out.println("tournamentId :: "+tournamentId+" categoryId :: "+categoryId+" activeVal:: "+activeVal);
		String result=null;
        try{
           int row = jdbcTemplate.update("UPDATE tournament_category set isPlayerListActive=? WHERE tournament_id=? AND category_id=?", new Object[]{activeVal,tournamentId,categoryId});
           if(row >0) result="Data Updated successfully";
       }catch(Exception e){
           result="Something went wrong";
           e.printStackTrace();
           return result;
       }
        return result;
	}
	@Override
	public PlayesrListAndPublishPlayer isPlayerListPublish(int tournamentId, int categoryId) {
		PlayesrListAndPublishPlayer bean = new PlayesrListAndPublishPlayer();
		boolean result;
		try {
			String QUERY = "SELECT CASE WHEN c.`isPlayerListActive`= 1 THEN 'true' ELSE 'false' END AS actbol FROM `tournament_category` c WHERE c.tournament_id=? AND c.category_id=?";
			bean.setPlayersPublish(
					jdbcTemplate.queryForObject(QUERY, new Object[] { tournamentId, categoryId }, Boolean.class));
		} catch (Exception e) {
			e.printStackTrace();
			return bean;
		}
		return bean;
	}
	@Override
	public boolean getPlayerPublishMethod(int tournamentId, int categoryId) {
		boolean result;
		try{
		String QUERY = "SELECT CASE WHEN c.`isPlayerListActive`= 1 THEN 'true' ELSE 'false' END AS actbol FROM `tournament_category` c WHERE c.tournament_id=? AND c.category_id=?";
		result =  jdbcTemplate.queryForObject(QUERY, new Object[]{tournamentId, categoryId},Boolean.class);
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		return result;
	}
}