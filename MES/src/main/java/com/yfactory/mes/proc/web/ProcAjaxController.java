package com.yfactory.mes.proc.web;

import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.yfactory.mes.proc.service.ProcService;

@RestController
public class ProcAjaxController {

	@Autowired
	private ProcService procService;

	// 주문서 단건조회 procOrderSelect
	@GetMapping("/procOrderSelect")
	public List<Map> selectOrdersList(String ordCd) {
		return procService.OrderSelectOk(ordCd);

	}

	// 주문서 전체조회
	@GetMapping("/procOrderListAjax")
	public List<Map> ProcOrderSelectAll() {

		return procService.ProcOrderSelectAll();

	}
	// 생산계획전체조회 procPlListAjax

	@GetMapping("/procPlanListAjax")
	public List<Map> procPlanAll() {
		//System.out.println(procService.procPlanAll());
		return procService.procPlanAll();

	}
	// 생산계획날짜별조회 procPlDtAjax
	@GetMapping("/procPlDtAjax")
	public List<Map> prdtPlanSelect(String date1, String date2){
		
		return procService.prdtPlanSelect(date1, date2);
	}

	// 제품 조회
	@GetMapping("/prdSelect")
	public List<Map> PrdSelect() {
		return procService.PrdSelect();
	}

	@GetMapping("/prdSelectOne")
	public List<Map> PrdSelectOne(String prodCd) {
		return procService.PrdSelectOne(prodCd);
	}

	@PostMapping("/procPlanInsert")
	public int ProcPlanInsert(@RequestBody HashMap<String, Object> procPI) {

		return procService.ProcPlanInsert(procPI);
	}

}
