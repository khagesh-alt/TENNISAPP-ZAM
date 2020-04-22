package com.zambient.tennis.dao;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.zambient.tennis.bean.ActiveTournamentBean;
import com.zambient.tennis.bean.CourtBean;
import com.zambient.tennis.bean.EmailTemplateBean;
import com.zambient.tennis.bean.FetchVenues;
import com.zambient.tennis.bean.LoginBean;
import com.zambient.tennis.bean.OrganiserBean;
import com.zambient.tennis.bean.OrganizerRegistartion;
import com.zambient.tennis.bean.PlayerUserBO;
import com.zambient.tennis.bean.PlayersBean;
import com.zambient.tennis.bean.ResetPasswordBean;
import com.zambient.tennis.bean.TournamentCategoryBean;
import com.zambient.tennis.bean.VenueAndCourtBean;
import com.zambient.tennis.bean.VenueBean;

@PropertySource("classpath:/com/zambient/tennis/resources/tennisapp.properties")
@Repository("venueDao")
public class VenueDaoImpl implements VenueDao{
	final static Logger log = Logger.getLogger(VenueDaoImpl.class);
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public String addVenue(VenueBean venueBean) {
		log.info("VenuwDaoImpl :: addVenue method");
		log.info("venueBean ::"+venueBean);
		String QUERY="INSERT INTO `venues` (venue_name,venue_location,no_of_courts,contact_mob,contact_email,sport_type,venue_light) VALUES(?,?,?,?,?,?,?)";
		String result=null;
		try{
			List<Map<String, Object>> isExist = jdbcTemplate.queryForList("SELECT contact_mob FROM venues WHERE contact_mob=?",new Object[]{venueBean.getContact_mob()});
			System.out.println("isExist :: "+isExist.size());
			if(isExist != null && isExist.size() > 0)
				return "Already mobile no. exist";
			
    		int val = jdbcTemplate.update(QUERY, new Object[]{venueBean.getVenue_name(),venueBean.getVenue_location(),venueBean.getNo_of_courts(),
    				venueBean.getContact_mob(),venueBean.getContact_email(),venueBean.getSport_type(),venueBean.getVenue_light()});
    		if(val >0){
    			int lastInsertedValue = jdbcTemplate.queryForObject("SELECT `venue_id` FROM `venues` ORDER BY venue_id DESC  LIMIT 1", Integer.class);
    			result = addCourt(lastInsertedValue,venueBean.getNo_of_courts());
    		}
    			
    		else
    			result = "fail";
    	}catch(Exception e){
    		result="Some thing went wrong";
    		e.printStackTrace();
    		log.error("Exception In VenuwDaoImpl addVenue() :: "+e);
    	}
		return result;
	}

	private String  addCourt(int lastInsertedValue, Integer no_of_courts) {
		String QUERY="INSERT INTO `courts` (venue_id,court_name) VALUES(?,?)";
		String result=null;int val=0;
		try{
			for(int i = 1; i <= no_of_courts; ++i){
			    val = jdbcTemplate.update(QUERY, new Object[]{lastInsertedValue,"Court"+i});
				
			}
    		if(val >0)
    			result = "Success";
    		else
    			result = "fail";
    	}catch(Exception e){
    		result="Some thing went wrong";
    		e.printStackTrace();
    		log.error("Exception In VenuwDaoImpl addCourt() :: "+e);
    	}
		return result;
	}

	@Override
	public String addCourt(JSONObject addCourtJson) {
		log.info("VenuwDaoImpl :: addCourt method");
		String QUERY="INSERT INTO `courts` (venue_id,court_name) VALUES(?,?)";
		String result=null;int val=0;
		try{
			for(int i = 0; i < addCourtJson.getJSONArray("courts").length(); ++i){
				JSONObject rec = addCourtJson.getJSONArray("courts").getJSONObject(i);
			    val = jdbcTemplate.update(QUERY, new Object[]{addCourtJson.getInt("venueId"),rec.getString("court_name")});
				
			}
    		if(val >0)
    			result = "Success";
    		else
    			result = "fail";
    	}catch(Exception e){
    		result="Some thing went wrong";
    		e.printStackTrace();
    		log.error("Exception In VenuwDaoImpl addCourt() :: "+e);
    	}
		return result;
	}
	@Override
	public List<FetchVenues> getVenues() {
		List<FetchVenues> venueList = new ArrayList<FetchVenues>();
		String QUERY = "SELECT `venue_id`,`venue_name`,`venue_location`,`no_of_courts`,contact_mob,contact_email,sport_type,venue_light FROM `venues` ORDER BY venue_id DESC";
		 try{
			 //venueList = jdbcTemplate.query(QUERY,new BeanPropertyRowMapper<FetchVenues>(FetchVenues.class));
			 List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY);
			 if(rows != null && rows.size()>0) {
					for(Map row : rows){
						FetchVenues bean = new FetchVenues();
						bean.setVenueId(row.get("venue_id")!=null?Integer.parseInt(row.get("venue_id").toString()):0);
						bean.setVenueName(row.get("venue_name")!=null?row.get("venue_name").toString():"");
						bean.setVenueLocation(row.get("venue_location")!=null?row.get("venue_location").toString():"");
						bean.setNoOfCourts(row.get("no_of_courts")!=null?Integer.parseInt(row.get("no_of_courts").toString()):0);
						bean.setContactMob(row.get("contact_mob")!=null?row.get("contact_mob").toString():"");
						bean.setContactEmail(row.get("contact_email")!=null?row.get("contact_email").toString():"");
						bean.setSportType(row.get("sport_type")!=null?row.get("sport_type").toString():"");
						bean.setVenuelight(row.get("venue_light")!=null?Integer.parseInt(row.get("venue_light").toString()):1);
						venueList.add(bean);
					}
			 }
	        }catch(Exception e){
	        	e.printStackTrace();
	        	return venueList;
	        }
		return venueList;
	}

	@Override
	public List<VenueAndCourtBean> getVenueAndCourtDetails() {
		List<VenueAndCourtBean> listData = new ArrayList<VenueAndCourtBean>();
		String QUERY = "SELECT v.`venue_id`,v.`venue_name`,v.`venue_location`,v.`no_of_courts`,contact_mob,contact_email,venue_light FROM venues v";
		try{
			List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY);
			if(rows != null && rows.size()>0) {
				for(Map row : rows){
					VenueAndCourtBean bean = new VenueAndCourtBean();
					bean.setVenueId(row.get("venue_id")!=null?Integer.parseInt(row.get("venue_id").toString()):0);
					bean.setVenueName(row.get("venue_name")!=null?row.get("venue_name").toString():"");
					bean.setVenueLocation(row.get("venue_location")!=null?row.get("venue_location").toString():"");
					bean.setNoOfCourts(row.get("no_of_courts")!=null?Integer.parseInt(row.get("no_of_courts").toString()):0);
					bean.setEmail(row.get("contact_email")!=null?row.get("contact_email").toString():"");
					bean.setMobile(row.get("contact_mob")!=null?row.get("contact_mob").toString():"");
					bean.setLight(row.get("venue_light")!=null?Integer.parseInt(row.get("venue_light").toString()):1);
					bean.setCourts(jdbcTemplate.query("SELECT c.`court_id`,c.`court_name` FROM courts c WHERE c.`venue_id`="+(row.get("venue_id")!=null?Integer.parseInt(row.get("venue_id").toString()):0)+"",new BeanPropertyRowMapper<CourtBean>(CourtBean.class)));
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
	public String organizerRegistration(OrganizerRegistartion organizerRegistartion) {
		String QUERY = "INSERT INTO `organizer` (org_name,org_add,org_phone,org_mailid,org_password,org_repassword) VALUES(?,?,?,?,?,?)";

		log.info("VenueDaoImpl :: organizerRegistration method");
		log.info("OrganizerRegistartion ::"+organizerRegistartion);
		String result=null;
		try{
			int size = jdbcTemplate.queryForObject("SELECT COUNT(org_phone) FROM organizer WHERE `org_phone`='"+organizerRegistartion.getPhone()+"'",Integer.class);
    		if(size <= 0){
			int val = jdbcTemplate.update(QUERY, new Object[]{organizerRegistartion.getName(),organizerRegistartion.getAddress(),organizerRegistartion.getPhone(),organizerRegistartion.getMailId(),organizerRegistartion.getPassword(),organizerRegistartion.getRepassword()});
    		if(val >0)
    			result = "Success";
    		else
    			result = "failure";
    		}else{
    			result = "Organizer Already Registered";
    		}
    			
    	}catch(Exception e){
    		result="All Fields Are Mandatory";
    		e.printStackTrace();
    		log.error("Exception In VanueDaoImpl organizerRegistartion() :: "+e);
    	}
		return result;
	}

	@Override
	public OrganiserBean organizerLogin(LoginBean loginBean) {
		OrganiserBean bean = null;
		try{
			List<Map<String, Object>> rows = jdbcTemplate.queryForList("SELECT org_id,org_name,org_add,org_phone,org_mailid FROM organizer WHERE `org_phone`=? AND `org_password` = ?", new Object[]{loginBean.getUserId(),loginBean.getPassword()});
			if(rows != null && rows.size()>0) {
				for (Map row : rows) {
					bean = new OrganiserBean();
					bean.setId(row.get("org_id")!=null?Long.parseLong(row.get("org_id").toString()):-1);
					bean.setName(row.get("org_name")!=null?row.get("org_name").toString():"");
					bean.setAddress(row.get("org_add")!=null?row.get("org_add").toString():"");
					bean.setPhone(row.get("org_phone")!=null?row.get("org_phone").toString():"");
					bean.setMailId(row.get("org_mailid")!=null?row.get("org_mailid").toString():"");
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error("Exception In VenueDaoImpl organizerLogin() :: "+e);
			return bean;
		}
		return bean;
	}

	@Override
	public List<OrganizerRegistartion> getOrganiserList() {
		List<OrganizerRegistartion> orgList = new ArrayList<OrganizerRegistartion>();
		String QUERY = "SELECT org_id,`org_name`,`org_add`,`org_phone`,`org_mailid` FROM `organizer` ORDER BY org_id DESC";
		 try{
			 List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY);
				if(rows != null && rows.size()>0) {
					for(Map row : rows){
						OrganizerRegistartion bean = new OrganizerRegistartion();
						bean.setOrgId(row.get("org_id")!=null?Integer.parseInt(row.get("org_id").toString()):-1);
						bean.setName(row.get("org_name")!=null?row.get("org_name").toString():"");
						bean.setAddress(row.get("org_add")!=null?row.get("org_add").toString():"");
						bean.setPhone(row.get("org_phone")!=null?row.get("org_phone").toString():"");
						bean.setMailId(row.get("org_mailid")!=null?row.get("org_mailid").toString():"");
						orgList.add(bean);
					}
				}
	        }catch(Exception e){
	        	e.printStackTrace();
	        	return orgList;
	        }
		return orgList;
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
	public String authenticateAdmin() {
		log.info("VenueDaoImpl.authenticateAdmin");
		String result="";
		try{
			List<Map<String, Object>> rows = jdbcTemplate.queryForList("SELECT user_id FROM admin");
			if(rows != null && rows.size()>0) {
				for(Map row : rows){
					result=row.get("user_id").toString();
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public String changeOrganisePassword(int orgId, String pwd) {
		String result = null;
		 try{
	    		int row = jdbcTemplate.update("UPDATE organizer SET org_password = ?,org_repassword = ? WHERE org_id = ?", new Object[]{pwd, pwd, orgId});
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

	@Override
	public String editOrganiserByID(OrganizerRegistartion organizerRegistartion) {
		String result = null;
		String QUERY = "UPDATE organizer SET org_name = ?, org_add = ?,org_mailid = ? WHERE org_id=?";
		 try{
	    		int row = jdbcTemplate.update(QUERY, new Object[]{organizerRegistartion.getName(), organizerRegistartion.getAddress(), organizerRegistartion.getMailId(),organizerRegistartion.getOrgId()});
	    		if(row >0) {
	    			result = "Organiser updated successfully";
	    		}
	    	}catch(Exception e){
	    		result = "Something went wrong";
	    	}finally{
	    		//session.close();
	    	}
		 return result;
	}

	@Override
	public String editAcademyByID(FetchVenues venueBean) {
		String result = null;
		String QUERY = "UPDATE venues SET venue_name = ?, venue_location = ?,contact_mob = ?,contact_email = ? WHERE venue_id=?";
		 try{
	    		int row = jdbcTemplate.update(QUERY, new Object[]{venueBean.getVenueName(),venueBean.getVenueLocation(),venueBean.getContactMob(),venueBean.getContactEmail(),venueBean.getVenueId()});
	    		if(row >0) {
	    			result = "Academy updated successfully...";
	    		}
	    	}catch(Exception e){
	    		result = "Something went wrong...";
	    	}finally{
	    		//session.close();
	    	}
		 return result;
	}

	@Override
	public List<ActiveTournamentBean> activeORInActiveTournaments() {
		List<ActiveTournamentBean> listData = new ArrayList<ActiveTournamentBean>();
		String QUERY = "SELECT t.`tournament_title`,t.`tournament_id`,t.`active`,t.`organizer_name`,DATEDIFF(t.`tournament_enddate`,NOW()) AS DiffDate FROM tournament t ORDER BY t.orgaizer_id";
		try{
			List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY);
			if(rows != null && rows.size()>0) {
				for(Map row : rows){
					ActiveTournamentBean bean = new ActiveTournamentBean();
					bean.setTitle(row.get("tournament_title")!=null?row.get("tournament_title").toString():"");
					bean.setOrgName(row.get("organizer_name")!=null?row.get("organizer_name").toString():"");
					bean.setTournamentid(row.get("tournament_id")!=null?Long.parseLong(row.get("tournament_id").toString()):0);
					int date = row.get("DiffDate")!=null?Integer.parseInt(row.get("DiffDate").toString()):0;
					if(date > 0)
						bean.setStatus("In Complete");
					else
						bean.setStatus("Complete");
					
					int active = row.get("active")!=null?Integer.parseInt(row.get("active").toString()):0;
					if(active == 1){
						bean.setActive(true);
					}
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
	public String setActiveOrInActive(int tournamentId, int activeVal) {
		String result = null;
		String QUERY="UPDATE `tournament` SET `active` = ? WHERE tournament_id = ?";
		try{
    		int row = jdbcTemplate.update(QUERY, new Object[]{activeVal,tournamentId});
    		if(row >0) {
    			result = "Tournament updated successfully";
    		}
    	}catch(Exception e){
    		result = "Something went wrong";
    	}
	 return result;
	}

	@Override
	public String persistAcademyByOrganiser(VenueBean bean) {
      String result = addVenue(bean);
       if(result.equals("Success")){
    	   VenueAndCourtBean venueAndCourtBean = new VenueAndCourtBean();
    	   try{
   			List<Map<String, Object>> rows = jdbcTemplate.queryForList("SELECT v.`venue_id`,v.`venue_name`,v.`venue_location`,v.`no_of_courts`,v.contact_email,v.contact_mob FROM venues v ORDER BY v.`venue_id` DESC LIMIT 1");
   			if(rows != null && rows.size()>0) {
   				for(Map row : rows){
   					venueAndCourtBean.setVenueId(row.get("venue_id")!=null?Integer.parseInt(row.get("venue_id").toString()):0);
   					venueAndCourtBean.setVenueName(row.get("venue_name")!=null?row.get("venue_name").toString():"");
   					venueAndCourtBean.setVenueLocation(row.get("venue_location")!=null?row.get("venue_location").toString():"");
   					venueAndCourtBean.setNoOfCourts(row.get("no_of_courts")!=null?Integer.parseInt(row.get("no_of_courts").toString()):0);
   					venueAndCourtBean.setMobile(row.get("contact_mob")!=null?row.get("contact_mob").toString():"");
   					venueAndCourtBean.setEmail(row.get("contact_email")!=null?row.get("contact_email").toString():"");
   					venueAndCourtBean.setCourts(jdbcTemplate.query("SELECT c.`court_id`,c.`court_name` FROM courts c WHERE c.`venue_id`="+(row.get("venue_id")!=null?Integer.parseInt(row.get("venue_id").toString()):0)+"",new BeanPropertyRowMapper<CourtBean>(CourtBean.class)));
   				}
   			}
   			return new ObjectMapper().writeValueAsString(venueAndCourtBean);
   	        }catch(Exception e){
   	        	e.printStackTrace();
   	        	return "Failed";
   	        }
       }else{
    	   return "Failed";
       }
	}

	@Override
	public List<TournamentCategoryBean> allCategoryListForATournament(int tournamentId) {
		String QUERY = "SELECT c.`category_id`,(SELECT i.`category_name` FROM `category_master` i WHERE i.`category_id` = c.`category_id`) AS categoryName,"
				+ "(SELECT i.`category_desc` FROM `category_master` i WHERE i.`category_id` = c.`category_id`) AS singleordouble,"
				+ "c.`prize_money`,c.`tournament_fee` FROM `tournament_category` c WHERE c.`tournament_id` =?";
		List<TournamentCategoryBean> listBean = new ArrayList<TournamentCategoryBean>();
		try{
			List<Map<String, Object>> rows = jdbcTemplate.queryForList(QUERY, new Object[]{tournamentId});
			if(rows !=null && rows.size() > 0){
				for(Map row : rows){
					TournamentCategoryBean bean = new TournamentCategoryBean();
					bean.setMatchType(row.get("singleordouble")!=null?Long.parseLong(row.get("singleordouble").toString()):-1);
					bean.setCategoryName(row.get("categoryName")!=null?row.get("categoryName").toString():"");
					bean.setCategoryId(row.get("category_id")!=null?Integer.parseInt(row.get("category_id").toString()):-1);
					bean.setPrizeMoney(row.get("prize_money")!=null?Integer.parseInt(row.get("prize_money").toString()):0);
					bean.setTournamentFee(row.get("tournament_fee")!=null?Integer.parseInt(row.get("tournament_fee").toString()):0);
					bean.setPlayerList(getPlayers(tournamentId,row.get("category_id")!=null?Integer.parseInt(row.get("category_id").toString()):-1));
					listBean.add(bean);
				}
			}
		
		}catch(Exception e){
			e.printStackTrace();
			return listBean;
		}
		return listBean;
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
	public OrganiserBean authenticateUser(String mobile) {
		OrganiserBean bean = new OrganiserBean();
		 try{
	   			List<Map<String, Object>> rows = jdbcTemplate.queryForList("SELECT org_name,org_add,org_phone,org_mailid FROM organizer WHERE org_phone = ?",new Object[]{mobile});
	   			if(rows != null && rows.size()>0) {
	   				for(Map row : rows){
	   					bean.setName(row.get("org_name")!=null?row.get("org_name").toString():"");
	   					bean.setAddress(row.get("org_add")!=null?row.get("org_add").toString():"");
	   					bean.setPhone(row.get("org_phone")!=null?row.get("org_phone").toString():"");
	   					bean.setMailId(row.get("org_mailid")!=null?row.get("org_mailid").toString():"");
	   				}
	   			}
	   	        }catch(Exception e){
	   	        	e.printStackTrace();
	   	        	return bean;
	   	        }
		return bean;
	}

	@Override
	public void logResetPassword(String email, String token,String phone, int logintype) {
	   	 try{
			 		int row = jdbcTemplate.update("INSERT INTO reset_password(email, token, mobile, loginType) VALUES (?,?,?,?)", new Object[]{email, token, phone, logintype});
		 		if(row >0) 
		 			System.out.println("record inserted successfully==========>"+row);
	   	 	}catch(Exception e){
	   	 		e.printStackTrace();
	   	 	}
	    }

	@SuppressWarnings("rawtypes")
	public ResetPasswordBean validateToken(String token, int logintype){
		ResetPasswordBean resetbean = null;
		try{
			List<Map<String, Object>> rows = jdbcTemplate.queryForList("SELECT id,email,token,mobile from reset_password WHERE token=? AND loginType=?", new Object[]{token, logintype});
	 		if(rows != null && rows.size()>0) {
				for (Map row : rows) {
					resetbean = new ResetPasswordBean();
					resetbean.setId(Long.parseLong(row.get("id").toString()));
					resetbean.setEmail(row.get("email").toString());
					resetbean.setToken(row.get("token").toString());
					resetbean.setMobile(row.get("mobile").toString());
	    		   }
	    		   log.info("validateToken query completed");
			}
	 		return resetbean;
	 	}catch(Exception e){
	 		e.printStackTrace();
	 		return resetbean;
	 	}
	}

	@Override
	public void resetPassword(String mobile, String password, int logintype) {
		try{
	 		int row = jdbcTemplate.update("UPDATE organizer set org_password=?, org_repassword=? WHERE org_phone=?", new Object[]{password,password, mobile});
	 		jdbcTemplate.update("DELETE FROM reset_password WHERE mobile=? AND loginType=?", new Object[]{mobile, logintype});
 		
	 		if(row >0) System.out.println("password updated successfully==========>"+row);
	 	}catch(Exception e){
	 		e.printStackTrace();
	 	}
	}

	@Override
	public OrganiserBean authenticatePlayerUser(String mobile) {
		OrganiserBean bean = new OrganiserBean();
		 try{
	   			List<Map<String, Object>> rows = jdbcTemplate.queryForList("SELECT player_name,player_add,player_phone,player_email FROM players WHERE player_phone = ?",new Object[]{mobile});
	   			if(rows != null && rows.size()>0) {
	   				for(Map row : rows){
	   					bean.setName(row.get("player_name")!=null?row.get("player_name").toString():"");
	   					bean.setAddress(row.get("player_add")!=null?row.get("player_add").toString():"");
	   					bean.setPhone(row.get("player_phone")!=null?row.get("player_phone").toString():"");
	   					bean.setMailId(row.get("player_email")!=null?row.get("player_email").toString():"");
	   				}
	   			}
	   	        }catch(Exception e){
	   	        	e.printStackTrace();
	   	        	return bean;
	   	        }
		return bean;
	}

	@Override
	public void resetPlayerPassword(String mobile, String password, int logintype) {
		try{
	 		int row = jdbcTemplate.update("UPDATE players set player_pwd=?, player_repwd=? WHERE player_phone=?", new Object[]{password,password, mobile});
	 		jdbcTemplate.update("DELETE FROM reset_password WHERE mobile=? AND loginType=?", new Object[]{mobile, logintype});
 		
	 		if(row >0) System.out.println("password updated successfully==========>"+row);
	 	}catch(Exception e){
	 		e.printStackTrace();
	 	}
	}

	@Override
	public boolean isOrganiserMobileExist(String mobile) {
		try{
			List<Map<String, Object>> rows = jdbcTemplate.queryForList("SELECT org_phone FROM organizer WHERE org_phone=?", new Object[]{mobile});
    	    if(rows !=null && rows.size()>0)
		     return true;
    	    else 
    	    	return false;
		}catch(Exception e){
    		e.printStackTrace();
    		return false;
    	}
	}
}
