package com.yfactory.mes.sales.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yfactory.mes.sales.service.SalesService;

@Controller
public class SalesController {

	@Autowired private SalesService salesService;
	
	@RequestMapping("/selectOrdersList.do")
	public String  selectOrdersList() {
		System.out.println(salesService.selectOrderList());
		return "common/home";
	}

}
