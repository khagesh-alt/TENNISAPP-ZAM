package com.zambient.tennis.dao;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.zambient.tennis.bean.LoginBean;
import com.zambient.tennis.bean.PlayerUserBO;
import com.zambient.tennis.bean.PlayersBean;
import com.zambient.tennis.bean.RankCategoryBean;
import com.zambient.tennis.bean.players;

@PropertySource("classpath:/com/zambient/tennis/resources/tennisapp.properties")
@Repository("playersDao")
public class PlayersDaoImpl implements PlayersDao{
	final static Logger log = Logger.getLogger(PlayersDaoImpl.class);
	@Autowired
	private JdbcTemplate jdbcTemplate;

	/**
	 * This method is used to register player 
	 * */
	@Override
	public String addPlayer(PlayersBean playersBean) {
		log.info("PlayersDaoImpl :: addPlayer method");
		log.info("playersBean ::"+playersBean);
		String QUERY="INSERT INTO `players` (player_name,player_add,player_lavel,"
				+ "player_phone,player_email,player_itaid,player_itarank,player_pwd,player_repwd,gender,player_dob) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
		
		String QUERY2 = "INSERT INTO `playerranks` (player_id,player_points,player_ranks) VALUES(LAST_INSERT_ID(),?,?)";
		String result=null;
		try{
			int size = jdbcTemplate.queryForObject("SELECT COUNT(player_phone) FROM players WHERE `player_phone`='"+playersBean.getPhone()+"'",Integer.class);
    		if(size <= 0){
			int val = jdbcTemplate.update(QUERY, new Object[]{playersBean.getName(),playersBean.getAddress(),playersBean.getLavel()
    				,playersBean.getPhone(),playersBean.getEmail(),playersBean.getItaId(),playersBean.getItaRank(),playersBean.getPwd(),playersBean.getRepwd(),playersBean.getGender(),
    				playersBean.getDateOfBirth()});
			jdbcTemplate.update(QUERY2, new Object[]{playersBean.getPoints(),playersBean.getRank()});
    		if(val >0)
    			result = "Success";
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

	/**
	 * This method is used to get player list for a particular 
	 * */
	@Override
	public List<players> getPlayerList(int categoryId, int tournamentId) {
		List<players> playerList = new ArrayList<players>();
        String QUERY = "SELECT p.player_id,p.player_name,p.player_add,TIMESTAMPDIFF(YEAR,p.player_dob, NOW()) AS player_age,"
        		+ "p.player_lavel,p.player_phone,p.player_email,p.player_itarank,IF(p.gender = 1,'FEMALE','MALE') AS gender,"
        		+ "TIMESTAMPDIFF(YEAR,p.player_dob, NOW()) AS age,r.`player_points`,"
        		+ "r.`player_ranks` FROM players p INNER JOIN `playerranks` r ON p.`player_id` = r.`player_id` WHERE NOT EXISTS(SELECT 1 FROM `player_tournament` t "
        		+ "WHERE (t.player_id1 = p.`player_id` OR t.player_id2 = p.`player_id`) AND t.`tournament_id`="+tournamentId+" AND t.`category_id`="+categoryId+")"
        				+ " AND p.`gender` = (SELECT c.category_gender FROM category_master c WHERE c.category_id = "+categoryId+")";
        System.out.println(QUERY);
        try{
        	int catAge = jdbcTemplate.queryForObject("SELECT c.category_age FROM category_master c WHERE c.category_id = "+categoryId+"", Integer.class);
        	
        	List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY);
        	if(rows != null && rows.size()>0) {
				for (Map row : rows) {
					players bean = new players();
					if((row.get("player_age")!=null?Integer.parseInt(row.get("player_age").toString()):-1) <=  catAge){
					bean.setPlayer_id(row.get("player_id")!=null?Integer.parseInt(row.get("player_id").toString()):-1);
					bean.setPlayer_name(row.get("player_name")!=null?row.get("player_name").toString():"");
					bean.setPlayer_add(row.get("player_add")!=null?row.get("player_add").toString():"");
					bean.setPlayer_age(row.get("player_age")!=null?Integer.parseInt(row.get("player_age").toString()):-1);
					bean.setPlayer_lavel(row.get("player_lavel")!=null?row.get("player_lavel").toString():"");
					bean.setPlayer_phone(row.get("player_phone")!=null?row.get("player_phone").toString():"");
					bean.setPlayer_email(row.get("player_email")!=null?row.get("player_email").toString():"");
					bean.setPlayer_itarank(row.get("player_itarank")!=null?Integer.parseInt(row.get("player_itarank").toString()):-1);
					bean.setGender(row.get("gender")!=null?row.get("gender").toString():"");
					bean.setPlayer_points(row.get("player_points")!=null?Integer.parseInt(row.get("player_points").toString()):-1);
					bean.setPlayer_ranks(row.get("player_ranks")!=null?Integer.parseInt(row.get("player_ranks").toString()):-1);
					playerList.add(bean);
				}else if(catAge >= 17){
					bean.setPlayer_id(row.get("player_id")!=null?Integer.parseInt(row.get("player_id").toString()):-1);
					bean.setPlayer_name(row.get("player_name")!=null?row.get("player_name").toString():"");
					bean.setPlayer_add(row.get("player_add")!=null?row.get("player_add").toString():"");
					bean.setPlayer_age(row.get("player_age")!=null?Integer.parseInt(row.get("player_age").toString()):-1);
					bean.setPlayer_lavel(row.get("player_lavel")!=null?row.get("player_lavel").toString():"");
					bean.setPlayer_phone(row.get("player_phone")!=null?row.get("player_phone").toString():"");
					bean.setPlayer_email(row.get("player_email")!=null?row.get("player_email").toString():"");
					bean.setPlayer_itarank(row.get("player_itarank")!=null?Integer.parseInt(row.get("player_itarank").toString()):-1);
					bean.setGender(row.get("gender")!=null?row.get("gender").toString():"");
					bean.setPlayer_points(row.get("player_points")!=null?Integer.parseInt(row.get("player_points").toString()):-1);
					bean.setPlayer_ranks(row.get("player_ranks")!=null?Integer.parseInt(row.get("player_ranks").toString()):-1);
					playerList.add(bean);
				}else{}
					
				}
			}
        }catch(Exception e){
        	e.printStackTrace();
        	return playerList;
        }
		
		return playerList;
	}
	/**
	 * This method is used to player login
	 * */
	@Override
	public PlayerUserBO playerLogin(LoginBean loginBean) {
		PlayerUserBO player = null;
		try{
			List<Map<String, Object>> rows = jdbcTemplate.queryForList("SELECT `player_id`,`player_name`,`player_phone`,TIMESTAMPDIFF(YEAR,player_dob, NOW()) AS player_age,`player_pwd` FROM `players` WHERE player_phone=? AND player_pwd=?", new Object[]{loginBean.getUserId(),loginBean.getPassword()});
			if(rows != null && rows.size()>0) {
				for (Map row : rows) {
					player = new PlayerUserBO();
					player.setPlayerId(row.get("player_id")!=null?Integer.parseInt(row.get("player_id").toString()):-1);
					player.setName(row.get("player_name")!=null?row.get("player_name").toString():"");
					player.setPhone(row.get("player_phone")!=null?row.get("player_phone").toString():"");
					player.setAge(row.get("player_age")!=null?Integer.parseInt(row.get("player_age").toString()):-1);
					player.setPassword(row.get("player_pwd")!=null?row.get("player_pwd").toString():"");
					return player;
				}
			}else return null;
    	}catch(Exception e){
    		e.printStackTrace();
    		return null;
    	}finally{
    		//session.close();
    	}
		return player;
	}

	/**
	 * This method is used to get Player or Organiser profile
	 * */
	@Override
	public players getProfile(int id,int loginType) {
		players player = new players();
	String QUERY = "SELECT `player_id`,`player_name`,`player_phone`,player_email,player_add,TIMESTAMPDIFF(YEAR,player_dob, NOW()) AS player_age,`player_pwd`,`player_itarank`,IF(gender = 1,'Female','Male') AS gender FROM `players` WHERE `player_id`="+id+"";
	try{
		if(loginType == 0){
		List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY);
		if(rows != null && rows.size()>0) {
			for (Map row : rows) {
				player.setPlayer_name(row.get("player_name")!=null?row.get("player_name").toString():"");
				player.setGender(row.get("gender")!=null?row.get("gender").toString():"");
				player.setPlayer_phone(row.get("player_phone")!=null?row.get("player_phone").toString():"");
				player.setPlayer_email(row.get("player_email")!=null?row.get("player_email").toString():"");
				player.setPlayer_add(row.get("player_add")!=null?row.get("player_add").toString():"");
				player.setPlayer_age(row.get("player_age")!=null?Integer.parseInt(row.get("player_age").toString()):0);
				player.setPlayer_itarank(row.get("player_itarank")!=null?Integer.parseInt(row.get("player_itarank").toString()):-1);
				return player;
			}
		}
		}else{
			List<Map<String, Object>> rows = jdbcTemplate.queryForList("SELECT org_name,org_phone,org_mailid,org_add FROM `organizer` WHERE org_id = "+id+"");
			if(rows != null && rows.size()>0) {
				for (Map row : rows) {
					player.setPlayer_name(row.get("org_name")!=null?row.get("org_name").toString():"");
					player.setPlayer_phone(row.get("org_phone")!=null?row.get("org_phone").toString():"");
					player.setPlayer_email(row.get("org_mailid")!=null?row.get("org_mailid").toString():"");
					player.setPlayer_add(row.get("org_add")!=null?row.get("org_add").toString():"");
					return player;
				}
			}
		}
	}catch(Exception e){
		e.printStackTrace();
		return player;
	}
	return player;
	}
	/**
	 * This method is used to reset player password
	 * */
	@Override
	public String changePlayerPassword(int id, String pwd) {
		String result = null;
		 try{
	    		int row = jdbcTemplate.update("UPDATE players SET player_pwd = ?,player_repwd = ? WHERE player_id = ?", new Object[]{pwd, pwd, id});
	    		if(row >0) {
	    			result = "Password updated successfully";
	    		}
	    	}catch(Exception e){
	    		result = "Something went wrong";
	    	}finally{
	    		//session.close();
	    	}
		 return result;
	}
	/**
	 * This method is used to upload (.xlsx or .csv) player list data at app level
	 * */
	@Override
	public String uploadBulkData(List<PlayersBean> playerList) {
		String result1="File uploaded successfully!";
		String result2="";
		String QUERY="INSERT INTO `players` (player_name,player_add,player_lavel,"
				+ "player_phone,player_email,player_itaid,player_itarank,player_pwd,player_repwd,gender,player_dob) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
		
		String QUERY2 = "INSERT INTO `playerranks` (player_id,player_points,player_ranks) VALUES(LAST_INSERT_ID(),?,?)";
		
      for(PlayersBean playersBean: playerList){
    	  try{
  			int size = jdbcTemplate.queryForObject("SELECT COUNT(player_phone) FROM players WHERE `player_phone`='"+playersBean.getPhone()+"'",Integer.class);
      		if(size <= 0){
  			int val = jdbcTemplate.update(QUERY, new Object[]{playersBean.getName(),playersBean.getAddress(),playersBean.getLavel()
      				,playersBean.getPhone(),playersBean.getEmail(),playersBean.getItaId(),playersBean.getItaRank(),"tennis","tennis",playersBean.getGender(),playersBean.getDateOfBirth()});
  			jdbcTemplate.update(QUERY2, new Object[]{playersBean.getPoints(),playersBean.getRank()});
      		/*if(val >0)
      			result = "Player Registered Successfully";
      		else
      			result = "fail";*/
      		}else{
      			result2 += playersBean.getPhone()+", ";
      		}
      			
      	}catch(Exception e){
      		e.printStackTrace();
      		log.error("Exception In PlayersDaoImpl addPlayer() :: "+e);
      		return "Something went wrong!";
      	}
    	  
      }
      if(result2 != "")
    	  return "These mob. numbers ("+result2+") Already exist.";
      else
    	  return result1;
	}
   /**
    * This method is used to check player mobile is exist or not.
    * */
	@Override
	public boolean isMobileExist(String mobile) {
		try{
			List<Map<String, Object>> rows = jdbcTemplate.queryForList("SELECT `player_phone` FROM `players` WHERE player_phone=?", new Object[]{mobile});
    	    if(rows !=null && rows.size()>0)
		     return true;
    	    else 
    	    	return false;
		}catch(Exception e){
    		e.printStackTrace();
    		return false;
    	}
	}

	/**
	 * This method is used to download all player list data from players db table
	 * */
	@Override
	public Map<String, Object[]> downloadPlayersListWithDetails() {
	log.info("PlayersDaoImpl :: downloadPlayersListWithDetails()");
	String QUERY = "SELECT p.`player_name`,p.`player_add`,p.`player_phone`,p.`player_email`, IF(p.`gender` = 0, 'MALE', 'FEMALE') AS gender,DATE_FORMAT(p.player_dob, '%d-%b-%Y') AS player_dob FROM players p";
	Map<String, Object[]> playerinfo = new TreeMap < String, Object[] >();
	int index = 1;
	playerinfo.put(String.valueOf(index), new Object[] {"PLAYER NAME", "PLAYER GENDER", "PLAYER DOB", "PLAYER EMAIL", "PLAYER PHONE", "PLAYER ADD"});
	try{
		List<Map<String,Object>> rows = jdbcTemplate.queryForList(QUERY);
			if (rows != null && rows.size() > 0) {
				for (Map row : rows) {
					index++;
					playerinfo.put(String.valueOf(index), new Object[] {
					row.get("player_name")!=null?row.get("player_name").toString():"",
					row.get("gender")!=null?row.get("gender").toString():"",
					row.get("player_dob")!=null?row.get("player_dob").toString():"",				
					row.get("player_email")!=null?row.get("player_email").toString():"",
					row.get("player_phone")!=null?row.get("player_phone").toString():"",		
					row.get("player_add")!=null?row.get("player_add").toString():""		
					});
				}
			}
		
	}catch(Exception e){
		log.error("PlayersDaoImpl :: downloadPlayersListWithDetails() "+e);
		return playerinfo;
	}
		return playerinfo;
	}
/**
 * This method is used to get All ranking categories
 * */
	@Override
	public List<RankCategoryBean> getAllRankCategories() {
		log.info("PlayersDaoImpl ::: getAllRankCategories()");
		String QUERY = "SELECT rank_id,rank_name FROM rank_category ORDER BY rank_id ASC";
		List<RankCategoryBean> rankList = new ArrayList<RankCategoryBean>();
		try{
			List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY);
			if(rows !=null && rows.size() > 0){
				for(Map row : rows){
					RankCategoryBean bean = new RankCategoryBean();
					bean.setRankId(row.get("rank_id")!=null?Long.parseLong(row.get("rank_id").toString()):0);
					bean.setRankName(row.get("rank_name")!=null?row.get("rank_name").toString():"");
					rankList.add(bean);
				}
			}
		}catch(Exception e){
			log.error("Error in PlayersDaoImpl ::: getAllRankCategories() "+e);
			return rankList;
		}
		return rankList;
	}

}
