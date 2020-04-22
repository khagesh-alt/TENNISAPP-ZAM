package com.zambient.tennis.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.amazonaws.Request;
import com.zambient.tennis.bean.LoginBean;
import com.zambient.tennis.bean.PlayerUserBO;
import com.zambient.tennis.bean.PlayersBean;
import com.zambient.tennis.bean.RankCategoryBean;
import com.zambient.tennis.bean.players;
import com.zambient.tennis.service.PlayersService;
import com.zambient.tennis.util.CommonUtil;
import com.zambient.tennis.util.TournamentSession;
import com.zambient.tennis.util.UserSession;


@RestController
public class PlayersController {
	final static Logger log = Logger.getLogger(PlayersController.class);
	@Autowired 
	private UserSession userSession;
	@Autowired 
	private TournamentSession tournamentSession;
	@Autowired
	PlayersService playersService;
	
	@Value("${images.excelupload.path}")
	private String imagesexceluploadpath;
	@Value("${images.playerlist.path}")
	private String imagesplayerlistpath;
	
	/**
	 * This method is used to register player 
	 * */
	@RequestMapping(value = "playerView/addPlayer", method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_VALUE)
	 public String  addPlayer(@RequestBody PlayersBean playersBean, HttpServletRequest request, HttpServletResponse response){
		log.info("PlayersController :: addPlayer POST method"+playersBean);
		response.setContentType("application/json");
		response.setHeader("Access-Control-Allow-Origin","*");
		response.setHeader("value", "valid");
		String result =null;
		if(playersBean.getItaId() !=null && playersBean.getItaRank() == null)
			return "Please fill Rank !";
		if(playersBean.getItaId() ==null && playersBean.getItaRank() != null)
			return "Please fill Id !";
		
		if(playersBean.getAddress() != "" && playersBean.getDateOfBirth() != "" && playersBean.getEmail() != "" && playersBean.getName() != "" && playersBean.getPhone() != "" && playersBean.getPwd() != ""){
			if(playersBean.getPwd().equals(playersBean.getRepwd()))
			 result = playersService.addPlayer(playersBean);
			else
				result = "Password And Repassword Should be Match";
		}else
			result = "All fields are mandatory !";
		 return result;
	 }
	/**
	 * This method is used to get player list for a particular 
	 * */
	@RequestMapping(value = "playerView/getPlayerList", method = RequestMethod.GET)
	public @ResponseBody List<players> getPlayerList(HttpServletRequest request,
                          @RequestParam("tournamentId") int tournamentId,@RequestParam("categoryId") int categoryId) {
		List<players> playerList =null;
		if(userSession.getPlayerId() != null)
		 playerList = playersService.getPlayerList(categoryId,tournamentId);
		else 
			 playerList = playersService.getPlayerList(categoryId,tournamentId);
	    return playerList;
	}
	/**
	 * This method is used to player login if Player got logged then creating session for him and redirecting to upcoming tournament page 
	 * */
	@RequestMapping("/playerLogin")  
    public RedirectView playerLogin(HttpServletRequest request,RedirectAttributes attributes,@RequestParam("userId") String userId,@RequestParam("loginpassword") String loginpassword){
		log.info("PlayersController :: playerLogin POST method");
		System.out.println("userId>> "+userId+" loginpassword>> "+loginpassword);
		HttpSession adminSession = request.getSession(false);
		if(adminSession != null)
		adminSession.invalidate();
		LoginBean loginBean = new LoginBean();
		loginBean.setUserId(userId);
		loginBean.setPassword(loginpassword);
		PlayerUserBO playerBean = new PlayerUserBO();
		boolean mobile = playersService.isMobileExist(userId);
		if(!mobile){
			attributes.addFlashAttribute("message", "Mobile No. Does not Exist.");
		    return new RedirectView("playerhome");
		}else{
			 playerBean = playersService.playerLogin(loginBean);
			 
			 if(playerBean != null && playerBean.getPhone().equals(loginBean.getUserId())){
				 userSession.setPlayerId(playerBean.getPlayerId());
				 userSession.setName(playerBean.getName());
				 userSession.setAge(playerBean.getAge());
				 userSession.setPassword(playerBean.getPassword());
				 userSession.setPhone(playerBean.getPhone());
				 userSession.setLoginType(0);
				 log.info("Session"+userSession.getName());
				 return new RedirectView("playerhome");
				 //return "redirect:/upcomingtournament";
			 }else{
				 attributes.addFlashAttribute("message", "Mobile No. and Password Doesn't match.");
				 return new RedirectView("playerhome");
			 }
		}
		
   }
	/**
	 * This method (Ajax call ) is used to player login if Player got logged then creating session for him
	 * */
	@RequestMapping("playerView/secPlayerLogin")  
    public String secPlayerLogin(HttpServletRequest request,@RequestParam("userId") String userId,@RequestParam("loginpassword") String loginpassword){
		log.info("PlayersController :: playerLogin POST method");
		System.out.println("userId>> "+userId+" loginpassword>> "+loginpassword);
		HttpSession adminSession = request.getSession(false);
		if(adminSession != null)
		adminSession.invalidate();
		String result = null;
		LoginBean loginBean = new LoginBean();
		loginBean.setUserId(userId);
		loginBean.setPassword(loginpassword);
		boolean mobile = playersService.isMobileExist(userId);
		if(!mobile){
			return "Mobile No. Does not Exist.";
		} else {
			PlayerUserBO playerBean = playersService.playerLogin(loginBean);
			if (playerBean != null && playerBean.getPhone().equals(loginBean.getUserId())) {
				userSession.setPlayerId(playerBean.getPlayerId());
				userSession.setName(playerBean.getName());
				userSession.setAge(playerBean.getAge());
				userSession.setPassword(playerBean.getPassword());
				userSession.setPhone(playerBean.getPhone());
				userSession.setLoginType(0);
				log.info("Session" + userSession.getName());
				result = "Success";
			} else {
				result = "Mobile No. and Password Doesn't match.";
			}
		}
		return result;
   }
	/**
	 * This method is used to get Player/Organiser profile
	 * */
	@RequestMapping(value = "/getProfile", method = RequestMethod.GET)
	public @ResponseBody players getProfile(HttpServletRequest request) {
		players player = null;
		if(userSession.getLoginType() == 0 && userSession.getPlayerId()!=null)
		 player = playersService.getProfile(userSession.getPlayerId(),userSession.getLoginType());
		else
			player = playersService.getProfile(userSession.getOrganiserId(),userSession.getLoginType());
	    return player;
	}
	/**
	 * This method is used to reset player password
	 * */
	@RequestMapping("playerView/changePlayerPassword")  
    public String changePlayerPassword(HttpServletRequest request,
    		@RequestParam("oldpwd") String oldpwd,@RequestParam("newpwd") String newpwd,@RequestParam("retypepwd") String retypepwd){
		String result = null;
		if(!(oldpwd.trim().equals(userSession.getPassword()))){
			 result ="Current Password Wrong, Please Try Again";
		}
	    if(!(retypepwd.equals(newpwd))){
	    	result =  "New Password and Retype password should be match";
		}
	    if((retypepwd.equals(newpwd) && (oldpwd.trim().equals(userSession.getPassword())))){
	    	result = playersService.changePlayerPassword(userSession.getPlayerId(),newpwd.trim());
	    	HttpSession userSession = request.getSession(false);
	    	if(userSession != null)
			userSession.invalidate();
	    }
		return result;
	}
	/**
	 * This method is used to upload (.xlsx or .csv) player list data at app level
	 * */
	@RequestMapping(value="/uploadBulkData",method=RequestMethod.POST)
 	public String uploadBulkData(HttpServletRequest request,HttpServletResponse response,RedirectAttributes attributes,
 			@RequestParam(value = "bulkUploadFile", required = false) MultipartFile bulkUploadFile,
 			RedirectAttributes redirectAttributes) throws IOException{
		log.info("uploadBulkData () At tournament lavel.");
		List<RankCategoryBean> rankList = playersService.getAllRankCategories();
		List<PlayersBean> playerList = new ArrayList<PlayersBean>();
		String result =null;
		String fileName = new SimpleDateFormat("yyyyMMddhhmmss").format(new Date());
		CommonUtil.validateExcel(bulkUploadFile.getOriginalFilename().split("\\.")[1]);
		saveExcel(fileName, bulkUploadFile, request,bulkUploadFile.getOriginalFilename().split("\\.")[1]);
		
		String FILE_NAME = imagesexceluploadpath + File.separator + fileName + "."+bulkUploadFile.getOriginalFilename().split("\\.")[1];
		try{
			FileInputStream excelFile = new FileInputStream(new File(FILE_NAME));
			  XSSFWorkbook wb = new XSSFWorkbook(excelFile);
			   XSSFSheet sheet = (XSSFSheet) wb.getSheetAt(0);
			   //int noOfRows=  sheet.getPhysicalNumberOfRows();
			   Row row;
			   for(int i=1; i<=sheet.getLastRowNum(); i++){
				   PlayersBean bean = new PlayersBean();
				   row = sheet.getRow(i);
	                if(row!=null){
	                	if(row.getCell(0) !=null)
	                	bean.setName(row.getCell(0).getStringCellValue().trim());
	                	else
	                		return "Name should not be empty please check row no "+(i+1);
	                	if(row.getCell(1) !=null && String.valueOf(new Double(row.getCell(1).getNumericCellValue()).longValue()).trim().length() == 10)
	                	bean.setPhone(String.valueOf(new Double(row.getCell(1).getNumericCellValue()).longValue()).trim());
	                	else
	                		return "Mobile should be in 10 digit please check row no "+(i+1);
	                	if(row.getCell(2) !=null)
	                	bean.setEmail(row.getCell(2).getStringCellValue().trim());
	                	else
	                		return "Email should not be empty please check row no "+(i+1);
	                	if(row.getCell(3) !=null)
	                	bean.setAddress(row.getCell(3).getStringCellValue().trim());
	                	else
	                		return "Address should not be empty please check row no "+(i+1);
	                	if(row.getCell(4) !=null && row.getCell(4).getNumericCellValue() >0 && row.getCell(4).getNumericCellValue() < 99 )
	                	bean.setDateOfBirth(CommonUtil.calcDOBFromAge((int) row.getCell(4).getNumericCellValue()));
	                	else
	                		return "Please check age column at row no "+(i+1);
	                	/*if(row.getCell(5) !=null && !row.getCell(5).getStringCellValue().isEmpty()){
	                		System.out.println(row.getCell(5).getStringCellValue().trim());
	                		System.out.println(CommonUtil.getRankingId(rankList, row.getCell(5).getStringCellValue().trim()));
	                	}else{
	                		
	                	}*/
	                	long ranking = 0;
	                	if(row.getCell(6) !=null)
	                	  ranking = CommonUtil.getRankingId(rankList, row.getCell(5).getStringCellValue().trim());
	                	else
	                		ranking = 1;
	                	if(row.getCell(6) !=null){
	                		if(ranking != 1){
	                			bean.setRank(ranking);
	                			bean.setItaId((long)row.getCell(6).getNumericCellValue());
	    	                	bean.setItaRank((long)row.getCell(6).getNumericCellValue());
	                		}else
	                			return "Please select valid ranking at row no "+(i+1) +", otherwise AITA ID make it as null";
	                	}
	                	else{
	                		bean.setRank((long)1);
	                		bean.setItaId((long)11111111);
	                		bean.setItaRank((long)11111111);
	                	}
	                	if(row.getCell(7) !=null){
	                	if(row.getCell(7).getStringCellValue().equalsIgnoreCase("M") || row.getCell(7).getStringCellValue().equalsIgnoreCase("Male"))
	                	bean.setGender((long)0);
	                	else
	                	bean.setGender((long)1);
	                	}else
	                		return "Gender should not be empty please check row no "+(i+1);

	                	bean.setLavel("High");
	                	//bean.setRank((long)4);
	                	bean.setPoints((long)5);
	                	playerList.add(bean);
	                }
	            }
		}catch(Exception e){
			System.out.println("Something went wrong");
			e.printStackTrace();
			return "Something went wrong";
		}
		if(playerList.size() >0)
		  result = playersService.uploadBulkData(playerList);
		
		return result;
	}
	/**
	 * This method is used to save file In drive.
	 * */
	public void saveExcel(String fileName, MultipartFile bulkUploadFile, HttpServletRequest request, String ext) {
		try {
			String imgType[] = bulkUploadFile.getContentType().split("/");
			//String outerFolderName = months;
			File file = new File(
					imagesexceluploadpath + File.separator + fileName + "."+ext);// +"."+imgType[1]
			FileUtils.writeByteArrayToFile(file, bulkUploadFile.getBytes());
			log.info("Go to the location:  " + file.toString()
					+ " on your computer and verify that the image has been stored.");
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * This method is used to download excel format for singles.
	 * */
	@RequestMapping(value = "downloadExcelFormat", method = RequestMethod.GET,produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
    public @ResponseBody void downloadExcelFormat(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CommonUtil.downloadZipFile(request,response,imagesexceluploadpath+"/Players.xlsx");
    }
	/**
	 * This method is used to download excel format for doubles.
	 * */
	@RequestMapping(value = "downloadExcelFormatForDoubles", method = RequestMethod.GET,produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
    public @ResponseBody void downloadExcelFormatForDoubles(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CommonUtil.downloadZipFile(request,response,imagesexceluploadpath+"/doubles.xlsx");
    }
	
	/**
	 * This method is used to download all player list data from players db table
	 * */
	@RequestMapping(value = "downloadPlayersListWithDetails", method = RequestMethod.GET, produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	public @ResponseBody void downloadPlayersListWithDetails(HttpServletRequest request, HttpServletResponse response) throws Exception {
		log.info("PlayersController :: downloadPlayersListWithDetails()");
		
		Map < String, Object[] > playerinfo = playersService.downloadPlayersListWithDetails();
		XSSFWorkbook workbook = new XSSFWorkbook();
		XSSFSheet spreadsheet = workbook.createSheet("Player Info");
		
		XSSFFont font = workbook.createFont();
	      font.setFontHeightInPoints((short) 11);
	      font.setBold(true);
	      //font.setColor(HSSFColor.LIGHT_ORANGE.index);
	      
		XSSFCellStyle style = workbook.createCellStyle();
		style.setFillForegroundColor(HSSFColor.LIGHT_ORANGE.index);
		style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		style.setFont(font);
		XSSFRow row;
	      Set < String > keyid = playerinfo.keySet();
	      int rowid = 0;
	      for (String key : keyid) {
	          row = spreadsheet.createRow(rowid++);
	          Object [] objectArr = playerinfo.get(key);
	          int cellid = 0;
	          
	          for (Object obj : objectArr){
	             Cell cell = row.createCell(cellid++);
	             cell.setCellValue((String)obj);
	             if(rowid == 1)
	             cell.setCellStyle(style);
	          }
	       }
	      Lock lock = new ReentrantLock();
	      lock.lock();
	      try{
		      FileOutputStream out = new FileOutputStream(new File(imagesplayerlistpath + "/playersList.xlsx"));
		     workbook.write(out);
		     out.close();
		     CommonUtil.downloadZipFile(request,response,imagesplayerlistpath+"/playersList.xlsx");
	      }catch(Exception e){
	    	  log.error("Error In downloadPlayersListWithDetails():: "+e);
	      }finally{
	    	  lock.unlock();
	      }
		
	}
	/**
	 * This method is used to get All ranking categories
	 * */
	@RequestMapping(value="playerView/getAllRankCategories", method = RequestMethod.GET)
	public @ResponseBody List<RankCategoryBean> getAllRankCategories(HttpServletRequest request,HttpServletResponse response){
		log.info("PlayersController ::: getAllRankCategories()");
		List<RankCategoryBean> rankList = playersService.getAllRankCategories();
		return rankList;
	}
	
	/**
	 * This method is used to redirect home page to show tournament page
	 * */
	@RequestMapping("/redirectToShowTournament")  
    public RedirectView showTournament(HttpServletRequest request,@RequestParam("tournamentId") Long tournamentId){
		log.info("PlayersController :: redirectToShowTournament method"+tournamentId);
		tournamentSession.setTournamentid(tournamentId);
		if(userSession.getPlayerId() != null)
	    return new RedirectView("showTournament");
		else
			return new RedirectView("playerhome");

	}
}









