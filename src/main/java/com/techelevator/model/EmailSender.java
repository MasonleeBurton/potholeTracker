package com.techelevator.model;

import org.simplejavamail.email.Email;
import org.simplejavamail.email.EmailBuilder;
import org.simplejavamail.mailer.Mailer;
import org.simplejavamail.mailer.MailerBuilder;
import org.simplejavamail.springsupport.SimpleJavaMailSpringSupport;
import org.springframework.beans.factory.annotation.Autowired;


public class EmailSender {

public void sendEmail(String userEmail){	
	

Email email = EmailBuilder.startingBlank()
    .from("potholetracker1", "potholetracker1@gmail.com")
    .to("userName", userEmail)
    .withSubject("The pothole you reported has been repaired!")
    .withPlainText("We are happy to inform you that the pot hole you reported has been repaired. Happy speeding!!!")
    .buildEmail();

MailerBuilder
.withSMTPServer("smtp.gmail.com", 25, "potholetracker1", "S1s2s3s4")
.buildMailer().sendMail(email);

}
}