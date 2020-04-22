package com.zambient.tennis.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.zambient.tennis.bean.BuildSchedule;
import com.zambient.tennis.bean.CategoryMasterBean;
import com.zambient.tennis.bean.EmailTemplateBean;
import com.zambient.tennis.bean.EnalbleButtonBean;
import com.zambient.tennis.bean.ExtendsBean;
import com.zambient.tennis.bean.FinalDrwasBean;
import com.zambient.tennis.bean.MatchRoundBean;
import com.zambient.tennis.bean.MatchTournamentBean;
import com.zambient.tennis.bean.MatchTournamentCategoryBean;
import com.zambient.tennis.bean.PaymentBean;
import com.zambient.tennis.bean.PlayersBean;
import com.zambient.tennis.bean.PlayesrListAndPublishPlayer;
import com.zambient.tennis.bean.RoundBean;
import com.zambient.tennis.bean.RoundListWithMatchs;
import com.zambient.tennis.bean.ScheduleInnerBean;
import com.zambient.tennis.bean.TournamentLavelScheduleBean;
import com.zambient.tennis.bean.TournamentList;
import com.zambient.tennis.bean.UpdateMatchScore;
import com.zambient.tennis.service.TournamentService;
import com.zambient.tennis.util.CommonUtil;
import com.zambient.tennis.util.TennisMail;
import com.zambient.tennis.util.UserSession;
/**
*
* @author  Khagesh Patel
* @version 1.0
* @since   2019-04-15 
*/
@RestController
public class TournamentController {
final static Logger log = Logger.getLogger(TournamentController.class);
    @Autowired
    TennisMail tennisMail;
	@Autowired 
	private UserSession userSession;
	@Autowired
	TournamentService tournamentService;
	
	@Value("${mail.from.username}")
	private String mailFromUsername;

	@Value("${mail.from.bccusername}")
	private String mailFromBccUsername;
	
	@Value("${images.root.path}")
	private String imageRootPath;
	@Value("${images.retrival.path}")
	private String imagesRetrivalPath;
	
	/**
	 * This method is used to get all tournament categories
	 * */
	@RequestMapping(value = "/getTournamentCategories", method = RequestMethod.GET)
	public @ResponseBody List<CategoryMasterBean> getTournamentCategories() {
		log.info("TournamentController.getTournamentCategories()");
		List<CategoryMasterBean> tournamentCategoryList = tournamentService.getTournamentCategories();
	    return tournamentCategoryList;
	}
	/**
	 * This method is used to post or create tournament and save banner image in drive.
	 * */
	@RequestMapping(value = "/buildTournament", method = RequestMethod.POST)
	 public int  buildTournament(HttpServletRequest request,HttpServletResponse response,@RequestParam("otherFields") String otherFields,
			 @RequestParam(value = "bannerImage", required = false) MultipartFile bannerImage) throws JSONException{
		log.info("TournamentController :: buildTournament POST method"+otherFields);
		JSONObject addtournamentJson = new JSONObject(otherFields);
		int result;
		if(bannerImage !=null && !bannerImage.isEmpty()){
			try {
				CommonUtil.validateImage(bannerImage);
				String fileName = new SimpleDateFormat("yyyyMMddhhmmss").format(new Date());
				CommonUtil.saveImage(fileName, bannerImage, request,imageRootPath);
				String imgType[] = bannerImage.getContentType().split("/");
				String imagePath = imagesRetrivalPath  + fileName + "." + imgType[1];
				result = tournamentService.buildTournament(addtournamentJson,imagePath);
			} catch (RuntimeException | IOException re) {
				log.info(re.getMessage(), re);
				  result = 0;
			}
		}else{
			result = tournamentService.buildTournament(addtournamentJson,"/images/TennisImages/tennis-banner.jpg");
		}
		 return result;
	 }
	/**
	 * This method is used to get created (upcoming) tournament with name, categories and registered players
	 * */
	@RequestMapping(value = "/playerView/getUpcommingTournament", method = RequestMethod.GET)
	public @ResponseBody List<TournamentList> getUpcommingTournament(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("application/json");
		response.setHeader("Access-Control-Allow-Origin","*");
		response.setHeader("value", "valid");
		List<TournamentList> tournamentList = null;
		 String pattern = "yyyy-MM-dd";
		String currentDate =new SimpleDateFormat(pattern).format(new Date());
		if(userSession.getPlayerId() != null)
		 tournamentList = tournamentService.upcommingTournament(userSession.getPlayerId(),currentDate);
		else
		 tournamentList = tournamentService.upcommingTournament(-1,currentDate);
	    return tournamentList;
	}
	
	 @RequestMapping("/registerPlayerForTournamentCategory")
	 public RedirectView  registerPlayerForTournamentCategory(HttpServletRequest request,RedirectAttributes attributes,@RequestParam("cardHolderName") String cardHolderName,
			 @RequestParam("cardNumber") String cardNumber,@RequestParam("cardType") String cardType,
			 @RequestParam("amount") String amount,@RequestParam("playerIdForReg") String playerIdForReg,@RequestParam("tournamentIdForReg") String tournamentIdForReg,
			 @RequestParam("categoryIdForReg") String categoryIdForReg,@RequestParam("matchTypeReg") String matchTypeReg){
		log.info("PlayersController :: addPlayer POST method");
		int secPlayerId=-1;
		if(Integer.parseInt(matchTypeReg) == 2)
			secPlayerId = Integer.parseInt(request.getParameter("secondPlayer"));
		System.out.println("secPlayerId>> "+secPlayerId);
		PaymentBean paymentBean = new PaymentBean();
		paymentBean.setAmount(Integer.parseInt(amount));
		paymentBean.setCardHolderName(cardHolderName);
		paymentBean.setCardNumber(cardNumber);
		paymentBean.setCardType(cardType);
		paymentBean.setCategoryId(Integer.parseInt(categoryIdForReg));
		paymentBean.setPlayerId(Integer.parseInt(playerIdForReg));
		paymentBean.setTournamentId(Integer.parseInt(tournamentIdForReg));
		paymentBean.setTransactionStatus("SUCCESS");
		String result =null;
		int paymentId = tournamentService.addPaymentForTournamentCategory(paymentBean);
		 if(paymentId >= 0)
			 result = tournamentService.registerPlayerForTournamentCategory(paymentBean,paymentId,secPlayerId);
		 attributes.addFlashAttribute("message", result);
		 return new RedirectView("upcomingtournament");
	 }
	 @RequestMapping("/registerPlayerForTournamentCategoryFromJs")
	 public String  registerPlayerForTournamentCategoryFromJs(HttpServletRequest request,RedirectAttributes attributes,@RequestParam("cardHolderName") String cardHolderName,
			 @RequestParam("cardNumber") String cardNumber,@RequestParam("cardType") String cardType,
			 @RequestParam("amount") String amount,@RequestParam("playerIdForReg") String playerIdForReg,@RequestParam("tournamentIdForReg") String tournamentIdForReg,
			 @RequestParam("categoryIdForReg") String categoryIdForReg,@RequestParam("matchTypeReg") String matchTypeReg){
		log.info("PlayersController :: addPlayer POST method");
		int secPlayerId=-1;
		if(Integer.parseInt(matchTypeReg) == 2)
			secPlayerId = Integer.parseInt(request.getParameter("secondPlayer"));
		System.out.println("secPlayerId>> "+secPlayerId);
		PaymentBean paymentBean = new PaymentBean();
		paymentBean.setAmount(Integer.parseInt(amount));
		paymentBean.setCardHolderName(cardHolderName);
		paymentBean.setCardNumber(cardNumber);
		paymentBean.setCardType(cardType);
		paymentBean.setCategoryId(Integer.parseInt(categoryIdForReg));
		paymentBean.setPlayerId(Integer.parseInt(playerIdForReg));
		paymentBean.setTournamentId(Integer.parseInt(tournamentIdForReg));
		paymentBean.setTransactionStatus("SUCCESS");
		System.out.println("paymentBean:: "+paymentBean);
		String result =null;
		int paymentId = tournamentService.addPaymentForTournamentCategory(paymentBean);
		 if(paymentId >= 0)
			 result = tournamentService.registerPlayerForTournamentCategory(paymentBean,paymentId,secPlayerId);
		 return result;
	 }
	 @RequestMapping(value = "playerView/buildCategoryDrwas", method = RequestMethod.GET)
	 public @ResponseBody FinalDrwasBean buildCategoryDrwas(HttpServletRequest request, HttpServletResponse response,
			 @RequestParam("tournamentId") int tournamentId, @RequestParam("categoryId") int categoryId,@RequestParam("tournamentStart") String tournamentStart) throws ParseException{
		 log.info("TournamentController :: buildCategoryDrwas GET method"+tournamentStart);
		 response.setContentType("application/json");
			response.setHeader("Access-Control-Allow-Origin","*");
			response.setHeader("value", "valid");
			FinalDrwasBean finalDrwasBean = new FinalDrwasBean();
		    List<RoundListWithMatchs> listData = null;
		    Date date1 = new Date();
	        Date date2 = new Date(tournamentStart);
	        if (date1.compareTo(date2) > 0) {
	        	finalDrwasBean.setMatchStarted(true);
	        }
		 if(tournamentId >=0 && categoryId >=0)
		 listData = tournamentService.buildCategoryDrwas(tournamentId, categoryId);
		 finalDrwasBean.setDrwasList(listData);
		 finalDrwasBean.setDrawsPublish(getDrawsPublishMethod(tournamentId, categoryId));
		return finalDrwasBean;
	 }
	 public boolean getDrawsPublishMethod(int tournamentId, int categoryId) {

		 return tournamentService.getDrawsPublishMethod(tournamentId, categoryId);
	}
	 @RequestMapping(value = "/playerView/isPlayerListPublish", method = RequestMethod.GET)
	 public @ResponseBody PlayesrListAndPublishPlayer isPlayerListPublish(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("tournamentId") int tournamentId, @RequestParam("categoryId") int categoryId) {

		PlayesrListAndPublishPlayer result = tournamentService.isPlayerListPublish(tournamentId, categoryId);
System.out.println("Result:: "+result);
		return result;

	}
	/*@RequestMapping(value = "/getMyTournaments", method = RequestMethod.GET)
	 public @ResponseBody List<MyTournaments> getMyTournaments(){
		 log.info("TournamentController :: getMyTournaments GET method");
		 System.out.println("userSession.getOrganiserId()"+userSession.getOrganiserId());
		 List<MyTournaments> listData =  tournamentService.getMyTournaments(userSession.getOrganiserId());
		return listData;
	 }*/
	 @RequestMapping(value = "/addPlayerByOrganizer", method = RequestMethod.POST)
	    public String addPlayerByOrganizer(HttpServletRequest request,RedirectAttributes attributes,
	    		@RequestParam("playerName") String playerName,@RequestParam("playerPhone") String playerPhone,
	    		@RequestParam("playerEmail") String playerEmail,@RequestParam("playerAddress") String playerAddress,
	    		@RequestParam("dateOfBirth") String playerAge,@RequestParam("playerItaId") String playerItaId,
	    		@RequestParam("playerItaRank") String playerItaRank,@RequestParam("playerGender") String playerGender,
	    		@RequestParam("rankid") long rankid){
			log.info("TournamentController :: addPlayerByOrganizer POST method");
			PlayersBean playerBean = new PlayersBean();
			//System.out.println("playerItaRank>>"+playerItaRank+"length>> "+playerItaRank.length());
			
			playerBean.setAddress(playerAddress);
			playerBean.setDateOfBirth(playerAge);
			playerBean.setEmail(playerEmail);
			playerBean.setGender(Long.parseLong(playerGender));
			if(playerItaRank.length() > 0)
			playerBean.setItaRank(Long.parseLong(playerItaRank));
			if(playerItaId.length() > 0)
				playerBean.setItaId(Long.parseLong(playerItaId));
			playerBean.setName(playerName);
			playerBean.setPhone(playerPhone);
			playerBean.setLavel("High");
			playerBean.setRank(rankid);
			playerBean.setPoints((long)5);
			String result =null;
			result = tournamentService.addPlayerByOrganizer(playerBean);
			if(result.equals("Player Registered Successfully")){
				 EmailTemplateBean emailTemplateBean = tournamentService.retrieveEmailTemplate("PLAYER_REGISTRATION");
				 String body = emailTemplateBean.getBody();
		         body=body.replace("{{User}}",playerName);
		         body=body.replace("{{userId}}",playerPhone);
		         body=body.replace("{{password}}","tennis");
				 body=body.replace("{{ResetPwdURL}}","http://apps.zambientsystems.com:8080/TENNIS/playerhome");
				 new SendEmail(mailFromUsername, "", playerEmail, emailTemplateBean.getSubject(), body, tennisMail).start();
			}
			return result;
	   }
	 @RequestMapping(value = "/playerView/getPlayerListForEachTournament", method = RequestMethod.GET)
		public @ResponseBody List<PlayersBean> getPlayerListForEachTournament(HttpServletRequest request,
				@RequestParam("tournamentId") int tournamentId,@RequestParam("categoryId") int categoryId) {
		 List<PlayersBean> playerList = null;
			playerList = tournamentService.getPlayerListForEachTournament(tournamentId, categoryId);
		    return playerList;
		}
	    @RequestMapping(value = "getMyTournaments", method = RequestMethod.GET)
		public @ResponseBody List<TournamentList> getMyTournaments() {
			List<TournamentList> tournamentList = null;
			 tournamentList = tournamentService.getOrganizerTournament(userSession.getOrganiserId());
		    return tournamentList;
		}
		@RequestMapping(value = "getExistingPlayerList", method = RequestMethod.GET)
		public @ResponseBody List<PlayersBean> getExistingPlayerList(HttpServletRequest request,
				@RequestParam("tournamentId") int tournamentId,@RequestParam("categoryId") int categoryId) {
			List<PlayersBean> playerList = null;
			playerList = tournamentService.getExistingPlayerList(tournamentId, categoryId);
		    return playerList;
		}
		@RequestMapping(value = "/registerExistingPlayerUrl", method = RequestMethod.POST)
		 public String  registerExistingPlayerUrl(HttpServletRequest request,HttpServletResponse response,
				 @RequestParam("playerId") int playerId, @RequestParam("tournamentId") int tournamentId,
				 @RequestParam("categoryId") int categoryId, @RequestParam("entryFee") int entryFee,@RequestParam("itaRank") int itaRank){
			
				String result = tournamentService.registerExistingPlayerUrl(playerId,tournamentId,categoryId,entryFee,itaRank);
			 return result;
		 }
		@RequestMapping(value = "/updateAitaRankByOrganiser", method = RequestMethod.POST)
	    public @ResponseBody String updateAitaRankByOrganiser(@RequestBody String values,HttpServletRequest request, HttpServletResponse response) throws JSONException{
			JSONObject jsonObject = new JSONObject(values);
			JSONArray playerRank = jsonObject.getJSONArray("playerRank");
			String result = tournamentService.updateAitaRankByOrganiser(playerRank);
			return result;
			
		}
		@RequestMapping(value = "/addDoublesPlayerForTournament", method = RequestMethod.POST)
	    public @ResponseBody String addDoublesPlayerForTournament(@RequestBody String values,HttpServletRequest request, HttpServletResponse response) throws JSONException{
			JSONObject jsonObject = new JSONObject(values);
			JSONArray doublesPlayer = jsonObject.getJSONArray("doublesPlayer");
			String result = tournamentService.addDoublesPlayerForTournament(doublesPlayer);
			return result;
			
		}
		@RequestMapping(value = "playerView/getScheduleList", method = RequestMethod.GET)
		public @ResponseBody List<ScheduleInnerBean> getScheduleList(HttpServletRequest request,
				@RequestParam("tournamentId") int tournamentId,@RequestParam("categoryId") int categoryId) {
			List<ScheduleInnerBean> scheduleList = null;
			scheduleList = tournamentService.getScheduleList(tournamentId, categoryId);
		    return scheduleList;
		}
		@RequestMapping(value = "playerView/getDaysAndNoOfMatchs", method = RequestMethod.GET)
		public @ResponseBody BuildSchedule getDaysAndNoOfMatchs(HttpServletRequest request,
				@RequestParam("tournamentId") int tournamentId) {
			BuildSchedule buildSchedule = null;
			buildSchedule = tournamentService.getDaysAndNoOfMatchs(tournamentId);
		    return buildSchedule;
		}
		@RequestMapping(value = "/saveScheduleData", method = RequestMethod.POST)
	    public @ResponseBody String saveScheduleData(@RequestBody String values,HttpServletRequest request, HttpServletResponse response) throws JSONException{
			System.out.println(values);
			JSONObject jsonObject = new JSONObject(values);
			JSONArray scheduleJson = jsonObject.getJSONArray("finalobj");
            String 	result = tournamentService.saveScheduleData(scheduleJson);
			return result;
			
		}
		@RequestMapping(value = "/getTournamentListToUpdateScore", method = RequestMethod.GET)
		public @ResponseBody List<MatchTournamentBean> getTournamentListToUpdateScore() {
			List<MatchTournamentBean> tournamentList = null;
			 tournamentList = tournamentService.getTournamentListToUpdateScore(userSession.getOrganiserId());
		    return tournamentList;
		}
		@RequestMapping(value = "/updateMatchScore", method = RequestMethod.POST)
		 public String  updateMatchScore(HttpServletRequest request,HttpServletResponse response,@RequestParam("matchId") int matchId,
				 @RequestParam("tournamentid") int tournamentid,@RequestParam("categoryid") int categoryid,@RequestParam("score") String score,
				 @RequestParam("matchStatus") String matchStatus,@RequestParam("matchWinner") String matchWinner){
			log.info("TournamentController :: updateMatchScore POST method");
			if(matchWinner.isEmpty())
				matchWinner = "(NULL)";
			UpdateMatchScore bean = new UpdateMatchScore();
			bean.setCategoryid(categoryid);
			bean.setMatchid(matchId);
			bean.setScore(score);
			bean.setStatues(matchStatus);
			bean.setTournamentid(tournamentid);
			bean.setWinner(matchWinner);
			String result = tournamentService.updateMatchScore(bean);
			 return result;
		 }
		
		@RequestMapping(value = "/getDataForSchedule", method = RequestMethod.GET)
		public @ResponseBody List<RoundBean> getDataForSchedule(HttpServletRequest request,
				HttpServletResponse response,@RequestParam("tournamentid") int tournamentid) {
			List<RoundBean> tournamentList = null;
			 tournamentList = tournamentService.getDataForSchedule(tournamentid);
		    return tournamentList;
		}
		@RequestMapping(value = "playerView/isDrwasCreated", method = RequestMethod.GET)
		 public @ResponseBody EnalbleButtonBean isDrwasCreated(HttpServletRequest request, HttpServletResponse response,
				 @RequestParam("tournamentId") int tournamentId,@RequestParam("tournamentStartDate") String tournamentStart) throws ParseException{
			 log.info("TournamentController :: isDrwasCreated GET method"+tournamentStart);
			 response.setContentType("application/json");
				response.setHeader("Access-Control-Allow-Origin","*");
				response.setHeader("value", "valid");
				EnalbleButtonBean enalbleButtonBean = new EnalbleButtonBean();
				boolean drawsCreated = false,scheduleCreated = false;
			    Date date1 = new Date();
		        Date date2 = new Date(tournamentStart);
		        if (date1.compareTo(date2) > 0) {
		        	enalbleButtonBean.setMatchStarted(true);
		        }
			 if(tournamentId >=0){
				 drawsCreated = tournamentService.isDrwasCreated(tournamentId);
				 scheduleCreated = tournamentService.isScheduleCreated(tournamentId);
			 }
			 enalbleButtonBean.setDrawsCreated(drawsCreated);
			 enalbleButtonBean.setScheduleCreated(scheduleCreated);
			return enalbleButtonBean;
		 }
		@RequestMapping(value = "playerView/isPlayerviewDrwasCreated", method = RequestMethod.GET)
		 public @ResponseBody EnalbleButtonBean isPlayerviewDrwasCreated(HttpServletRequest request, HttpServletResponse response,
				 @RequestParam("tournamentId") int tournamentId,@RequestParam("regEndDate") String regEndDate,@RequestParam("regStartDate") String regStartDate) throws ParseException{
			 log.info("TournamentController :: isPlayerviewDrwasCreated GET method"+regEndDate);
			 response.setContentType("application/json");
				response.setHeader("Access-Control-Allow-Origin","*");
				response.setHeader("value", "valid");
				EnalbleButtonBean enalbleButtonBean = new EnalbleButtonBean();
				boolean drawsCreated = false,scheduleCreated = false;
				LocalDate localDate = LocalDate.now();
				String currentdate = DateTimeFormatter.ofPattern("dd-MMM-yyyy").format(localDate);
				Date date1 = new Date(currentdate);
		        Date date2 = new Date(regEndDate);
		        Date date3 = new Date(regStartDate);
		        if (date1.compareTo(date2) > 0 || date1.compareTo(date3) < 0) {
		        	enalbleButtonBean.setMatchStarted(true);
		        }
			 if(tournamentId >=0){
				 drawsCreated = tournamentService.isDrwasCreated(tournamentId);
				 scheduleCreated = tournamentService.isScheduleCreated(tournamentId);
			 }
			 enalbleButtonBean.setDrawsCreated(drawsCreated);
			 enalbleButtonBean.setScheduleCreated(scheduleCreated);
			return enalbleButtonBean;
		 }
		@RequestMapping(value = "/removePlayerFromTournament", method = RequestMethod.POST)
	    public String removePlayerFromTournament(HttpServletRequest request,RedirectAttributes attributes,
	    		@RequestParam("playerId") int playerId,@RequestParam("paymentId") int paymentId,
	    		@RequestParam("tournamentId") int tournamentId,@RequestParam("categoryId") int categoryId){
			String result =null;
			result = tournamentService.removePlayerFromTournament(playerId, paymentId,tournamentId, categoryId);
			return result;
	   }
		@RequestMapping(value = "/getRagisteredPlayers", method = RequestMethod.GET)
		public @ResponseBody List<PlayersBean> getRagisteredPlayers(HttpServletRequest request,
				@RequestParam("tournamentId") int tournamentId,@RequestParam("categoryId") int categoryId) {
			System.out.println("tournamentId :: "+tournamentId+" categoryId :: "+categoryId);
			List<PlayersBean> playerlist = null;
			playerlist = tournamentService.getRagisteredPlayers(tournamentId, categoryId);
			System.out.println(playerlist);
		    return playerlist;
		}
		@RequestMapping(value = "/createTournamentLavelSchedule", method = RequestMethod.GET)
	    public List<MatchTournamentCategoryBean> createTournamentLavelSchedule(HttpServletRequest request,RedirectAttributes attributes,
	    		@RequestParam("tournamentId") int tournamentId){
			List<MatchTournamentCategoryBean> unscheduleCategory= null;
			unscheduleCategory = tournamentService.createTournamentLavelSchedule(tournamentId);
			return unscheduleCategory;
	   }
		@RequestMapping(value = "playerView/ViewTournamentLavelSchedule", method = RequestMethod.GET)
	    public TournamentLavelScheduleBean ViewTournamentLavelSchedule(HttpServletRequest request,RedirectAttributes attributes,
	    		@RequestParam("tournamentId") int tournamentId){
			TournamentLavelScheduleBean tournamentLavelScheduleBean= null;
			tournamentLavelScheduleBean = tournamentService.ViewTournamentLavelSchedule(tournamentId);
			return tournamentLavelScheduleBean;
	   }
		@RequestMapping(value = "/getTournamentListForUpdateScore", method = RequestMethod.GET)
		public @ResponseBody List<MatchTournamentBean> getTournamentListForUpdateScore() {
			List<MatchTournamentBean> tournamentList = null;
			 tournamentList = tournamentService.getTournamentListForUpdateScore(userSession.getOrganiserId());
		    return tournamentList;
		}
		@RequestMapping(value = "/getRoundMatchRoundList", method = RequestMethod.GET)
		public @ResponseBody  List<MatchRoundBean> getRoundMatchRoundList(HttpServletRequest request,
				@RequestParam("tournamentId") int tournamentId,@RequestParam("categoryId") int categoryId) {
			 List<MatchRoundBean> roundList = null;
			 roundList = tournamentService.getRoundMatchRoundList(tournamentId,categoryId);
		    return roundList;
		}
		@RequestMapping(value = "/updateMatchStatus", method = RequestMethod.POST)
		 public String  updateMatchStatus(HttpServletRequest request,HttpServletResponse response,@RequestParam("matchId") int matchId,
				 @RequestParam("tournamentid") int tournamentid,@RequestParam("categoryid") int categoryid,
				 @RequestParam("matchStatus") String matchStatus){
			UpdateMatchScore bean = new UpdateMatchScore();
			bean.setCategoryid(categoryid);
			bean.setMatchid(matchId);
			bean.setStatues(matchStatus);
			bean.setTournamentid(tournamentid);
			String result = tournamentService.updateMatchStatus(bean);
			 return result;
		 }
		@RequestMapping(value = "mainCategoryList", method = RequestMethod.GET)
		public @ResponseBody TournamentList mainCategoryList(HttpServletRequest request,RedirectAttributes attributes,
	    		@RequestParam("tournamentId") int tournamentId) {
			TournamentList tournamentList = null;
			 tournamentList = tournamentService.mainCategoryList(tournamentId);
		    return tournamentList;
		}
		@RequestMapping(value = "playerView/singleTournamentWithCategories", method = RequestMethod.GET)
		public @ResponseBody TournamentList singleTournamentWithCategories(HttpServletRequest request, HttpServletResponse response,
				 @RequestParam("tournamentId") int tournamentId) {
			response.setContentType("application/json");
			response.setHeader("Access-Control-Allow-Origin","*");
			response.setHeader("value", "valid");
			TournamentList tournamentList = null;
			 String pattern = "yyyy-MM-dd";
			String currentDate =new SimpleDateFormat(pattern).format(new Date());
			if(userSession.getPlayerId() != null)
			 tournamentList = tournamentService.singleTournamentWithCategories(userSession.getPlayerId(),currentDate,tournamentId);
			else
			 tournamentList = tournamentService.singleTournamentWithCategories(-1,currentDate,tournamentId);
		    return tournamentList;
		}
		@RequestMapping(value = "/updatePlayersDetails", method = RequestMethod.POST)
	    public @ResponseBody String updatePlayersDetails(@RequestBody String values,HttpServletRequest request, HttpServletResponse response) throws JSONException{
			System.out.println(values);
			JSONObject jsonObject = new JSONObject(values);
			JSONArray playerJson = jsonObject.getJSONArray("finalobj");
            String 	result = tournamentService.updatePlayersDetails(playerJson);
			return result;
			
		}
		@RequestMapping(value = "/extendsTournamentDate", method = RequestMethod.POST)
	    public String extendsTournamentDate(HttpServletRequest request,RedirectAttributes attributes,
	    		@RequestParam("tournamentid") long tournamentid,@RequestParam("organiserId") long organiserId,
	    		@RequestParam("regStartDate") String regStartDate,@RequestParam("regEndDate") String regEndDate,
	    		@RequestParam("tournamentStartDate") String tournamentStartDate,@RequestParam("tournamentEndDate") String tournamentEndDate){
			String result =null;
			ExtendsBean bean = new ExtendsBean();
			bean.setOrganiserid(organiserId);
			bean.setTournamentid(tournamentid);
			bean.setRegStartDate(regStartDate);
			bean.setRegEndDate(regEndDate);
			bean.setTournamentStartDate(tournamentStartDate);
			bean.setTournamentEndDate(tournamentEndDate);
			if(bean != null)
			result = tournamentService.extendsTournamentDate(bean);
			else
				result = "Something went wrong";
			return result;
	   }
		@RequestMapping(value = "/setActiveOrInActiveDraw", method = RequestMethod.GET)
		public @ResponseBody String setActiveOrInActiveDraw(HttpServletRequest request,	@RequestParam("tournamentId") int tournamentId,
				@RequestParam("categoryId") int categoryId,@RequestParam("activeVal") int activeVal) {
			//System.out.println("Shiva ::: setActiveOrInActiveDraw");
			String result;
			result = tournamentService.setActiveOrInActiveDraw(tournamentId, categoryId,activeVal);
		    return result;
		}
		
		@RequestMapping(value = "/setActiveOrInActivePlayers", method = RequestMethod.GET)
		public @ResponseBody String setActiveOrInActivePlayers(HttpServletRequest request,	@RequestParam("tournamentId") int tournamentId,
				@RequestParam("categoryId") int categoryId,@RequestParam("activeVal") int activeVal) {
			System.out.println("Shiva ::: setActiveOrInActivePlayers");
			String result;
			result = tournamentService.setActiveOrInActivePlayers(tournamentId, categoryId,activeVal);
		    return result;
		}
		
		@RequestMapping(value = "/sendMessage", method = RequestMethod.POST)
		public String sendMessage(HttpServletRequest request,RedirectAttributes attributes,@RequestParam("name") String name, 
				@RequestParam("email") String email, @RequestParam("subject") String subject,@RequestParam("description") String description) {
			System.out.println("TournamentController::: sendMessage");
			String message = "";
			message=message+"<table style=\"width:400px;font-family: arial, sans-serif;border-collapse: collapse;\">"+
					"<tr>"+
					   "<th style=\"width:300px;border: 1px solid #dddddd;text-align: center; padding: 5px;font-size: 12px;background-color:87ceeb;\">Title</th>"+
					   "<th style=\"width:150px;border: 1px solid #dddddd;text-align: center; padding: 5px;font-size: 12px;background-color:87ceeb;\">Data</th>"+
					"</tr>";
			message = message+
					"<tr>"+
					"<td style=\"width:300px;border: 1px solid #dddddd;text-align: center; padding: 5px;font-size: 12px;\">Name</td>"+
					"<td style=\"width:150px;border: 1px solid #dddddd;text-align: center; padding: 5px;font-size: 12px;\">"+name+"</td>"+
					"</tr>";
			message = message+
					"<tr>"+
					"<td style=\"width:300px;border: 1px solid #dddddd;text-align: center; padding: 5px;font-size: 12px;\">Email </td>"+
					"<td style=\"width:150px;border: 1px solid #dddddd;text-align: center; padding: 5px;font-size: 12px;\">"+email+"</td>"+
					"</tr>";
			message = message+
					"<tr>"+
					"<td style=\"width:300px;border: 1px solid #dddddd;text-align: center; padding: 5px;font-size: 12px;\">Subject</td>"+
					"<td style=\"width:150px;border: 1px solid #dddddd;text-align: center; padding: 5px;font-size: 12px;\">"+subject+"</td>"+
					"</tr>";
			message = message+
					"<tr>"+
					"<td style=\"width:300px;border: 1px solid #dddddd;text-align: center; padding: 5px;font-size: 12px;\">Description</td>"+
					"<td style=\"width:150px;border: 1px solid #dddddd;text-align: center; padding: 5px;font-size: 12px;\">"+description+"</td>"+
					"</tr>";
			message = message+"</table>";
			if(name!="" && email!="" && subject!="" && description!=""){
			new SendEmail(mailFromUsername, "", mailFromUsername, "Request from TENNISAPP", message, tennisMail).start();
			return "We received your request will get back soon!";
			}else
				return "Something went wrong";
		}
		/**
		 * This method is used for to delete multiple player from tournament,category list
		 * */
		@RequestMapping(value = "playerView/multiplayerdelete", method = RequestMethod.POST)
	    public @ResponseBody String multiplayerdelete(@RequestBody String values,HttpServletRequest request, HttpServletResponse response) throws JSONException{
			log.info("multiplayerdelete POST "+values);
			JSONObject jsonObject = new JSONObject(values);
			JSONArray deletePlayerList = jsonObject.getJSONArray("multiplayerdelete");
			//String result = tournamentService.updateAitaRankByOrganiser(playerRank);
			return null;
			
		}
}
