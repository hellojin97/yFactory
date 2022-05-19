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
	
	//발주조회,등록폼
	@RequestMapping("/mtrlOrderForm")
	public String mtrlOrderForm() {
		
		return "material/mtrlOrderForm";
	}

	//LOT재고조회폼
	@RequestMapping("/mtrlLotForm")
	public String mtrlLotForm() {
		return "material/mtrlLotForm";
	}
	//불량재고조회
	@RequestMapping("/mtrlFaultyForm")
	public String mtrlFaultyForm() {
		return "material/mtrlFaultyForm";
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
}
 