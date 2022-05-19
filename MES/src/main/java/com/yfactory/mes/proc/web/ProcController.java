package com.yfactory.mes.proc.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.yfactory.mes.proc.service.ProcService;

@Controller
public class ProcController {

	@Autowired private ProcService procService;



	
	@GetMapping("/procPlList")
	public String selectOrdersList() {
		
		return "proc/procPlList";
	}
	

	
	// 주문서목록 모달
	@GetMapping("/ordermodal")
	public String loginModal() {
		return "/proc/procmodal/ordermodal";
	}
	// 제품목록 모달
	@GetMapping("/prdmodal")
	public String ProductSelect(){
		return "/proc/procmodal/prdmodal";
	}
	

}
