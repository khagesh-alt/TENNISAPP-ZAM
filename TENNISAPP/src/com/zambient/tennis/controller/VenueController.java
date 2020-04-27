package com.zambient.tennis.controller;


import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.JSONException;
import org.json.JSONObject;
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.zambient.tennis.bean.ActiveTournamentBean;
import com.zambient.tennis.bean.EmailTemplateBean;
import com.zambient.tennis.bean.FetchVenues;
import com.zambient.tennis.bean.LoginBean;
import com.zambient.tennis.bean.OrganiserBean;
import com.zambient.tennis.bean.OrganizerRegistartion;
import com.zambient.tennis.bean.ResetPasswordBean;
import com.zambient.tennis.bean.TournamentCategoryBean;
import com.zambient.tennis.bean.VenueAndCourtBean;
import com.zambient.tennis.bean.VenueBean;
import com.zambient.tennis.service.VenueService;
import com.zambient.tennis.util.AdminSession;
import com.zambient.tennis.util.GenerateSecurePassword;
import com.zambient.tennis.util.TennisMail;
import com.zambient.tennis.util.UserSession;

@RestController
public class VenueController {

	final static Logger log = Logger.getLogger(VenueController.class);
	@Autowired
	TennisMail tennisMail;
	@Autowired 
	private UserSession userSession;
	@Autowired 
	private AdminSession adminSession;
	
	@Value("${mail.from.username}")
	private String mailFromUsername;

	@Value("${mail.from.bccusername}")
	private String mailFromBccUsername;
	
	@Autowired
	VenueService venueService;
	@Value("${images.root.path}")
	private String imageRootPath;
	@Value("${images.retrival.path}")
	private String imagesRetrivalPath;
	
	@RequestMapping(value = "/playerView/addVenue", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String  addVenue(@RequestBody VenueBean venueBean, HttpServletRequest request, HttpServletResponse response){
		log.info("VenueController :: addVenue POST method" +venueBean);
		response.setContentType("application/json");
		response.setHeader("Access-Control-Allow-Origin","*");
		response.setHeader("value", "valid");
		String result =null;
		if(venueBean != null && venueBean.getVenue_name() != "" && venueBean.getVenue_location() != "" && venueBean.getNo_of_courts() > 0 && venueBean.getContact_mob() != ""
				&& venueBean.getContact_email() != "" && venueBean.getSport_type() != "")
		 result = venueService.addVenue(venueBean);
		else 
			result = "All fields are mandatory !";
		 return result;
	 }
	@RequestMapping(value = "/playerView/getVenues", method = RequestMethod.GET)
	public @ResponseBody List<FetchVenues> getVenues() {
		List<FetchVenues>venueList = venueService.getVenues();
	    return venueList;
	}
	@RequestMapping(value = "/addCourt", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	 public String  addCourt(@RequestBody String values) throws JSONException{
		log.info("VenueController :: addCourt POST method" +values);
		JSONObject addCourtJson = new JSONObject(values);
		String result = venueService.addCourt(addCourtJson);
		 return result;
	 }
	@RequestMapping(value = "/getVenueAndCourtDetails", method = RequestMethod.GET)
	public @ResponseBody List<VenueAndCourtBean> getVenueAndCourtDetails() {
		List<VenueAndCourtBean> venueAndCourtList = venueService.getVenueAndCourtDetails();
	    return venueAndCourtList;
	}
	@RequestMapping(value = "/playerView/organizerRegistration", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	 public String  organizerRegistration(@RequestBody OrganizerRegistartion organizerRegistartion, HttpServletRequest request, HttpServletResponse response){
		log.info("VenueController :: organizerRegistration POST method" +organizerRegistartion);
		response.setContentType("application/json");
		response.setHeader("Access-Control-Allow-Origin","*");
		response.setHeader("value", "valid");
		String result =null;
       int passwordLength = 10;
        String password = GenerateSecurePassword.generatePassword(passwordLength);
		System.out.println(password);
		organizerRegistartion.setPassword(password);
		organizerRegistartion.setRepassword(password);
		if(password != null && password != ""){
		 result = venueService.organizerRegistration(organizerRegistartion);
		 if(result == "Success"){
			 EmailTemplateBean emailTemplateBean = venueService.retrieveEmailTemplate("REGISTRATION");
			 String body = emailTemplateBean.getBody();
	         body=body.replace("{{User}}",organizerRegistartion.getName());
	         body=body.replace("{{userId}}",organizerRegistartion.getPhone());
	         body=body.replace("{{password}}",password);
			 body=body.replace("{{ResetPwdURL}}","http://1.186.104.23:1723/TENNISAPP/organiserlogin");
			 new SendEmail(mailFromUsername, "", organizerRegistartion.getMailId(), emailTemplateBean.getSubject(), body, tennisMail).start();
		 }
		}
		else{
			result = "Password And Repassword Should be Same";
		}
		 return result;
	 }
	@RequestMapping(value = "/playerView/getOrganiserList", method = RequestMethod.GET)
	public @ResponseBody List<OrganizerRegistartion> getOrganiserList() {
		List<OrganizerRegistartion> organiserList = venueService.getOrganiserList();
	    return organiserList;
	}
	@RequestMapping("/organizerLogin")  
    public RedirectView playerLogin(HttpServletRequest request,RedirectAttributes attributes,@RequestParam("orguserId") String orguserId,
    		@RequestParam("orgloginpassword") String orgloginpassword){
		log.info("VenuesController :: organizerLogin POST method");
		HttpSession adminSession = request.getSession(false);
		if(adminSession != null)
		adminSession.invalidate();
		LoginBean loginBean = new LoginBean();
		loginBean.setUserId(orguserId);
		loginBean.setPassword(orgloginpassword);
		OrganiserBean organiserLogin = null;
		boolean mobile = venueService.isOrganiserMobileExist(orguserId);
		if(!mobile){
			attributes.addFlashAttribute("message", "Mobile No. Does not Exist.");
		    return new RedirectView("organiserlogin");
		}else{
		if(loginBean !=null && loginBean.getPassword() != "" && loginBean.getUserId() != "")
		 organiserLogin = venueService.organizerLogin(loginBean);
		
		if(organiserLogin != null && organiserLogin.getPhone().equals(loginBean.getUserId())){
			 userSession.setOrganiserId(organiserLogin.getId().intValue());
			 //userSession.setPlayerId(organiserLogin.getId().intValue());
			 userSession.setName(organiserLogin.getName());
			 userSession.setPhone(organiserLogin.getPhone());
			 userSession.setLoginType(1);
			 userSession.setMailId(organiserLogin.getMailId());
			 userSession.setPassword(orgloginpassword);
			 log.info("Session"+userSession.getName());
			 return new RedirectView("tournamentList");
			 //return "redirect:/mytournaments";
		 }else{
			 attributes.addFlashAttribute("message", "Mobile No. and Password Doesn't match.");
			 return new RedirectView("organiserlogin");
		 }
		}
   }
	
@RequestMapping(value="/logout")
public RedirectView logout(HttpServletRequest request,RedirectAttributes attributes){
	try{
		HttpSession userSession = request.getSession(false);
		userSession.invalidate();
		attributes.addFlashAttribute("message", "Logout Sucessfully");
		return new RedirectView("organiserlogin");
	}catch(Exception e){
		e.printStackTrace();
		return new RedirectView("organiserlogin");
	}
} 
@RequestMapping(value="/playerlogout")
public RedirectView playerlogout(HttpServletRequest request,RedirectAttributes attributes){
	try{
		HttpSession userSession = request.getSession(false);
		userSession.invalidate();
		attributes.addFlashAttribute("message", "Logout Sucessfully");
		return new RedirectView("playerhome");
	}catch(Exception e){
		e.printStackTrace();
		return new RedirectView("playerhome");
	}
} 
@RequestMapping(value="/adminlogout")
public RedirectView adminlogout(HttpServletRequest request,RedirectAttributes attributes){
	System.out.println("adminlogout");
	try{
		HttpSession adminSession = request.getSession(false);
		adminSession.invalidate();
		attributes.addFlashAttribute("message", "Logout Sucessfully");
		return new RedirectView("superadmin");
	}catch(Exception e){
		e.printStackTrace();
		return new RedirectView("superadmin");
	}
} 


	@RequestMapping("/adminUserLogin")
	public RedirectView adminUserLogin(HttpServletRequest request, RedirectAttributes redirectAttributes,
			@RequestParam("userId") String userId) {
		log.info("VenueController.adminUserLogin");
		System.out.println("userId>> "+userId);
		HttpSession userSession = request.getSession(false);
		if(userSession != null)
		userSession.invalidate();
		String result = venueService.authenticateAdmin();
		if (result.equals(userId)) {
			adminSession.setUserId(result);
			adminSession.setLoginId(Long.parseLong("123"));
			return new RedirectView("academy");
		} else {
			redirectAttributes.addFlashAttribute("message", "Please Enter valid Admin ID");
			return new RedirectView("superadmin");
		}
	}
	@RequestMapping("/changeOrganisePassword")  
    public String changeOrganisePassword(HttpServletRequest request,
    		@RequestParam("oldpwd") String oldpwd,@RequestParam("newpwd") String newpwd,@RequestParam("retypepwd") String retypepwd){
		String result = null;
		if(!(oldpwd.trim().equals(userSession.getPassword()))){
			 result ="Current Password Wrong, Please Try Again";
		}
	    if(!(retypepwd.equals(newpwd))){
	    	result =  "New Password and Retype password should be match";
		}
	    if((retypepwd.equals(newpwd) && (oldpwd.trim().equals(userSession.getPassword())))){
	    	result = venueService.changeOrganisePassword(userSession.getOrganiserId(),newpwd.trim());
	    	HttpSession userSession = request.getSession(false);
	    	if(userSession != null)
			userSession.invalidate();
	    }
		return result;
	}
	@RequestMapping(value = "/playerView/editOrganiserByID", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	 public String  editOrganiserByID(@RequestBody OrganizerRegistartion organizerRegistartion, HttpServletRequest request, HttpServletResponse response){
		log.info("VenueController :: editOrganiserByID POST method" +organizerRegistartion);
		response.setContentType("application/json");
		response.setHeader("Access-Control-Allow-Origin","*");
		response.setHeader("value", "valid");
		String result =null;
		 result = venueService.editOrganiserByID(organizerRegistartion);
		 return result;
	 }
	@RequestMapping(value = "/playerView/editAcademyByID", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String  editAcademyByID(@RequestBody FetchVenues venueBean, HttpServletRequest request, HttpServletResponse response){
		log.info("VenueController :: editAcademyByID POST method" +venueBean);
		response.setContentType("application/json");
		response.setHeader("Access-Control-Allow-Origin","*");
		response.setHeader("value", "valid");
		String result =null;
		if(venueBean != null && venueBean.getVenueName() != "" && venueBean.getVenueLocation() != "" && venueBean.getContactMob() != ""
				&& venueBean.getContactEmail() != "")
		 result = venueService.editAcademyByID(venueBean);
		else 
			result = "All fields are mandatory...";
		 return result;
	 }
	@RequestMapping("/organiserLoginByMobile")  
    public RedirectView organiserLoginByMobile(HttpServletRequest request,RedirectAttributes attributes,@RequestParam("userid") String orguserId,
    		@RequestParam("loginpwd") String orgloginpassword){
		log.info("VenuesController :: organiserLoginByMobile POST method");
		System.out.println("id:: "+orguserId+"  :: "+orgloginpassword);
		HttpSession adminSession = request.getSession(false);
		if(adminSession != null)
		adminSession.invalidate();
		LoginBean loginBean = new LoginBean();
		loginBean.setUserId(orguserId);
		loginBean.setPassword(orgloginpassword);
		OrganiserBean organiserLogin = null;
		if(loginBean !=null && loginBean.getPassword() != "" && loginBean.getUserId() != "")
		 organiserLogin = venueService.organizerLogin(loginBean);
		
		if(organiserLogin != null && organiserLogin.getPhone().equals(loginBean.getUserId())){
			 userSession.setOrganiserId(organiserLogin.getId().intValue());
			 userSession.setName(organiserLogin.getName());
			 userSession.setPhone(organiserLogin.getPhone());
			 userSession.setLoginType(1);
			 userSession.setMailId(organiserLogin.getMailId());
			 userSession.setPassword(orgloginpassword);
			 log.info("Session"+userSession.getName());
			 return new RedirectView("mobileUpdateScore");
			 //return "redirect:/upcomingtournament";
		 }else{
			 attributes.addFlashAttribute("message", "Please Enter Valid Mobile No. And Password");
			 return new RedirectView("mobileOrganiserlogin");
		 }
   }
	@RequestMapping(value = "/playerView/activeORInActiveTournaments", method = RequestMethod.GET)
	public @ResponseBody List<ActiveTournamentBean> activeORInActiveTournaments() {
		List<ActiveTournamentBean> tournamentList = venueService.activeORInActiveTournaments();
	    return tournamentList;
	}
	@RequestMapping(value = "playerView/setActiveOrInActive", method = RequestMethod.GET)
	public @ResponseBody String setActiveOrInActive(HttpServletRequest request,
			@RequestParam("tournamentid") int tournamentid,
    		@RequestParam("activeVal") int activeVal) {
		String result = venueService.setActiveOrInActive(tournamentid,activeVal);
	    return result;
	}

	@RequestMapping(value = "/persistAcademyByOrganiser", method = RequestMethod.POST)
	public @ResponseBody String persistAcademyByOrganiser(HttpServletRequest request,HttpServletResponse response,
			@RequestParam("venueName") String venueName,@RequestParam("venueAddress") String venueAddress,@RequestParam("noOfCourts") int noOfCourts,
			@RequestParam("mobile") String mobile,@RequestParam("email") String email,@RequestParam("sportType") String sportType,@RequestParam("light") int light) {
		System.out.println("VenueController.persistAcademy()");
		VenueBean bean = new VenueBean();
		bean.setVenue_name(venueName);
		bean.setVenue_location(venueAddress);
		bean.setNo_of_courts(noOfCourts);
		bean.setContact_mob(mobile);
		bean.setContact_email(email);
		bean.setSport_type(sportType);
		bean.setVenue_light(light);
		String result = null;
		if(bean !=null)
			result = venueService.persistAcademyByOrganiser(bean);
		
		return result;
		// your code goes here
	}
	@RequestMapping(value = "allCategoryListForATournament", method = RequestMethod.GET)
	public @ResponseBody List<TournamentCategoryBean> allCategoryListForATournament(HttpServletRequest request,RedirectAttributes attributes,
    		@RequestParam("tournamentId") int tournamentId) {
		List<TournamentCategoryBean> tournamentCatList = null;
		tournamentCatList = venueService.allCategoryListForATournament(tournamentId);
	    return tournamentCatList;
	}
	@RequestMapping("forgotPassword")  
    public String forgotOrganiserPassword(HttpServletRequest request,@RequestParam("mobile") String mobile){
		String result = null;
		if(mobile == null || mobile.length() <=0){
			 result ="Mobile Should Not be empty";
		}
		try{
			OrganiserBean organiserBean = venueService.authenticateUser(mobile);
		if(organiserBean.getPhone() != null){
			String token = UUID.randomUUID().toString().replaceAll("-", "");
			venueService.logResetPassword(organiserBean.getMailId(),token,organiserBean.getPhone(),1);
			StringBuffer url = ((HttpServletRequest) request).getRequestURL();
	        String uri = "/showResetPassword?token="+token;
	        String passwordresetUrl = url.substring(0,url.lastIndexOf("/"))+uri;
	        EmailTemplateBean emailTemplateBean = venueService.retrieveEmailTemplate("FORGOT_PASSWORD");
	        String body = emailTemplateBean.getBody();
			body=body.replace("{{Mobile}}",organiserBean.getPhone());
			body=body.replace("{{User}}","");
			body=body.replace("{{ResetPwdURL}}",passwordresetUrl);
			log.info("Invoking the email service thread");
			new SendEmail(mailFromUsername, "", organiserBean.getMailId(), emailTemplateBean.getSubject(), body, tennisMail).start();
			result = "An email sent to your registered emailId, Please check your mail and login";
			
		}else{
			 result ="You are not a valid user.";
		}
		
		}catch(Exception e){
			e.printStackTrace();
			result="Something went wrong, an error occured while processing your request.";
		}
		return result;
	}
	@RequestMapping("/showResetPassword")  
    public ModelAndView showResetPassword(Model model, HttpServletRequest request,RedirectAttributes redirectAttributes) { 
		log.info("VenuController.showResetPassword");
		String token = request.getParameter("token");
		
		ResetPasswordBean resetbean = null;
		if(token != null) 
			resetbean = validateToken(token,1);
		if(resetbean != null){
			model.addAttribute("resetbean", resetbean);
		}else{
			model.addAttribute("message","Reset Password link has been expired.");
			return new ModelAndView("organiserlogin");
		}
		//model.addAttribute("message",resetbean.getEmail());
		return new ModelAndView("resetPassword");
    }
	public ResetPasswordBean validateToken(String token, int logintype){
		return venueService.validateToken(token, logintype);
	}
	@RequestMapping("resetPassword")  
    public String resetPassword(RedirectAttributes attributes, HttpServletRequest request, @RequestParam("forgottoken") String forgottoken, 
    		@RequestParam("forgotMobile") String forgotMobile,@RequestParam("forgotnewpwd") String newpwd, @RequestParam("forgotrepwd") String retypepwd) { 
		log.info("VeneController.resetPassword"+forgottoken+" forgotMobile::: "+forgotMobile);
		//String token = resetbean.getToken();
		ResetPasswordBean resetbean2 = validateToken(forgottoken,1);
		if(forgottoken != null && resetbean2 != null && resetbean2.getMobile().equals(forgotMobile)){
			venueService.resetPassword(forgotMobile,newpwd,1);
			//attributes.addFlashAttribute("message", "Password has been updated, Please Login.");
			return "Password has been updated, Please Login.";
		}
		 else
		   return "Something went wrong";
    }
	
	// Player Forget Password
	@RequestMapping("playerforgotPassword")  
    public String playerforgotPassword(HttpServletRequest request,@RequestParam("mobile") String mobile){
		System.out.println("mobile ::: "+mobile);
		String result = null;
		if(mobile == null || mobile.length() <=0){
			 result ="Mobile Should Not be empty";
		}
		try{
			OrganiserBean organiserBean = venueService.authenticatePlayerUser(mobile);
		if(organiserBean.getPhone() != null){
			String token = UUID.randomUUID().toString().replaceAll("-", "");
			venueService.logResetPassword(organiserBean.getMailId(),token,organiserBean.getPhone(),0);
			StringBuffer url = ((HttpServletRequest) request).getRequestURL();
	        String uri = "/showPlayerResetPassword?token="+token;
	        String passwordresetUrl = url.substring(0,url.lastIndexOf("/"))+uri;
	        EmailTemplateBean emailTemplateBean = venueService.retrieveEmailTemplate("FORGOT_PASSWORD");
	        String body = emailTemplateBean.getBody();
			body=body.replace("{{Mobile}}",organiserBean.getPhone());
			body=body.replace("{{User}}","");
			body=body.replace("{{ResetPwdURL}}",passwordresetUrl);
			log.info("Invoking the email service thread");
			new SendEmail(mailFromUsername, "", organiserBean.getMailId(), emailTemplateBean.getSubject(), body, tennisMail).start();
			result = "An email sent to your registered emailId, Please check your mail and login";
			
		}else{
			 result ="You are not a valid user.";
		}
		
		}catch(Exception e){
			e.printStackTrace();
			result="Something went wrong, an error occured while processing your request.";
		}
		return result;
	}
	@RequestMapping("/showPlayerResetPassword")  
    public ModelAndView showPlayerResetPassword(Model model, HttpServletRequest request,RedirectAttributes redirectAttributes) { 
		log.info("VenuController.showPlayerResetPassword");
		String token = request.getParameter("token");
		
		ResetPasswordBean resetbean = null;
		if(token != null) 
			resetbean = validateToken(token,0);
		if(resetbean != null){
			model.addAttribute("resetbean", resetbean);
		}else{
			model.addAttribute("message","Reset Password link has been expired.");
			return new ModelAndView("playerhome");
		}
		//model.addAttribute("message",resetbean.getEmail());
		return new ModelAndView("playerResetPassword");
    }
	
	@RequestMapping("playerResetPassword")  
    public String playerResetPassword(RedirectAttributes attributes, HttpServletRequest request, @RequestParam("forgottoken") String forgottoken, 
    		@RequestParam("forgotMobile") String forgotMobile,@RequestParam("forgotnewpwd") String newpwd, @RequestParam("forgotrepwd") String retypepwd) { 
		log.info("VeneController.resetPassword"+forgottoken+" forgotMobile::: "+forgotMobile);
		//String token = resetbean.getToken();
		ResetPasswordBean resetbean2 = validateToken(forgottoken,0);
		if(forgottoken != null && resetbean2 != null && resetbean2.getMobile().equals(forgotMobile)){
			venueService.resetPlayerPassword(forgotMobile,newpwd,0);
			//attributes.addFlashAttribute("message", "Password has been updated, Please Login.");
			return "Password has been updated, Please Login.";
		}
		 else
		   return "Something went wrong";
    }
	
	
	
	
}
