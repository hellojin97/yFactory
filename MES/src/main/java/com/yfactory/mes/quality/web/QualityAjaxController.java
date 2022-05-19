package com.yfactory.mes.quality.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yfactory.mes.quality.service.QualityService;

@RestController
public class QualityAjaxController {
	@Autowired private QualityService qaService;
	
	// 조회
	// 자재 품질검사요청(modal)
	@GetMapping("/selectpoDtlRequest")
	public List<Map> selectpoDtlRequest() {
		
		return qaService.selectpoDtlRequest();
	}
	
	// 제품 품질검사요청(modal)
	
	// 자재 품질검사관리
	
	// 제품 품질검사관리
	
	// 자재 검사결과
	
	// 제품 검사결과
	
	// 자재 불량내역
	
	// 제품 불량내역
	
	// ------------------------------------------------
	
	// 검색
	// 자재 품질검사요청(modal)
	@GetMapping("/pocdModalSearch")
	public List<Map> searchpoDtlRequest() {
		return qaService.searchpoDtlRequest();
	}
	// 자재품질결과
	
	// 제품품질결과
	
	// 자재불량내역
	
	// 제품불량내역
	
	// ------------------------------------------------
	
	// 입력
	// 자재 품질검사요청
	
	// 제품 품질검사요청
	
	// ------------------------------------------------
	
	// 수정
	// 자재 품질검사
	
	// 제품 품질검사
	
}
