package com.yfactory.mes.quality.mapper;

import java.util.List;

import com.yfactory.mes.quality.vo.MtErrListVO;

public interface MtErrListMapper {
	// 자재불량내역 매퍼
	// 자재불량내역 전체조회 및 단건조회만 가능
	// 자재불량내역 단건조회는 자재코드와 불량코드 조회가능.
	
	public List<MtErrListVO> findMtErrList(); // 자재불량내역 전체조회
	
	public MtErrListVO findMtErrMtrlCd(); // 자재불량내역 단건조회 => 자재코드로 조회
	
	public MtErrListVO findMtErrErrCd(); // 자재불량내역 단건조회 => 불량코드로 조회
}
