package com.yfactory.mes.quality.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.yfactory.mes.quality.vo.MtCheckVO;


public interface QualityMapper {
	// 자재 품질검사요청(modal) 조회
	List<Map> selectpoDtlRequest();
	
	// 자재 품질검사관리 조회
	List<Map> selectMtCheckMgr();
	
	// 자재 검사결과 조회
	List<Map> selectMtCheck();
	
	// 자재 불량내역 조회
	List<Map> selectMtErrList();
	
	// 자재 품질검사요청(modal) 검색
	List<Map> searchpoDtlRequest(@Param("mtName") String mtName);
	
	// 자재품질결과 검색
	List<Map> searchMtQuality(@Param("startDate") Date startDate, @Param("endDate") Date endDate,
			@Param("mtName") String mtName);
	
	// 제품품질결과 검색
	List<Map> searchProdQuality(@Param("prodName") String prodName);
	
	// 자재불량내역
	List<Map> searchMtErrList(@Param("errDtl") String errDtl,	@Param("mtName") String mtName);
	
	// 제품불량내역
	List<Map> searchProdErrList(@Param("errDtl") String errDtl,	@Param("prodName") String prodName);
	
	// 입력
	int requestQualityM(MtCheckVO MCVO); // 자재 품질검사요청 입력
	
	// 수정
	int resultQualityM(); // 자재품질검사 수정
}