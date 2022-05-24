package com.yfactory.mes.common.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yfactory.mes.common.service.CommonService;

@Controller
public class CommonController {

	@Autowired private CommonService service;
	
	@RequestMapping("/userOrderForm")
	public String userOrderForm() {
		return "user/userOrderForm";
	}
}
