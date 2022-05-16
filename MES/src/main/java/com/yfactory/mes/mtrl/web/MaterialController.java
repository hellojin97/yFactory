package com.yfactory.mes.mtrl.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yfactory.mes.mtrl.service.MtrlService;

@Controller
public class MaterialController {
	@Autowired MtrlService service;
	
	@RequestMapping("/orderForm")
	public String orderForm() {
		
		return "material/orderForm";
	}
	@GetMapping("/order")
	@ResponseBody
	public List<Map> order() {
		
		return service.selectPl();
	}
}
 