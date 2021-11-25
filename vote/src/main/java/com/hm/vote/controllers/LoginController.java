package com.hm.vote.controllers;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hm.vote.services.LoginService;
import com.hm.vote.utils.ServiceValidationUtils;
import com.hm.vote.vo.Admin;


@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private LoginService loginService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String login(Model model) {
		logger.info("Welcome home! The client locale is {}.", "");

		model.addAttribute("admin", new Admin());

		return "login";
	}

	@RequestMapping(value = "/dashboard", method = RequestMethod.POST)
	public String loginDone(Model model, @ModelAttribute("admin") Admin admin) {
		logger.info("Username  " + admin.getEmail());
		Boolean result;
		String errorMessage="";
		if (ServiceValidationUtils.isEmptyStringTrim(admin.getEmail()) || 
				ServiceValidationUtils.isEmptyStringTrim(admin.getPassword())) {
			errorMessage="Please provide your username and paswword";
			model.addAttribute("admin", admin);
			model.addAttribute("errorMessage", errorMessage);
			
			return "login";
		}

		result = loginService.checkAdminLoginCred(admin);
		
		if (result == false) {
			model.addAttribute("errorMessage",  "Wrong username or password");
			model.addAttribute("admin", admin);
			return "login";
		}
		
		model.addAttribute("home", "active");
		model.addAttribute("dashboard", "active");

		return "index";
	}

}
