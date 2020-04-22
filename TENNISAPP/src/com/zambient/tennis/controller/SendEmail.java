package com.zambient.tennis.controller;


import org.apache.log4j.Logger;

import com.zambient.tennis.util.TennisMail;

public class SendEmail extends Thread {
	final static Logger log = Logger.getLogger(SendEmail.class);
		private Thread t;
	   private String mailFromUsername;
	   private String bccEmail;
	   private String toEmail ;
	   private String subject;
	   private String message;
	   private TennisMail tennisMail;
	   SendEmail(String mailFromUsername, String bccEmail, String toEmail, String subject, String msg, TennisMail tennisMail){
		   System.out.println("toEmail>> "+toEmail);
	       this.mailFromUsername=mailFromUsername;
	       this.bccEmail=bccEmail;
	       this.toEmail=toEmail;
	       this.subject=subject;
	       this.message=msg;
	       this.tennisMail=tennisMail;
	       log.info("Creating thread " +  subject );
	       log.info("mailFromUsername> "+mailFromUsername+" bccEmail> "+bccEmail+" toEmail> "+toEmail+" msg> "+msg+" tennisMail> "+tennisMail);
	   }
	   public void run() {
		   log.info("Running " +  subject );
	      try {
	    	  //sendMail(String from, String cc, String to, String subject, String msg)
	    	  tennisMail.sendMail(mailFromUsername, bccEmail, toEmail, subject, message);
	     } catch (Exception e) {
	    	 log.info("Thread " +  subject + " interrupted."+e);
	     }
	      log.info("Thread " +  subject + " exiting.");
	   }
	   
	   public void start ()
	   {
		   log.info("Starting " +  subject );
	      if (t == null)
	      {
	         t = new Thread (this, subject);
	         t.start ();
	      }
	   }

	
	
}	
