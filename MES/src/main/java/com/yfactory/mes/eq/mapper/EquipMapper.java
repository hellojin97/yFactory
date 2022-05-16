package com.yfactory.mes.eq.mapper;

import java.util.List;
import java.util.Map;

import com.yfactory.mes.eq.vo.EqVO;

public interface EquipMapper {
	 //설비 메인 페이지 
	  List<Map> findAll(); // 설비 조회(설비관리 페이지)
	  int eqIns(EqVO vo); // 설비 등록

	  EqVO findSelect(EqVO vo); // 설비 단건조회(설비등록 페이지)
	  int eqUpd(); // 설비 가동상태 수정 및 데이터 수정(설비관리 페이지)
	  
	  
	  List<Map> eqInaAll(); // 설비 비가동 리스트(설비비가동 페치지)
	  int eqInaIns(); // 설비 비가동 등록(설비 비가동 페이지)
	  
	  List<Map>eqChkAll();// 설비 점검 전체 조회(점검관리 페이지)
	  int eqChkIns(); // 설비 점검 등록(점검관리 페이지)
	  int eqChkDel(); // 설비 점검 삭제(점검관리 페이지)
	  int eqChkMng();// 설비 점검 일별 건수 조회(점검관리 페이지)
	
	  
	  
	 
	}
