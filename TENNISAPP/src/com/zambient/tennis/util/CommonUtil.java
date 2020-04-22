package com.zambient.tennis.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;

import com.zambient.tennis.bean.DrawsPlayer;
import com.zambient.tennis.bean.RankCategoryBean;
import com.zambient.tennis.controller.VenueController;

public class CommonUtil {
	final static Logger log = Logger.getLogger(VenueController.class);
	
	public static void validateImage(MultipartFile image) {
		if (!(image.getContentType().equalsIgnoreCase("image/jpeg")
				|| image.getContentType().equalsIgnoreCase("image/jpg")
				|| image.getContentType().equalsIgnoreCase("image/png")))
				{
			throw new RuntimeException("Only JPG images are accepted");
		}
	}
	public static void saveImage(String filename, MultipartFile image, HttpServletRequest request,String imageRootPath)
			throws RuntimeException, IOException {
		try {
			String imgType[] = image.getContentType().split("/");
			File file = new File(
					imageRootPath + File.separator + File.separator + filename + "." + imgType[1]);// +"."+imgType[1]
			FileUtils.writeByteArrayToFile(file, image.getBytes());
			log.info("Go to the location:  " + file.toString()
					+ " on your computer and verify that the image has been stored.");
		} catch (IOException e) {
			throw e;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	public static void editArray(int[] arr16, ArrayList<Integer> positions, ArrayList<Integer> values) {
		for (int i = 0; i < positions.size(); i++) {

			int num = getRandomElement(values);
			deleteVal(values, num);
			addElementToArray(arr16, positions.get(i), num);

		}
	}

	public static void addElementToArray(int[] arr16, int position, int num) {
		for (int i = 0; i < arr16.length; i++) {
			if (i == position) {
				arr16[i] = num;
			}
		}

	}

	public static int getRandomElement(List<Integer> list) {
		Random rand = new Random();
		return list.get(rand.nextInt(list.size()));
	}

	public static void deleteVal(List<Integer> list, int val) {
		Iterator itr = list.iterator();
		while (itr.hasNext()) {
			if ((Integer) itr.next() == val) {
				itr.remove();
			}
		}
	}

	public static int addElement(List<Integer> list) {
		Random rand = new Random();
		return list.get(rand.nextInt(list.size()));
	}
	
	public static String calcDOBFromAge(int dobYear){
		int dobMonth = 01;
		int dobDay = 01;

		LocalDate now = LocalDate.now();
		LocalDate dob = now.minusYears(dobYear)
		        .minusMonths(dobMonth)
		        .minusDays(dobDay);

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		return dob.format(formatter);
	}
	public static void validateExcel(String ext) {
		if (!(ext.equalsIgnoreCase("xls")
				|| ext.equalsIgnoreCase("xlsx")
				|| ext.equalsIgnoreCase("csv")))
				{
			throw new RuntimeException("Only xls,xlsx and csv file are accepted");
		}
	}
	public static void downloadZipFile(HttpServletRequest request, HttpServletResponse response,String filePath) throws IOException {
		//String fileName="PoizinChecks.zip";
	      //String filePath="D:\\khagesh\\zipFile\\";
		System.out.println(filePath);
	      ServletContext context = request.getServletContext();
	      File downloadFile = new File(filePath);
	        FileInputStream inputStream = new FileInputStream(downloadFile);
	        
	      String mimeType = context.getMimeType(filePath);
	        if (mimeType == null) {
	            // set to binary type if MIME mapping not found
	            mimeType = "application/octet-stream";
	        }
	        response.setContentType(mimeType);
	        response.setContentLength((int) downloadFile.length());
	        // set headers for the response
	        String headerKey = "Content-Disposition";
	        String headerValue = String.format("attachment; filename=\"%s\"",    downloadFile.getName());
	        response.setHeader(headerKey, headerValue);
	        
	     // get output stream of the response
	        OutputStream outStream = response.getOutputStream();
	 
	        byte[] buffer = new byte[4096];
	        int bytesRead = -1;
	 
	        // write bytes read from the input stream into the output stream
	        while ((bytesRead = inputStream.read(buffer)) != -1) {
	            outStream.write(buffer, 0, bytesRead);
	        }
	 
	        inputStream.close();
	        outStream.close();
		
	}
	public static void saveExcel(String imagesexceluploadpath,String fileName, MultipartFile bulkUploadFile, HttpServletRequest request, String ext) {
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
	public static List<DrawsPlayer> editPlayerListIndex(List<DrawsPlayer> listBean, List<DrawsPlayer> finalListBean) {
		int listSize = listBean.size();
		for(int index = 0; index < listSize; index++){
			Random rand = new Random();
			int num = rand.nextInt(listBean.size());
			finalListBean.add(listBean.get(num));
			listBean.remove(num);
		}
		return finalListBean;
	}

	private static int[] removeTheElement(int[] arr, int index) {

		if (arr == null || index < 0 || index >= arr.length) {

			return arr;
		}

		int[] anotherArray = new int[arr.length - 1];
		for (int i = 0, k = 0; i < arr.length; i++) {
			if (i == index) {
				continue;
			}
			anotherArray[k++] = arr[i];
		}
		return anotherArray;
	}
	
	private static int randomValueFromArray(int[] arr) {
		Random rand = new Random();
		return rand.nextInt(arr.length);
	}

	public static long getRankingId(List<RankCategoryBean> rankList, String rankName) {
		for (RankCategoryBean bean : rankList) {
			if (bean.getRankName().equalsIgnoreCase(rankName)) {
				return bean.getRankId();
			}
		}
		return 1;
	} 
}
