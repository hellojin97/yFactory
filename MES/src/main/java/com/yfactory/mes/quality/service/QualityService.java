package com.yfactory.mes.quality.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.yfactory.mes.quality.vo.MtCheckVO;

public interface QualityService {
	// 조회
	// 불량코드(modal)
	List<Map> selectErrCode();
	
	List<Map> errSelectOne(String errCd);
	
	// 자재 품질검사요청(modal)
	List<Map> selectpoDtlRequest();
	
	// 제품 품질검사요청(modal)
	
	// 자재 품질검사관리
	List<Map> selectMtCheckMgr();
	
	// 제품 품질검사관리
	List<Map> selectProdCheckMgr();
	
	// 자재 검사결과
	List<Map> selectMtCheck();
	
	// 제품 검사결과
	List<Map> selectProdCheck();
	
	// 자재 불량내역
	List<Map> selectMtErrList();
	
	// 제품 불량내역
	
	// ------------------------------------------------
	
	// 검색
	// 불량코드(modal)
	List<Map> searchErrName(String key);
	
	// 자재 품질검사요청(modal)
	List<Map> searchpoDtlRequest(String key);
	
	// 자재품질결과
	List<Map> searchMtQuality( Date startDate, Date endDate, String mtName);
	
	// 제품품질결과
	List<Map> searchProdQuality(String prodName);
	
	// 자재불량내역
	List<Map> searchMtErrList(String errDtl, String mtName);
	
	// 제품불량내역
	List<Map> searchProdErrList(String errDtl, String prodName);
	
	// ------------------------------------------------
	
	// 입력
	// 자재 품질검사요청
	int reqMtQuality(String pdt, String mcd);
	
	// ------------------------------------------------
	
	// 수정
	// 자재 품질검사
	int resMtQuality(String podtlcd, String mtnm, int passqty, int errqty, String errcd);
}
