package com.yfactory.mes.quality.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yfactory.mes.quality.service.QualityService;

@RestController
public class QualityAjaxController {
	@Autowired private QualityService qas;
	
	// 조회
	// 불량코드(modal)
	@GetMapping("/selectErrCode")
	public List<Map> selectErrCode() {
		return qas.selectErrCode();
	}
	
	// 자재 품질검사요청(modal)
	@GetMapping("/selectpoDtlRequest")
	public List<Map> selectpoDtlRequest() {
		return qas.selectpoDtlRequest();
	}
	
	// 자재 품질검사관리
	@GetMapping("/selectMtCheckMgr")
	public List<Map> selectMtCheckMgr() {
		return qas.selectMtCheckMgr();
	}
	
	// 자재 검사결과
	@GetMapping("/selectMtCheck")
	public List<Map> selectMtCheck() {
		return qas.selectMtCheck();
	}
	
	// 제품 검사결과
	@GetMapping("/selectProdCheck")
	public List<Map> selectProdCheck() {
		return qas.selectProdCheck();
	}
	
	// 자재불량내역
	@GetMapping("/selectMtErrList")
	public List<Map> selectMtErrList() {
		return qas.selectMtErrList();
	}
	
	//제품불량내역
	@GetMapping("/selectProdErrList")
	public List<Map> selectProdErrList() {
		return qas.selectProdErrList();
	}
	
	// ------------------------------------------------
	
	// 검색
	// 불량코드
	@GetMapping("/errNmModalSearch")
	public List<Map> errNmModalSearch(String errName) {
		return qas.errNmModalSearch(errName);
	}
	
	// 자재 품질검사요청(modal)
	@GetMapping("/pocdModalSearch")
	public List<Map> searchpoDtlRequest(String key) {
		return qas.searchpoDtlRequest(key);
	}

	// ------------------------------------------------
	
	// 입력
	// 자재 품질검사요청
	@GetMapping("/reqMtQuality")
	public int reqMtQuality(String pdt) {
		return qas.reqMtQuality(pdt);
	}
	
	// ------------------------------------------------
	
	// 수정
	// 자재 품질검사
	@PostMapping("/resMtQuality")
	public int resMtQuality(@RequestParam Map<String, Object> list) {
		return qas.resMtQuality(list);
	}
	
}
