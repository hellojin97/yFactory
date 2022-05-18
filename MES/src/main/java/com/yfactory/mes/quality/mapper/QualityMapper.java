package com.yfactory.mes.quality.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.yfactory.mes.quality.vo.MtCheckVO;


public interface QualityMapper {
	// 입력
	int requestQualityM(MtCheckVO MCVO); // 자재 품질검사요청 입력
	int requestQualityP(); // 제품 품질검사요청 입력
	
	
	// 조회
	List<Map> selectErrCode(); // 불량코드	
	List<Map> selectMtCheck(); // 자재검사
	List<Map> selectProdCheck(); // 제품검사
	List<Map> selectMtErrList(); // 자재불량내역
	List<Map> selectProdErrList(); // 제품불량내역
	
	
	// 검색
	// 자재품질결과
	List<Map> searchMtQuality(@Param("startDate") Date startDate, @Param("endDate") Date endDate,
			@Param("mtName") String mtName);
	// 제품품질결과
	List<Map> searchProdQuality(@Param("prodName") String prodName);
	
	// 불량
	// 자재불량내역
	List<Map> searchMtErrList(@Param("errDtl") String errDtl,	@Param("mtName") String mtName);
	// 제품불량내역
	List<Map> searchProdErrList(@Param("errDtl") String errDtl,	@Param("prodName") String prodName);
	
	
	// 수정
	int resultQualityM(); // 자재품질검사 수정
	int resultQualityP(); // 제품품질검사 수정
	
}