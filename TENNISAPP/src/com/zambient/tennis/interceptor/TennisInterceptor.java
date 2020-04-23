package com.zambient.tennis.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.FlashMapManager;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.zambient.tennis.util.AdminSession;
import com.zambient.tennis.util.UserSession;

public class TennisInterceptor implements HandlerInterceptor{
	final static Logger log = Logger.getLogger(TennisInterceptor.class);
	@Autowired 
	private UserSession userSession;
	@Autowired 
	private AdminSession adminSession;

	@Override
	public boolean preHandle(HttpServletRequest request,
            HttpServletResponse response, Object handler) throws Exception {
		
		 String uri = request.getRequestURI();
		
		 log.info("uri> "+uri);
		 log.info("Usersession Player Name>> "+userSession.getName()+">> "+adminSession.getUserId());
		if(userSession !=null && userSession.getLoginType() != null && userSession.getPhone() !=null &&  !(userSession.getName().trim().equals(""))
				&& !uri.startsWith("/TENNISAPP/academy") && !uri.startsWith("/TENNISAPP/activeTournaments") && userSession.getLoginType() != 0){
			
			System.out.println("insideadminSession.............."+adminSession.getUserId());
			return true;
		}else if((adminSession !=null && adminSession.getUserId() != null && !(adminSession.getUserId().trim().equals(""))) && (uri.startsWith("/TENNISAPP/playerView") || uri.startsWith("/TENNISAPP/academy") || uri.startsWith("/TENNISAPP/activeTournaments"))){
			return true;
		}else if(uri.startsWith("/TENNISAPP/getProfile") && userSession.getPhone() !=null && userSession.getLoginType() == 0){
			return true;
		}
		else{
			 if(uri.startsWith("/TENNISAPP/upcomingtournament") || uri.startsWith("/TENNISAPP/getUpcommingTournament") || uri.startsWith("/TENNISAPP/playerhome") || uri.startsWith("/TENNISAPP/showTournament") || uri.startsWith("/TENNISAPP/view_list") || uri.startsWith("/TENNISAPP/playerView/addSecondPlayer")
					 || uri.startsWith("/TENNISAPP/playerView") || uri.startsWith("/TENNISAPP/adminlogout") || uri.startsWith("/TENNISAPP/view_academy_list") 
					 || uri.startsWith("/TENNISAPP/playerlogout") || uri.startsWith("/TENNISAPP/registerPlayerForTournamentCategory") || uri.startsWith("/TENNISAPP/redirectToShowTournament")){
				 System.out.println("Players:::::::");
				 return true;
			}else{
			// create a flashmap
			FlashMap flashMap = new FlashMap();
			// store the message
			//flashMap.put("message", "Session Expired, Please Login.");
			// create a flashmapMapManger with `request`
			FlashMapManager flashMapManager = RequestContextUtils.getFlashMapManager(request);
			// save th e flash map data in session with falshMapManager
			flashMapManager.saveOutputFlashMap(flashMap, request, response);
			if(uri.startsWith("/TENNISAPP/logout"))
			response.sendRedirect("organiserlogin");
			else
				response.sendRedirect("playerhome");
			return false;
		   }
		//return false;
	   }
	}
	@Override
	public void afterCompletion(HttpServletRequest request,
            HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest request,
            HttpServletResponse response, Object handler,
            ModelAndView modelAndView)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
}
