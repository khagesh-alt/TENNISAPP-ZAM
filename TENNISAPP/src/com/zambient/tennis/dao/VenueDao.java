package com.zambient.tennis.dao;

import java.util.List;

import org.json.JSONObject;

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

public interface VenueDao {

	public String addVenue(VenueBean venueBean);
	public String addCourt(JSONObject addCourtJson);
	public List<FetchVenues> getVenues();
	public List<VenueAndCourtBean> getVenueAndCourtDetails();
	public String organizerRegistration(OrganizerRegistartion organizerRegistartion);
	public List<OrganizerRegistartion> getOrganiserList();
	public OrganiserBean organizerLogin(LoginBean loginBean);
	public EmailTemplateBean retrieveEmailTemplate(String type);
	public String authenticateAdmin();
	public String changeOrganisePassword(int orgId,String pwd);
	public String editOrganiserByID(OrganizerRegistartion organizerRegistartion);
	public String editAcademyByID(FetchVenues venueBean);
	public List<ActiveTournamentBean> activeORInActiveTournaments();
	public String setActiveOrInActive(int tournamentId, int activeVal);
	public String persistAcademyByOrganiser(VenueBean bean);
	public List<TournamentCategoryBean> allCategoryListForATournament(int tournamentId);
	public OrganiserBean authenticateUser(String mobile);
	public void logResetPassword(String email,String token, String phone, int logintype);
	public ResetPasswordBean validateToken(String token, int logintype);
	public void resetPassword(String mobile, String password, int logintype);
	public OrganiserBean authenticatePlayerUser(String mobile);
	public void resetPlayerPassword(String mobile, String password, int logintype);
	public boolean isOrganiserMobileExist(String mobile);
}
