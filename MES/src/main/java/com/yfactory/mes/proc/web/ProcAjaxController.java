package com.yfactory.mes.proc.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	public int ProcPlanInsert(@RequestBody HashMap<String, Object> procPI) {
		System.out.println(procPI);
		System.out.println(procPI.get("array"));
		List<Map<String, String>> list = (List<Map<String, String>>) procPI.get("array");
		/*
		  for(Map<String, String> map : list) { Set<Entry<String, String>> set =
		  map.entrySet(); for(Entry<String, String> entry : set) {
		  System.out.println(entry.getKey()+", "+entry.getValue()); }
		  System.out.println(); }
		 */
		
		String pdQty = list.get(0).get("계획량");
		String pdDt = list.get(0).get("생산일수");
		String pdRank = list.get(0).get("작업우선순위");
		System.out.println(pdQty + ' ' + pdDt + ' ' + pdRank);
		/*
		 * for(Map<String, String> map : list) { Set<Entry<String, String>> set =
		 * map.entrySet(); for(Entry<String, String> entry : set) {
		 * System.out.println(entry.getKey()+", "+entry.getValue()); } }
		 */
		 
		//return procService.ProcPlanInsert(procPI);
		return 1;
	}
	

	
}
