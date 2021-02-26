package _01_register.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import mail.service.MailService;

@Controller
public class MailController {

	@Autowired
	ServletContext servletContext;
	
	@Autowired
	MailService mailService ;
	
	
	
	
}
