package com.yfactory.mes;

import java.util.Locale;

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
	
	@RequestMapping("/loginForm.do")
	public String loginForm() {
		return "loginForm";
	}
	
	@RequestMapping("/calendar")
	public String calendar(Locale lc) {
		return "toast/ui/calendar";
	}
	@RequestMapping("/modal")
	public String modal(Locale lc) {
		return "toast/modal";
	}
	@RequestMapping("/alert")
	public String alert(Locale lc) {
		return "toast/alert";
	}
	
	@RequestMapping("/toast")
	public String toast(Locale lc) {
		return "toast/home";
	}
}
