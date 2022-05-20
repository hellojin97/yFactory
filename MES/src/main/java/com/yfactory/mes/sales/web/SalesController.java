package com.yfactory.mes.sales.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yfactory.mes.sales.service.SalesService;

@Controller
public class SalesController {

	@Autowired private SalesService salesService;
	
	@RequestMapping("/orderList")
	public String  OrderList() {
		return "sales/orderList";
	}
	
	@RequestMapping("/bomList")
	public String BomList() {
		return "sales/bomList";
	}

	//완제품LOT재고조회폼
	@RequestMapping("/prodLotForm")
	public String prodLotForm() {
		return "sales/prodLotForm";
	}
	
	//완제품modal호출
	@RequestMapping("/prodModal")
	public String prodModal() {
		return "sales/salesModal/prodModal";
	}	
	
	//업체명modal호출
	@RequestMapping("/salesVenderModal")
	public String salesVenderModal() {
		return "sales/salesModal/vdrModal";
	}
	
	//입/출고 관리
	@RequestMapping("/prodWrnote")
	public String prodWrnote() {
		return "sales/prodWrnote";
	}
	
	//출고관리
	@RequestMapping("/prodRelease")
	public String prodRelease() {
		return "sales/prodRelease";
	}
	
	//출고관리 modal호출
	@RequestMapping("/releaseModal")
	public String releaseModal() {
		return "sales/salesModal/releaseModal";
	}

}
