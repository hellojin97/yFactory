package com.yfactory.mes.sales.web;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class SalesController {

	
	
	@RequestMapping("/orderList")
	public String  OrderList() {
		return "sales/orderList";
	}
	
	@RequestMapping("/bomList")
	public String BomList() {
		return "sales/bomList";
	}
	
	@RequestMapping("/bomList2")
	public String BomList2() {
		return "sales/bomList2";
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
	
	//완제품 안전재고
	@RequestMapping("/prodSafety")
	public String prodSafety() {
		return "sales/prodSafety";
	}

}
