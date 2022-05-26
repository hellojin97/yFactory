package com.yfactory.mes.quality.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.yfactory.mes.quality.service.QualityService;
import com.yfactory.mes.quality.vo.MtCheckVO;

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

	// 제품 품질검사요청(modal)
	
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
	
	// 자재 불량내역
	
	// 제품 불량내역
	
	// ------------------------------------------------
	
	// 검색
	// 불량코드
	@GetMapping("/searchErrName")
	public List<Map> searchErrName(String key) {
		return qas.searchErrName(key);
	}
	
	// 자재 품질검사요청(modal)
	@GetMapping("/pocdModalSearch")
	public List<Map> searchpoDtlRequest(String key) {
		return qas.searchpoDtlRequest(key);
	}
	// 자재품질결과
	
	// 제품품질결과
	
	// 자재불량내역
	
	// 제품불량내역
	
	// ------------------------------------------------
	
	// 입력
	// 자재 품질검사요청
	@GetMapping("/reqMtQuality")
	public int reqMtQuality(String pdt, String mcd) {
		return qas.reqMtQuality(pdt, mcd);
	}
	
	// ------------------------------------------------
	
	// 수정
	// 자재 품질검사
	@GetMapping("/resMtQuality")
	public int resMtQuality(String podtlcd, String mtnm, int passqty, int errqty, String errcd) {
		return qas.resMtQuality(podtlcd, mtnm, passqty, errqty, errcd);
	}
	
}
