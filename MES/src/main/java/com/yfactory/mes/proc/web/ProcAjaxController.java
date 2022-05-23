package com.yfactory.mes.proc.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.yfactory.mes.proc.service.ProcService;

@RestController
public class ProcAjaxController {

	@Autowired
	private ProcService procService;

	// 주문서 단건조회 procOrderSelect
	//@GetMapping("/procOrderSelect")
	@GetMapping("/orderSelectOk")
	public List<Map> OrderSelectOk(String ordCd) {
		return procService.OrderSelectOk(ordCd);

	}

	// 주문서 전체조회
	//@GetMapping("/procOrderListAjax")
	@GetMapping("/procOrderSelectAll")
	public List<Map> ProcOrderSelectAll() {

		return procService.ProcOrderSelectAll();

	}
	// 생산계획전체조회 procPlListAjax

	//@GetMapping("/procPlanListAjax")
	@GetMapping("/procPlanAll")
	public List<Map> ProcPlanAll() {
		//System.out.println(procService.procPlanAll());
		return procService.ProcPlanAll();

	}
	// 생산계획날짜별조회 procPlDtAjax
	//@GetMapping("/procPlDtAjax")
	@GetMapping("/prdtPlanSelect")
	public List<Map> PrdtPlanSelect(String date1, String date2){
		
		return procService.PrdtPlanSelect(date1, date2);
	}
	// 생산계획날짜별단건
	//@GetMapping("/procPlListOneAjax")
	@GetMapping("/procPlanSelect")
	public List<Map> ProcPlanSelect(String ppCd){
		
		return procService.ProcPlanSelect(ppCd);
	}
	
	// 생산계획조회상태 ProcPlanSelectState
	@RequestMapping(value = "/procPlanSelectState", method = RequestMethod.POST)
	public List<Map> ProcPlanSelectState(@RequestBody HashMap<String, Object> procPlSelect){
		return procService.ProcPlanSelectState(procPlSelect);
	}

	// 제품 조회
	//@GetMapping("/prdSelect")
	@GetMapping("/prdSelect")
	public List<Map> PrdSelect() {
		return procService.PrdSelect();
	}

	//@GetMapping("/prdSelectOne")
	@GetMapping("/prdSelectOne")
	public List<Map> PrdSelectOne(String prodCd) {
		return procService.PrdSelectOne(prodCd);
	}

//	@PostMapping("/procPlanInsert")
	@PostMapping("/procPlanInsert")
	public int ProcPlanInsert(@RequestBody HashMap<String, Object> procPI) {

		return procService.ProcPlanInsert(procPI);
	}
	//procDtPlanSelect
	//@GetMapping("/prdSelectOne")
	// 생산미지시계획
	@GetMapping("/NoPlanSelect")
	public List<Map> NoPlanSelect() {
		
		return procService.NoPlanSelect();
	}
	// 상세생산계획
	@GetMapping("/procDtPlanSelect")
	public List<Map> procDtPlanSelect(String ppCd) {
		return procService.procDtPlanSelect(ppCd);
	}
	
	// 라인코드
	
}
