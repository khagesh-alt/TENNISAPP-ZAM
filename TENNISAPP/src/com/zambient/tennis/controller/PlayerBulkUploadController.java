package com.zambient.tennis.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mysql.jdbc.StringUtils;
import com.zambient.tennis.bean.CategoryBean;
import com.zambient.tennis.bean.DoubleBulkUploadBean;
import com.zambient.tennis.bean.DoublePlayersDetailsBean;
import com.zambient.tennis.bean.PlayersBean;
import com.zambient.tennis.bean.RankCategoryBean;
import com.zambient.tennis.bean.SingleBulkUploadBean;
import com.zambient.tennis.service.PlayersBulkUploadService;
import com.zambient.tennis.service.PlayersService;
import com.zambient.tennis.util.CommonUtil;
import com.zambient.tennis.util.UserSession;

@RestController
public class PlayerBulkUploadController {
	final static Logger log = Logger.getLogger(PlayerBulkUploadController.class);
	@Autowired 
	private UserSession userSession;
	@Autowired
	PlayersBulkUploadService playersBulkUploadService;
	@Autowired
	PlayersService playersService;
	
	@Value("${images.excelupload.path}")
	private String imagesexceluploadpath;
	
	@RequestMapping(value="/uploadBulkAndRegisterForSingleMatch",method=RequestMethod.POST)
 	public String uploadBulkAndRegisterForSingleMatch(HttpServletRequest request,HttpServletResponse response,
 			@RequestParam(value = "tournamentId") long tournamentId,@RequestParam(value = "categoryId") long categoryId,
 			@RequestParam(value = "matchType") long matchType,@RequestParam(value = "entryFee") double entryFee,
 			@RequestParam(value = "bulkUploadFile", required = false) MultipartFile bulkUploadFile,
 			RedirectAttributes redirectAttributes) throws IOException{
		log.info("PlayerBulkUploadController :: uploadBulkAndRegisterForSingleMatch()");
		List<RankCategoryBean> rankList = playersService.getAllRankCategories();
		CategoryBean categoryBean =  playersBulkUploadService.getMatchCategoryDesc(categoryId);
		System.out.println(categoryBean);
		SingleBulkUploadBean singleBulkUploadBean = new SingleBulkUploadBean();
		singleBulkUploadBean.setCategoryId( categoryId);
		singleBulkUploadBean.setTournamentId(tournamentId);
		singleBulkUploadBean.setMatchType(matchType);
		singleBulkUploadBean.setEntryFee(entryFee);
		List<PlayersBean> playerList = new ArrayList<PlayersBean>();
		String result =null;
		String fileName = new SimpleDateFormat("yyyyMMddhhmmss").format(new Date());
		CommonUtil.validateExcel(bulkUploadFile.getOriginalFilename().split("\\.")[1]);
		CommonUtil.saveExcel(imagesexceluploadpath,fileName, bulkUploadFile, request,bulkUploadFile.getOriginalFilename().split("\\.")[1]);
		
		String FILE_NAME = imagesexceluploadpath + File.separator + fileName + "."+bulkUploadFile.getOriginalFilename().split("\\.")[1];
		try{
			FileInputStream excelFile = new FileInputStream(new File(FILE_NAME));
			  XSSFWorkbook wb = new XSSFWorkbook(excelFile);
			   XSSFSheet sheet = (XSSFSheet) wb.getSheetAt(0);
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
	                	if(categoryBean.getCategory_age() != 17){
	                		if(row.getCell(4).getNumericCellValue() > categoryBean.getCategory_age())
	                			return row.getCell(0).getStringCellValue().trim()+" your age is not matching for this tournament please check at row no "+(i+1);
	                	}
	                	long ranking = 0;
	                	if(row.getCell(5) !=null)
	                	 ranking = CommonUtil.getRankingId(rankList, row.getCell(5).getStringCellValue().trim());
	                	else
	                		ranking = 1;
	                	
	                	if(row.getCell(6) !=null && row.getCell(6).getNumericCellValue() > 0){
	                		if(ranking != 1){
	                			bean.setRank(ranking);
	                			bean.setItaId((long)row.getCell(6).getNumericCellValue());
	    	                	bean.setItaRank((long)row.getCell(6).getNumericCellValue());
	                		}else
	                			return "Please select valid ranking at row no "+(i+1) +", otherwise AITA ID make it as empty";
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
	                	if(bean.getGender() != categoryBean.getCategory_gender())
	                		return row.getCell(0).getStringCellValue().trim()+" is not eligible for this tournament please check at row no "+(i+1);

	                	bean.setLavel("High");
	                	//bean.setRank((long)4);
	                	bean.setPoints((long)5);
	                	playerList.add(bean);
	                }
	            }
		}catch(Exception e){
			System.out.println("Something went wrong");
			log.error("uploadBulkAndRegisterForSingleMatch:: "+e);
			e.printStackTrace();
			return "Something went wrong";
		}
		singleBulkUploadBean.setPlayerList(playerList);
		   if(playerList.size() >0)
		     result = playersBulkUploadService.uploadBulkAndRegisterForSingleMatch(singleBulkUploadBean);
		
		return result;
	}
	
	/**
	 * Players bulk upload for doubles start
	 * */
	@RequestMapping(value="/uploadBulkAndRegisterForDoubleMatch",method=RequestMethod.POST)
 	public synchronized String uploadBulkAndRegisterForDoubleMatch(HttpServletRequest request,HttpServletResponse response,
 			@RequestParam(value = "tournamentId") long tournamentId,@RequestParam(value = "categoryId") long categoryId,
 			@RequestParam(value = "matchType") long matchType,@RequestParam(value = "entryFee") double entryFee,
 			@RequestParam(value = "bulkUploadFile", required = false) MultipartFile bulkUploadFile,
 			RedirectAttributes redirectAttributes) throws IOException{
		log.info("PlayerBulkUploadController :: uploadBulkAndRegisterForDoubleMatch()");
		List<RankCategoryBean> rankList = playersService.getAllRankCategories();
		CategoryBean categoryBean =  playersBulkUploadService.getMatchCategoryDesc(categoryId);
		System.out.println(categoryBean);
		DoubleBulkUploadBean doubleBulkUploadBean = new DoubleBulkUploadBean();
		doubleBulkUploadBean.setCategoryId( categoryId);
		doubleBulkUploadBean.setTournamentId(tournamentId);
		doubleBulkUploadBean.setMatchType(matchType);
		doubleBulkUploadBean.setEntryFee(entryFee);
		List<DoublePlayersDetailsBean> playerList = new ArrayList<DoublePlayersDetailsBean>();
		String result =null;
		String fileName = new SimpleDateFormat("yyyyMMddhhmmss").format(new Date());
		CommonUtil.validateExcel(bulkUploadFile.getOriginalFilename().split("\\.")[1]);
		CommonUtil.saveExcel(imagesexceluploadpath,fileName, bulkUploadFile, request,bulkUploadFile.getOriginalFilename().split("\\.")[1]);
		
		String FILE_NAME = imagesexceluploadpath + File.separator + fileName + "."+bulkUploadFile.getOriginalFilename().split("\\.")[1];
		try{
			FileInputStream excelFile = new FileInputStream(new File(FILE_NAME));
			  XSSFWorkbook wb = new XSSFWorkbook(excelFile);
			   XSSFSheet sheet = (XSSFSheet) wb.getSheetAt(0);
			   Row row;
			   int rowCount=sheet.getLastRowNum();
			   for(int i=1; i<=rowCount; i++){
				   DoublePlayersDetailsBean bean = new DoublePlayersDetailsBean();
				   row = sheet.getRow(i);
	                if(row!=null){
	                	
	                	if(row.getCell(0) !=null)
	                	bean.setFirstPlayerName(row.getCell(0).getStringCellValue().trim());
	                	else
	                		return "First player name should not be empty please check row no "+(i+1);
	                	if(row.getCell(1) !=null)
		                	bean.setSecondPlayerName(row.getCell(1).getStringCellValue().trim());
		                else
		                	return "Second player name should not be empty please check row no "+(i+1);
	                	if(row.getCell(2) !=null && String.valueOf(new Double(row.getCell(2).getNumericCellValue()).longValue()).trim().length() == 10)
		                	bean.setFirstPlayerMobile(String.valueOf(new Double(row.getCell(2).getNumericCellValue()).longValue()).trim());
		                else
		                	return "First player mobile should be in 10 digit please check row no "+(i+1);
	                	if(row.getCell(3) !=null && String.valueOf(new Double(row.getCell(3).getNumericCellValue()).longValue()).trim().length() == 10)
		                	bean.setSecondPlayerMobile(String.valueOf(new Double(row.getCell(3).getNumericCellValue()).longValue()).trim());
		                else
		                	return "Second player mobile should be in 10 digit please check row no "+(i+1);
	                	if(row.getCell(4) !=null)
		                	bean.setFirstPlayerEmail(row.getCell(4).getStringCellValue().trim());
		                else
		                	return "First player email should not be empty please check row no "+(i+1);
	                	if(row.getCell(5) !=null)
		                	bean.setSecondPlayerEmail(row.getCell(5).getStringCellValue().trim());
		                else
		                	return "Second player email should not be empty please check row no "+(i+1);
	                	if(row.getCell(6) !=null)
	                	bean.setFirstPlayerAdd(row.getCell(6).getStringCellValue().trim());
	                	else
	                		return "First player address should not be empty please check row no "+(i+1);
	                	if(row.getCell(7) !=null)
		                	bean.setSecondPlayerAdd(row.getCell(7).getStringCellValue().trim());
		                else
		                	return "Second player address should not be empty please check row no "+(i+1);
	                	if(row.getCell(8) !=null && row.getCell(8).getNumericCellValue() >0 && row.getCell(8).getNumericCellValue() < 99 )
		                	bean.setFirstPlayerDob(CommonUtil.calcDOBFromAge((int) row.getCell(8).getNumericCellValue()));
		                else
		                	return "Please check first player age column at row no "+(i+1);
	                	if(categoryBean.getCategory_age() != 17){
	                		if(row.getCell(8).getNumericCellValue() > categoryBean.getCategory_age())
	                			return row.getCell(0).getStringCellValue().trim()+" your age is not matching for this tournament please check at row no "+(i+1);
	                	}
	                	if(row.getCell(9) !=null && row.getCell(9).getNumericCellValue() >0 && row.getCell(9).getNumericCellValue() < 99 )
		                	bean.setSecondPlayerDob(CommonUtil.calcDOBFromAge((int) row.getCell(9).getNumericCellValue()));
		                else
		                	return "Please check second player age column at row no "+(i+1);
	                	if(categoryBean.getCategory_age() != 17){
	                		if(row.getCell(9).getNumericCellValue() > categoryBean.getCategory_age())
	                			return row.getCell(1).getStringCellValue().trim()+" your age is not matching for this tournament please check at row no "+(i+1);
	                	}
	                	long ranking1 = 0;
	                	if(row.getCell(10) !=null)
	                		ranking1 = CommonUtil.getRankingId(rankList, row.getCell(10).getStringCellValue().trim());
	                	else
	                		ranking1 =1;
	                	if(row.getCell(12) !=null && row.getCell(12).getNumericCellValue() > 0){
	                		if(ranking1 != 1){
	                			bean.setFirstPlayerRank(ranking1);
	                			bean.setFirstPlayerAita((long)row.getCell(12).getNumericCellValue());
	    	                	bean.setFirstPlayerAitaRank((long)row.getCell(12).getNumericCellValue());
	                		}else
	                			return "Please select valid ranking for first player at row no "+(i+1) +", otherwise AITA ID make it as null";
		                	/*bean.setFirstPlayerAita((long)row.getCell(10).getNumericCellValue());
		                	bean.setFirstPlayerAitaRank((long)row.getCell(10).getNumericCellValue());*/
		                }
		                else{
		                	bean.setFirstPlayerRank((long)1);
		                	bean.setFirstPlayerAita((long)11111111);
		                	bean.setFirstPlayerAitaRank((long)11111111);
		                }
	                	long ranking2 =0 ;
	                	if(row.getCell(11) !=null)
	                	 ranking2 = CommonUtil.getRankingId(rankList, row.getCell(11).getStringCellValue().trim());
	                	else
	                	 ranking2 = 1;
	                	if(row.getCell(13) !=null && row.getCell(13).getNumericCellValue() > 0){
	                		if(ranking2 != 1){
	                			bean.setSecondPlayerRank(ranking2);
	                			bean.setSecondPlayerAita((long)row.getCell(13).getNumericCellValue());
	    	                	bean.setSecondPlayerAitaRank((long)row.getCell(13).getNumericCellValue());
	                		}else
	                			return "Please select valid ranking for second player at row no "+(i+1) +", otherwise AITA ID make it as null";
		                	/*bean.setSecondPlayerAita((long)row.getCell(11).getNumericCellValue());
		                	bean.setSecondPlayerAitaRank((long)row.getCell(11).getNumericCellValue());*/
		                }
		                else{
		                	bean.setSecondPlayerRank((long)1);
		                	bean.setSecondPlayerAita((long)11111111);
		                	bean.setSecondPlayerAitaRank((long)11111111);
		                }
	                	if(row.getCell(14) !=null){
		                	if(row.getCell(14).getStringCellValue().equalsIgnoreCase("M") || row.getCell(14).getStringCellValue().equalsIgnoreCase("Male"))
		                	bean.setFirstPlayerGender((long)0);
		                	else
		                	bean.setFirstPlayerGender((long)1);
		                	}
	                	else{
		                	return "First player gender should not be empty please check row no "+(i+1);
	                	}
	                	if(bean.getFirstPlayerGender() != categoryBean.getCategory_gender())
	                	{
	                		return row.getCell(0).getStringCellValue().trim()+" is not eligible for this tournament please check at row no "+(i+1);
	                	}
	                	if(row.getCell(15) !=null){
		                	if(row.getCell(15).getStringCellValue().equalsIgnoreCase("M") || row.getCell(15).getStringCellValue().equalsIgnoreCase("Male"))
		                	bean.setSecondPlayerGender((long)0);
		                	else
		                	bean.setSecondPlayerGender((long)1);
		                	}
	                	else{
		                	return "Second player gender should not be empty please check row no "+(i+1);
	                	}
	                	if(bean.getSecondPlayerGender() != categoryBean.getCategory_gender()){
	                		return row.getCell(1).getStringCellValue().trim()+" is not eligible for this tournament please check at row no "+(i+1)+" at gender column";
	                	}
	                	bean.setFirstPlayerLavel("High");
	                	bean.setSecondPlayerLavel("High");
	                	//bean.setFirstPlayerRank((long)4);
	                	//bean.setSecondPlayerRank((long)4);
	                	bean.setFirstPlayerPoint((long)5);
	                	bean.setSecondPlayerPoint((long)5);
	                	playerList.add(bean);
	                }
	            }
		}catch(Exception e){
			log.error("uploadBulkAndRegisterForSingleMatch:: "+e);
			e.printStackTrace();
			return "Something went wrong";
		}
		doubleBulkUploadBean.setPlayerList(playerList);
		   if(playerList.size() >0){
			   result = playersBulkUploadService.uploadBulkAndRegisterForDoubleMatch(doubleBulkUploadBean);
		   }
		
		return result;
	}
	/**
	 * Players bulk upload for doubles end
	 * */

}
