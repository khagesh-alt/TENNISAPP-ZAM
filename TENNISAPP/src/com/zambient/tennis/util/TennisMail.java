package com.zambient.tennis.util;


import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class TennisMail {
	final static Logger log = Logger.getLogger(TennisMail.class);
	private JavaMailSender mailSender;
	
	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}
	
	public boolean sendMail(String from, String bcc, String to, String subject, String msg) {
		//log.info("from> "+from+" bcc> "+bcc+" to> "+to+" subject> "+subject+" msg> "+msg);
		try{  
	        MimeMessage message = mailSender.createMimeMessage();  
	  
	        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");  
	        helper.setFrom(from);  
	        if(!bcc.trim().equals(""))
	        	helper.setBcc(bcc);
	        helper.setTo(to);  
	        helper.setSubject(subject);  
	        helper.setText(msg,true);
	  
	        mailSender.send(message); 
	        log.info("After calling >>  mailSender.send(message); ");
	        return true;
	        }catch(MessagingException e){
	        	log.info("MessagingException>> "+e.getMessage());
	        	e.printStackTrace();
	        	return false;
	        }  
	  } 
}
