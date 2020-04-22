package com.zambient.tennis.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class JspRequestController {

	@RequestMapping("/upcomingtournament")
    public ModelAndView upcomingtournament(Model model, HttpServletRequest request) { 
		   return new ModelAndView("upcomingtournament", "title", "upcomingtournament  Page");  
      
    }
    @RequestMapping("/tournament")
    public ModelAndView tournament(Model model, HttpServletRequest request) { 
		   return new ModelAndView("tournament", "title", "tournament  Page");  
      
    }
    @RequestMapping("/login")
    public ModelAndView login() { 
		   return new ModelAndView("login", "title", "login  Page");  
      
    }
    
    @RequestMapping("/superadmin")
    public ModelAndView organiser(Model model, HttpServletRequest request) { 
		   return new ModelAndView("organiser", "title", "organiser  Page");  
      
    }
    @RequestMapping("/academy")
    public ModelAndView academy(Model model, HttpServletRequest request) { 
		   return new ModelAndView("academy", "title", "academy  Page");  
      
    }
    @RequestMapping("/mytournaments")
    public ModelAndView mytournaments(Model model, HttpServletRequest request) { 
		   return new ModelAndView("mytournaments", "title", "mytournaments  Page");  
      
    }
    @RequestMapping("/mobileOrganiserlogin")
    public ModelAndView mobileOrganiserlogin(Model model, HttpServletRequest request) { 
		   return new ModelAndView("mobileOrganiserlogin", "title", "mobileOrganiserlogin  Page");  
      
    }
    @RequestMapping("/mobileUpdateScore")
    public ModelAndView mobileUpdateScore(Model model, HttpServletRequest request) { 
		   return new ModelAndView("mobileUpdateScore", "title", "mobileUpdateScore  Page");  
      
    }
    @RequestMapping("/updateScore")
    public ModelAndView updateScore(Model model, HttpServletRequest request) { 
		   return new ModelAndView("updateScore", "title", "updateScore  Page");  
      
    }
    @RequestMapping("/activeTournaments")
    public ModelAndView activeTournaments(Model model, HttpServletRequest request) { 
		   return new ModelAndView("activeTournaments", "title", "activeTournaments  Page");  
      
    }
    @RequestMapping("/organiserlogin")
    public ModelAndView organiserlogin(Model model, HttpServletRequest request) { 
		   return new ModelAndView("organiserlogin", "title", "organiserlogin  Page");  
      
    }
    @RequestMapping("/createtournament")
    public ModelAndView createtournament(Model model, HttpServletRequest request) { 
		   return new ModelAndView("createTournament", "title", "createTournament  Page");  
      
    }
    @RequestMapping("/playerhome")
    public ModelAndView playerhome(Model model, HttpServletRequest request) { 
		   return new ModelAndView("playerhome", "title", "playerhome  Page");  
      
    }
    @RequestMapping("/showTournament")
    public ModelAndView showTournament(Model model, HttpServletRequest request) {
    	
		   return new ModelAndView("showTournament", "title", "showTournament  Page");  
      
    }
    @RequestMapping("/tournamentList")
    public ModelAndView tournamentList(Model model, HttpServletRequest request) {
    	
		   return new ModelAndView("tournamentList", "title", "tournamentList  Page");  
      
    }
    @RequestMapping("/view_list")
    public ModelAndView view_list(Model model, HttpServletRequest request) {
    	
		   return new ModelAndView("view_list", "title", "view_list  Page");  
      
    }
    @RequestMapping("/view_academy_list")
    public ModelAndView view_academy_list(Model model, HttpServletRequest request) {
    	
		   return new ModelAndView("view_academy_list", "title", "view_academy_list  Page");  
      
    }
    /*@RequestMapping("/resetPassword")
    public ModelAndView resetPassword(Model model, HttpServletRequest request) { 
		   return new ModelAndView("resetPasswordBaseLayout", "title", "resetPasswordBaseLayout  Page");  
      
    }*/
}
