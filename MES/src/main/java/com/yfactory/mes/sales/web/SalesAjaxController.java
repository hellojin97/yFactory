package com.yfactory.mes.sales.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yfactory.mes.sales.service.SalesService;

@RestController
public class SalesAjaxController {

	@Autowired private SalesService salesService;
	
	@GetMapping("/salesOrder")
	public List<Map>  selectOrdersList() {
		
		return salesService.selectOrderList();
	}
	
	@GetMapping("/searchOrderList")
	public List<Map> searchOrderList(String pnm, String vnm,
			  String req1, String req2,
			  String res1, String res2) {
		
		return salesService.searchOrderList(pnm, vnm, req1, req2, res1, res2);
	}

}
