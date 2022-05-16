package com.yfactory.mes.quality.mapper;

import java.util.List;

import com.yfactory.mes.quality.vo.ErrCodeVO;

public interface ErrCodeMapper {
	// 불량코드 매퍼.
	// 전체조회 및 단건조회만 가능.
	// 단건조회는 불량코드 및 불량코드명으로 검색가능. 

	// 전체조회
	public List<ErrCodeVO> ErrCodeFind();

	// 단건조회 불량코드
	public ErrCodeVO findByErrCd();

	// 단건조회 (err_nm)
	public ErrCodeVO findByErrNm();

}
