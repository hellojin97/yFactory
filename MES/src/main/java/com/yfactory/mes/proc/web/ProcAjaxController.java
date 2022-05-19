package com.yfactory.mes.proc.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yfactory.mes.proc.service.ProcService;

@RestController
public class ProcAjaxController {

	@Autowired private ProcService procService;
	
	
	@GetMapping("/procPlListAjax")
	public List<Map> selectOrdersList(String ordCd) {
		return procService.OrderSelectOk(ordCd);
		
	}
	@GetMapping("/procOrderListAjax")
	public List<Map>  ProcOrderSelectAll() {
		
		return procService.ProcOrderSelectAll();
	
	}
	@GetMapping("/prdSelect")
	public List<Map>  PrdSelect() {
		return procService.PrdSelect();
	}
	@GetMapping("/prdSelectOne")
	public List<Map>  PrdSelectOne(String prodCd) {
		return procService.PrdSelectOne(prodCd);
	}	
	@PostMapping("/procPlanInsert")
	public int ProcPlanInsert(List<Map> procPI) {
		return procService.ProcPlanInsert(procPI);
	}
	

	
}
