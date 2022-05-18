package com.yfactory.mes.proc.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yfactory.mes.proc.service.ProcService;

@Controller
public class ProcController {

	@Autowired
	private ProcService procService;



	@GetMapping("/ordermodal")
	public String loginModal() {
		return "/proc/procmodal/ordermodal";
	}
	
	@GetMapping("/procPlList")
	public String selectOrdersList() {
		
		return "proc/procPlList";
	}
	

}
