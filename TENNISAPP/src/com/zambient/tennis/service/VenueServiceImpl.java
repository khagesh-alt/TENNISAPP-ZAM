package com.zambient.tennis.service;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
import com.zambient.tennis.dao.VenueDao;

@Service ("venueService")
public class VenueServiceImpl implements VenueService{

	@Autowired
	VenueDao venueDao;

	@Override
	public String addVenue(VenueBean venueBean) {
		return venueDao.addVenue(venueBean);
	}

	@Override
	public String addCourt(JSONObject addCourtJson) {
		return venueDao.addCourt(addCourtJson);
	}
	@Override
	public List<FetchVenues> getVenues() {
		// TODO Auto-generated method stub
		return venueDao.getVenues();
	}

	@Override
	public List<VenueAndCourtBean> getVenueAndCourtDetails() {
		// TODO Auto-generated method stub
		return venueDao.getVenueAndCourtDetails();
	}

	@Override
	public String organizerRegistration(OrganizerRegistartion organizerRegistartion) {
		// TODO Auto-generated method stub
		return venueDao.organizerRegistration(organizerRegistartion);
	}

	@Override
	public OrganiserBean organizerLogin(LoginBean loginBean) {
		// TODO Auto-generated method stub
		return venueDao.organizerLogin(loginBean);
	}

	@Override
	public List<OrganizerRegistartion> getOrganiserList() {
		// TODO Auto-generated method stub
		return venueDao.getOrganiserList();
	}

	@Override
	public EmailTemplateBean retrieveEmailTemplate(String type) {
		// TODO Auto-generated method stub
		return venueDao.retrieveEmailTemplate(type);
	}

	@Override
	public String authenticateAdmin() {
		// TODO Auto-generated method stub
		return venueDao.authenticateAdmin();
	}

	@Override
	public String changeOrganisePassword(int orgId, String pwd) {
		// TODO Auto-generated method stub
		return venueDao.changeOrganisePassword(orgId, pwd);
	}

	@Override
	public String editOrganiserByID(OrganizerRegistartion organizerRegistartion) {
		// TODO Auto-generated method stub
		return venueDao.editOrganiserByID(organizerRegistartion);
	}

	@Override
	public String editAcademyByID(FetchVenues venueBean) {
		// TODO Auto-generated method stub
		return venueDao.editAcademyByID(venueBean);
	}

	@Override
	public List<ActiveTournamentBean> activeORInActiveTournaments() {
		// TODO Auto-generated method stub
		return venueDao.activeORInActiveTournaments();
	}

	@Override
	public String setActiveOrInActive(int tournamentId, int activeVal) {
		// TODO Auto-generated method stub
		return venueDao.setActiveOrInActive(tournamentId, activeVal);
	}

	@Override
	public String persistAcademyByOrganiser(VenueBean bean) {
		// TODO Auto-generated method stub
		return venueDao.persistAcademyByOrganiser(bean);
	}

	@Override
	public List<TournamentCategoryBean> allCategoryListForATournament(int tournamentId) {
		// TODO Auto-generated method stub
		return venueDao.allCategoryListForATournament(tournamentId);
	}

	@Override
	public OrganiserBean authenticateUser(String mobile) {
		// TODO Auto-generated method stub
		return venueDao.authenticateUser(mobile);
	}

	@Override
	public void logResetPassword(String email, String token, String phone, int logintype) {
		// TODO Auto-generated method stub
		venueDao.logResetPassword(email, token, phone, logintype);
	}

	@Override
	public ResetPasswordBean validateToken(String token, int logintype) {
		// TODO Auto-generated method stub
		return venueDao.validateToken(token, logintype);
	}

	@Override
	public void resetPassword(String mobile, String password, int logintype) {
		// TODO Auto-generated method stub
		venueDao.resetPassword(mobile, password, logintype);
	}

	@Override
	public OrganiserBean authenticatePlayerUser(String mobile) {
		// TODO Auto-generated method stub
		return venueDao.authenticatePlayerUser(mobile);
	}

	@Override
	public void resetPlayerPassword(String mobile, String password, int logintype) {
		// TODO Auto-generated method stub
		venueDao.resetPlayerPassword(mobile, password, logintype);
		
	}

	@Override
	public boolean isOrganiserMobileExist(String mobile) {
		// TODO Auto-generated method stub
		return venueDao.isOrganiserMobileExist(mobile);
	}
	
}
