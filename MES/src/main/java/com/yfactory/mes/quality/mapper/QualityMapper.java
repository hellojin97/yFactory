package com.yfactory.mes.quality.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface QualityMapper {
	// 불량코드(modal) 조회
	List<Map> selectErrCode();
	
	// 자재 품질검사요청(modal) 조회
	List<Map> selectpoDtlRequest();
	
	// 자재 품질검사관리 조회
	List<Map> selectMtCheckMgr();
	
	// 자재 검사결과 조회
	List<Map> selectMtCheck();
	
	// 제품 검사결과 조회
	List<Map> selectProdCheck();
	
	// 자재 불량내역 조회
	List<Map> selectMtErrList();
	
	// 제품 불량내역 조회
	List<Map> selectProdErrList();
	
	// 불량코드(modal) 검색
	List<Map> errNmModalSearch(String errName);
	
	// 자재 품질검사요청(modal) 검색
	List<Map> searchpoDtlRequest(@Param("mtName") String key);
	
	// 입력
	// 자재 품질검사요청
	int reqMtQuality(@Param("pdt") String pdt);
	
	// 수정
	// 자재품질검사
	int resMtQuality(Map<String, Object> list);
}