package com.yfactory.mes.quality.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.yfactory.mes.quality.vo.MtCheckVO;

public interface QualityService {
	// 조회
	// 불량코드(modal)
	List<Map> selectErrCode();
	
	// 자재 품질검사요청(modal)
	List<Map> selectpoDtlRequest();
	
	// 제품 품질검사요청(modal)
	
	// 자재 품질검사관리
	List<Map> selectMtCheckMgr();
	
	// 자재 검사결과
	List<Map> selectMtCheck();
	
	// 제품 검사결과
	List<Map> selectProdCheck();
	
	// 자재 불량내역
	List<Map> selectMtErrList();
	
	// ------------------------------------------------
	
	// 검색
	// 불량코드(modal)
	List<Map> searchErrName(String key);
	
	// 자재 품질검사요청(modal)
	List<Map> searchpoDtlRequest(String key);
	
	// ------------------------------------------------
	
	// 입력
	// 자재 품질검사요청
	int reqMtQuality(String pdt, String mcd);
	
	// ------------------------------------------------
	
	// 수정
	// 자재 품질검사
	int resMtQuality(Map<String, Object> list);
}
