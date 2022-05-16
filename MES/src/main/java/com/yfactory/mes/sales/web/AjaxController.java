package com.yfactory.mes.sales.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yfactory.mes.sales.service.SalesService;

@RestController
public class AjaxController {

	@Autowired private SalesService salesService;
	
	@GetMapping("/order")
	public List<Map>  selectOrdersList() {
		
		return salesService.selectOrderList();
	}

}
