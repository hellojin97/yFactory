package com.yfactory.mes.eq.service;

import java.util.List;
import java.util.Map;

import com.yfactory.mes.eq.vo.EqVO;

public interface EquipService {

	//설비 구분 조회
	List<Map> searchEq();
	
	// 설비 코드+명 조회 ajax
	List<Map> selectEq(String eqCd);
	
	// 설비 등록
	int insertEq(EqVO vo);
	
}
