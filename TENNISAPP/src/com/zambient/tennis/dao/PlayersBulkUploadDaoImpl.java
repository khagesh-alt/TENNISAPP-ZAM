package com.zambient.tennis.dao;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.zambient.tennis.bean.CategoryBean;
import com.zambient.tennis.bean.DoubleBulkUploadBean;
import com.zambient.tennis.bean.DoublePlayersDetailsBean;
import com.zambient.tennis.bean.PlayersBean;
import com.zambient.tennis.bean.SingleBulkUploadBean;

@PropertySource("classpath:/com/zambient/tennis/resources/tennisapp.properties")
@Repository("playersBulkUploadDao")
public class PlayersBulkUploadDaoImpl implements PlayersBulkUploadDao{
	
	final static Logger log = Logger.getLogger(PlayersBulkUploadDaoImpl.class);
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Override
	public synchronized String uploadBulkAndRegisterForSingleMatch(SingleBulkUploadBean singleBulkUploadBean) {
		log.info("PlayersBulkUploadDaoImpl.uploadBulkAndRegisterForSingleMatch()"+singleBulkUploadBean);
		boolean register = false,persist =false;
		//String QUERY =  "SELECT `player_id`,player_itarank FROM `players` WHERE `player_phone`=?";
		String QUERY = "SELECT p.`player_id`,p.player_itarank,(SELECT t.player_id1 FROM `player_tournament` t WHERE t.`tournament_id`=? AND t.`category_id`=? "
				+ "AND p.`player_id`=t.player_id1 ) AS paymentPlayer FROM `players` p WHERE `player_phone`=?";
		
		for(PlayersBean player : singleBulkUploadBean.getPlayerList()){
			try {
				List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY, new Object[] {singleBulkUploadBean.getTournamentId(),singleBulkUploadBean.getCategoryId(), player.getPhone() });
				if (rows != null && rows.size() > 0) {
					for (Map row : rows) {
						int paymentPlayer = row.get("paymentPlayer")!=null?Integer.parseInt(row.get("paymentPlayer").toString()):0;
						if(paymentPlayer <= 0)
						register =	registerPlayerToTournament(row.get("player_id")!=null?Integer.parseInt(row.get("player_id").toString()):0,
								row.get("player_itarank")!=null?Integer.parseInt(row.get("player_itarank").toString()):0,singleBulkUploadBean.getTournamentId(),
								singleBulkUploadBean.getCategoryId(),singleBulkUploadBean.getEntryFee());
					}
				}else{
					 persist = persistPlayerIntoTable(player,singleBulkUploadBean.getTournamentId(), singleBulkUploadBean.getCategoryId(),singleBulkUploadBean.getEntryFee());
					}
			}catch(Exception e){
				e.printStackTrace();
				log.error("Exception In PlayersBulkUploadDaoImpl :: uploadBulkAndRegisterForSingleMatch() :: " + e);
				 return "failed";
			}
			
		}
		return "Success";
	}

	private boolean registerPlayerToTournament(int playerId, int itaRank, long tournamentId, long categoryId,double entryFee) {
		log.info("PlayersBulkUploadDaoImpl.registerPlayerToTournament()");
		int val1, val2 = 0, paymentId = -1;
		String QUERY = "INSERT INTO `payment` (category_id,tournament_id,transaction_status,amount,card_or_cash) VALUES(?,?,?,?,?)";
		try {
			val1 = jdbcTemplate.update(QUERY, new Object[] { categoryId, tournamentId, "SUCCESS", entryFee, "CASH" });
			paymentId = jdbcTemplate.queryForObject("SELECT payment_id FROM `payment` ORDER BY payment_id DESC LIMIT 1", Integer.class);
			if (paymentId >= 0)
				val2 = jdbcTemplate.update("INSERT INTO `player_tournament` (player_id1,player_id2,tournament_id,category_id,custom_aita,payment_id,registered_by) VALUES(?,?,?,?,?,?,?)",
						new Object[] { playerId, -1, tournamentId, categoryId, itaRank, paymentId, 1 });
			if (val1 > 0 && val2 > 0)
				return true;
			else
				return false;

		} catch (Exception e) {
			e.printStackTrace();
			log.error("Exception In TournamentDaoImpl addPaymentForTournamentCategory() :: " + e);
			return false;
		}

	}
	private boolean persistPlayerIntoTable(PlayersBean playersBean, long tournamentId, long categoryId, double entryFee) {
            log.info("PlayersBulkUploadDaoImpl::persistPlayerIntoTabl");
		boolean result = false;
		String QUERY="INSERT INTO `players` (player_name,player_add,player_lavel,"
				+ "player_phone,player_email,player_itaid,player_itarank,player_pwd,player_repwd,gender,player_dob) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
		
		String QUERY2 = "INSERT INTO `playerranks` (player_id,player_points,player_ranks) VALUES(?,?,?)";
		
    	  try{
  			int val = jdbcTemplate.update(QUERY, new Object[]{playersBean.getName(),playersBean.getAddress(),playersBean.getLavel()
      				,playersBean.getPhone(),playersBean.getEmail(),playersBean.getItaId(),playersBean.getItaRank(),"tennis","tennis",playersBean.getGender(),playersBean.getDateOfBirth()});
  			int playerId = jdbcTemplate.queryForObject("SELECT `player_id` FROM `players` WHERE `player_phone`=?",new Object[] { playersBean.getPhone() }, Integer.class);
  			jdbcTemplate.update(QUERY2, new Object[]{playerId,playersBean.getPoints(),playersBean.getRank()});
  			 result = registerPlayerToTournament(playerId,playersBean.getItaRank().intValue(), tournamentId, categoryId, entryFee);
    	  }catch(Exception e){
      		e.printStackTrace();
      		log.error("Exception In PlayersDaoImpl addPlayer() :: "+e);
      	}
		return result;
    	  
      }

	@Override
	public CategoryBean getMatchCategoryDesc(long category) {
		CategoryBean bean = new CategoryBean();
		String QUERY="SELECT category_id,category_name,category_desc,category_age,category_gender FROM category_master WHERE `category_id`=?";
		try{
			List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY,new Object[] {category});
			if (rows != null && rows.size() > 0) {
				for (Map row : rows) {
					bean.setCategory_id(row.get("category_id")!=null?Integer.parseInt(row.get("category_id").toString()):-1);
					bean.setCategory_name(row.get("category_name")!=null?row.get("category_name").toString():"");
					bean.setCategory_desc(row.get("category_desc")!=null?row.get("category_desc").toString():"");
					bean.setCategory_age(row.get("category_age")!=null?Integer.parseInt(row.get("category_age").toString()):-1);
					bean.setCategory_gender(row.get("category_gender")!=null?Integer.parseInt(row.get("category_gender").toString()):-1);
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			return bean;
		}
		return bean;
	}

	@Override
	public synchronized String uploadBulkAndRegisterForDoubleMatch(DoubleBulkUploadBean doubleBulkUploadBean) {
		log.info("PlayersBulkUploadDaoImpl :: uploadBulkAndRegisterForDoubleMatch");
		boolean persist =false;
		String QUERY = "SELECT p.`player_id`,p.player_itarank,(SELECT t.id FROM `player_tournament` t WHERE t.`tournament_id`=? AND t.`category_id`=?	"
				+ "AND (p.`player_id`=t.player_id2 OR p.`player_id`=t.player_id1)) AS paymentPlayer FROM `players` p WHERE `player_phone`=?";
		try{
		for(DoublePlayersDetailsBean bean : doubleBulkUploadBean.getPlayerList()){
			int player1=-1, player2 =-1, player1Pay=-1, player2Pay=-1, player1Aita=-1,player2Aita=-1;
			
			// first player
			List<Map<String, Object>> playerFirstRows = jdbcTemplate.queryForList(QUERY,new Object[] {doubleBulkUploadBean.getTournamentId(),doubleBulkUploadBean.getCategoryId(),bean.getFirstPlayerMobile()});
			if(playerFirstRows !=null && playerFirstRows.size() >0){
				for (Map row : playerFirstRows) {
					player1 = row.get("player_id")!=null?Integer.parseInt(row.get("player_id").toString()):-1;
					player1Aita = row.get("player_itarank")!=null?Integer.parseInt(row.get("player_itarank").toString()):-1;
					player1Pay = row.get("paymentPlayer")!=null?Integer.parseInt(row.get("paymentPlayer").toString()):-1;
				}
			}else{
				player1Aita = bean.getFirstPlayerAitaRank().intValue();
				player1 = persistPlayerIntoFirstPlayerTable(bean);
			}
			
			// sec player
			List<Map<String, Object>> playerSecondRows = jdbcTemplate.queryForList(QUERY,new Object[] {doubleBulkUploadBean.getTournamentId(),doubleBulkUploadBean.getCategoryId(),bean.getSecondPlayerMobile()});
			if(playerSecondRows !=null && playerSecondRows.size() >0){
				for (Map row : playerSecondRows) {
					player2 = row.get("player_id")!=null?Integer.parseInt(row.get("player_id").toString()):-1;
					player2Aita = row.get("player_itarank")!=null?Integer.parseInt(row.get("player_itarank").toString()):-1;
					player2Pay = row.get("paymentPlayer")!=null?Integer.parseInt(row.get("paymentPlayer").toString()):-1;
				}
			}else{
				player2Aita = bean.getSecondPlayerAitaRank().intValue();
				player2 = persistPlayerIntoSecondPlayerTable(bean);
			}
			
			if(player1Pay <0 && player2Pay <0 && player1 >0 && player2 >0){
				persist = registerDoublePlayersToTournament(player1, player2, player1Aita,player2Aita, doubleBulkUploadBean.getTournamentId(), doubleBulkUploadBean.getCategoryId(),doubleBulkUploadBean.getEntryFee());
			}
			
			
		}
		}catch(Exception e){
			log.error("Exception In TournamentDaoImpl addPaymentForTournamentCategory() :: " + e);
			return "Failed";
		}
		return "Success";
	}

	private boolean registerDoublePlayersToTournament(int player1, int player2, int player1Aita, int player2Aita,
			Long tournamentId, Long categoryId, Double entryFee) {
		int val1, val2 = 0, paymentId = -1;
		String QUERY = "INSERT INTO `payment` (category_id,tournament_id,transaction_status,amount,card_or_cash) VALUES(?,?,?,?,?)";
		try {
			val1 = jdbcTemplate.update(QUERY, new Object[] { categoryId, tournamentId, "SUCCESS", entryFee, "CASH" });
			paymentId = jdbcTemplate.queryForObject("SELECT payment_id FROM `payment` ORDER BY payment_id DESC LIMIT 1", Integer.class);
			if (paymentId >= 0)
				val2 = jdbcTemplate.update("INSERT INTO `player_tournament` (player_id1,player_id2,tournament_id,category_id,custom_aita,payment_id,registered_by) VALUES(?,?,?,?,?,?,?)",
						new Object[] { player1, player2, tournamentId, categoryId, player1Aita, paymentId, 1 });
			if (val1 > 0 && val2 > 0)
				return true;
			else
				return false;

		} catch (Exception e) {
			e.printStackTrace();
			log.error("Exception In TournamentDaoImpl addPaymentForTournamentCategory() :: " + e);
			return false;
		}

	}

	private int persistPlayerIntoFirstPlayerTable(DoublePlayersDetailsBean playersBean) {
		int playerId = -1;
		String QUERY="INSERT INTO `players` (player_name,player_add,player_lavel,"
				+ "player_phone,player_email,player_itaid,player_itarank,player_pwd,player_repwd,gender,player_dob) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
		
		String QUERY2 = "INSERT INTO `playerranks` (player_id,player_points,player_ranks) VALUES(?,?,?)";
    	  try{
  			int val = jdbcTemplate.update(QUERY, new Object[]{playersBean.getFirstPlayerName(),playersBean.getFirstPlayerAdd(),playersBean.getFirstPlayerLavel(),
  					playersBean.getFirstPlayerMobile(),playersBean.getFirstPlayerEmail(),playersBean.getFirstPlayerAita(),playersBean.getFirstPlayerAitaRank(),"tennis","tennis",
  					playersBean.getFirstPlayerGender(),playersBean.getFirstPlayerDob()});
  			 playerId = jdbcTemplate.queryForObject("SELECT `player_id` FROM `players` WHERE `player_phone`=?",new Object[] { playersBean.getFirstPlayerMobile() }, Integer.class);
  			jdbcTemplate.update(QUERY2, new Object[]{playerId,playersBean.getFirstPlayerPoint(),playersBean.getFirstPlayerRank()});
    	  }catch(Exception e){
      		e.printStackTrace();
      		log.error("Exception In PlayersDaoImpl addPlayer() :: "+e);
      	}
		return playerId;
    }
	private int persistPlayerIntoSecondPlayerTable(DoublePlayersDetailsBean playersBean) {
		int playerId = -1;
		String QUERY="INSERT INTO `players` (player_name,player_add,player_lavel,"
				+ "player_phone,player_email,player_itaid,player_itarank,player_pwd,player_repwd,gender,player_dob) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
		
		String QUERY2 = "INSERT INTO `playerranks` (player_id,player_points,player_ranks) VALUES(?,?,?)";
    	  try{
  			int val = jdbcTemplate.update(QUERY, new Object[]{playersBean.getSecondPlayerName(),playersBean.getSecondPlayerAdd(),playersBean.getSecondPlayerLavel(),
  					playersBean.getSecondPlayerMobile(),playersBean.getSecondPlayerEmail(),playersBean.getSecondPlayerAita(),playersBean.getSecondPlayerAitaRank(),"tennis","tennis",
  					playersBean.getSecondPlayerGender(),playersBean.getSecondPlayerDob()});
  			 playerId = jdbcTemplate.queryForObject("SELECT `player_id` FROM `players` WHERE `player_phone`=?",new Object[] { playersBean.getSecondPlayerMobile() }, Integer.class);
  			jdbcTemplate.update(QUERY2, new Object[]{playerId,playersBean.getSecondPlayerPoint(),playersBean.getSecondPlayerRank()});
    	  }catch(Exception e){
      		e.printStackTrace();
      		log.error("Exception In PlayersDaoImpl addPlayer() :: "+e);
      	}
		return playerId;
	}
   
}
