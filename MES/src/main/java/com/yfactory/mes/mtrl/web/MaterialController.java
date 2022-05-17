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
	@RequestMapping("/orderForm")
	public String orderForm() {
		
		return "material/orderForm";
	}
	//미지시 생산품조회
	@GetMapping("/mtrlorder")
	@ResponseBody
	public List<Map> mtrlorder() {
		
		return service.selectPl();
	}
	
	//LOT재고조회폼
	@RequestMapping("/mtrlLotForm")
	public String mtrlLotForm() {
		return "material/mtrlLotForm";
	}
	
	//LOT재고조회
	@GetMapping("/mtrlLot")
	@ResponseBody
	public List<Map> mtrlLot() {
		return service.listMtrlLot();
	}
}
 