package com.hm.vote.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;



@Controller
public class TestController {
	
	@GetMapping("/test")
	public String getTest1() {
		
		return "hello";
		
	}

	@GetMapping("/welcome")
	public String getTest() {
		
		return "hello";
		
	}
	
	
	
	

}
