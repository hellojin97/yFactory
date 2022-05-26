package com.yfactory.mes.quality.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.yfactory.mes.quality.vo.MtCheckVO;

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
	
	// 불량코드(modal) 검색
	List<Map> searchErrName(@Param("errName") String key);
	
	// 자재 품질검사요청(modal) 검색
	List<Map> searchpoDtlRequest(@Param("mtName") String key);
	
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
	// 자재 품질검사요청
	int reqMtQuality(@Param("pdt") String pdt, @Param("mcd") String mcd);
	
	// 수정
	// 자재품질검사
	int resMtQuality(@Param("podtlcd") String podtlcd, @Param("mtnm") String mtnm, @Param("passqty") int passqty,
					 @Param("errqty") int errqty, @Param("errcd") String errcd);
}