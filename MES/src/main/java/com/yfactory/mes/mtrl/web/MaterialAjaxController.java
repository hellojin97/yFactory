package com.yfactory.mes.mtrl.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yfactory.mes.mtrl.service.MtrlService;

@RestController
public class MaterialAjaxController {

	@Autowired private MtrlService service;
	
		/* 발주관리등록 */
		//미지시 생산품조회
		@GetMapping("/mtrlorder")
		public List<Map> mtrlorder() {		
			return service.selectPl();
		}
		// 생산계획별 자재 재고
		@GetMapping("/mtrlPlan")
		public List<Map> mtrlPlan(String ppCd){
			
			System.out.println("테스트: " +ppCd);
			return service.mtrlPlanList(ppCd);
		}
		
	
		//LOT재고조회
		@GetMapping("/mtrlLot")
		public List<Map> mtrlLot() {
			return service.listMtrlLot();
		}
		
		//자재명 조회
		@GetMapping("/mtcd")
		public List<Map> mtcd(){
			return service.mtcdList();
		}
		
		//자재검색
		@GetMapping("/mtnmSelectSearch")
		public List<Map> mtnmSelectSearch(String mtnm){
			return service.mtnmSelectSearch(mtnm);
		}
		
		//업체명 조회
		@GetMapping("/vdrcd")
		public List<Map> vdrcd(){
			return service.vendorList();
		}
		
		//업체명 조회
		@GetMapping("/vdrnmSelectSearch")
		public List<Map> vdrnmSelectSearch(String vdrnm){
			return service.vdrnmSelectSearch(vdrnm);
		}

		
		//LOT 검색
		@GetMapping("/lotSelectSearch")
		public List<Map> lotSelectSearch(String m1, String m2,String req1,String req2){
			return service.lotSelectSearch(m1, m2, req1, req2);
		}
		
		
		
}
