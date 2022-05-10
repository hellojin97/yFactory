package com.yfactory.mes;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	
	@RequestMapping("/")
	public String home() {
		
		
		return "common/home";
	}
	
	@RequestMapping("/home.do")
	public String home(Model mo) {
		return "common/home";
	}
	
}
