package com.zambient.tennis.util;

import java.io.Serializable;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;

@Component
@Scope(value="session",proxyMode=ScopedProxyMode.TARGET_CLASS)
public class TournamentSession implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Long tournamentid;

	public Long getTournamentid() {
		return tournamentid;
	}

	public void setTournamentid(Long tournamentid) {
		this.tournamentid = tournamentid;
	}

}
