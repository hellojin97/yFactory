package com.yfactory.mes.quality.mapper;

import java.util.List;

import com.yfactory.mes.quality.vo.MtCheckVO;

public interface MtCheckMapper {
	// 자재검사 매퍼
	// 전체조회, 단건조회, 수정 가능
	// 단건조회는 발주상세코드 및 검사일자로 검색가능.
	// 단, 검사일자는 완료된 항목만 검색됨.
	
	public List<MtCheckVO> findMtCheck(); // 자재검사 전체조회
	
	public MtCheckVO findMtDtlCd(); // 자재검사 단건조회 => 발주상세코드로 검색.
	
	public MtCheckVO findMtChkDt(); // 자재검사 단건조회 => 검사일자로 검색(검사가 완료된 항목 한정)
	
	public int UpdMtCheck(); //자재검사 수정 => 수정은 검사일자, 합격량, 불량량, 담당자, 검사여부만 수정.
}
