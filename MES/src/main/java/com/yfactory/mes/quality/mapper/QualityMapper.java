package com.yfactory.mes.quality.mapper;

import java.util.List;

import com.yfactory.mes.quality.vo.*;

public interface QualityMapper {
	// 불량코드 ( 조회 )
	List<ErrCodeVO> findErrCd(); // 불량코드 전체조회
	List<ErrCodeVO> ErrCdsearch(); // 불량코드 단건조회

	// 자재검사 ( 조회 / 수정 )
	List<MtCheckVO> findMtChk(); // 자재검사 전체조회
	List<MtCheckVO> MtChkSearch(); // 자재검사 단건조회 
	int UpdMtChk(MtCheckVO mtchk); // 자재검사 수정
//  						  ( => 검사일자(sysdate로 입력), 합격량, 불량량(발주량 - 합격량), 담당자, 검사여부(진행 전, 진행 완료 구분) 수정 가능 )

	// 자재불량내역 ( 조회 )
	List<MtErrListVO> findMtErrList(); // 자재불량내역 전체조회
	List<MtErrListVO> MtErrSearch(); // 자재불량내역 단건조회

	// 제품불량내역 ( 조회 )
	List<ProdErrListVO> findProdErrList(); // 제품불량내역 전체조회
	List<ProdErrListVO> ProdErrSearch(); // 제품불량내역 단건조회
	
}