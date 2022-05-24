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
	
	//발주등록폼
	@RequestMapping("/mtrlOrderForm")
	public String mtrlOrderForm() {
		
		return "material/mtrlOrderForm";
	}
	//발주조회폼
	@RequestMapping("/mtrlListForm")
	public String mtrlLIstForm() {
		return "material/mtrlListForm";
	}
	
	//입고관리,등록
	@RequestMapping("/mtrlInsertForm")
	public String mtrlInsertForm() {
		return "material/mtrlInsertForm";
	}
	//LOT재고조회폼
	@RequestMapping("/mtrlLotForm")
	public String mtrlLotForm() {
		return "material/mtrlLotForm";
	}
	
	//안전재고조회
	@RequestMapping("/mtrlSafetyForm")
	public String mtrlSafetyForm() {
		return "material/mtrlSafetyForm";
	}
	
	/*
	 * MODAL 이동 
	 */
	//자제명 검색
	@RequestMapping("/mtcdModal")
	public String mtcdModal() {
		return "material/mtrlModal/mtcdModal";
	}
	//업체명 검색
	@RequestMapping("/vdrModal")
	public String vdrModal() {
		return "material/mtrlModal/vdrModal";
	}
	
	//발주코드 검색
	@RequestMapping("/pocdModal")
	public String poCdModal() {
		return "material/mtrlModal/pocdModal";
	}
	//입고예정 조회
	@RequestMapping("/mtrlExpectModal")
	public String mtrlExpectModal() {
		return "material/mtrlModal/mtrlExpectModal";
	}
}
 