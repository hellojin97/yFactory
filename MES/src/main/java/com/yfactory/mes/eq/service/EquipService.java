package com.yfactory.mes.eq.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestBody;

import com.yfactory.mes.eq.vo.EqVO;

public interface EquipService {

	// 설비 구분 조회
	List<Map> searchEq();

	// 설비 코드+명 조회 ajax
	List<Map> selectEq(String eqCd);

	// 설비 등록
	int insertEq(EqVO vo);

	// 설비관리 기본으로 나타나는 리스트 테이블 쿼리 메서드
	List<Map> searchEqMngList();

	// 설비 관리 페이지 - 공정명 공정코드 전체 리스트 조회
	List<Map> searchPrcList();
	
	// 설비코드기준 공정코드 + 공정명 조회
	List<Map> selectEqPrc(String eqCd); 
	
	 // 설비 등록시 사원번호 + 사원명 조회
	List<Map> searchEmp();
	
	// 설비 등록시 업체코드 업체구분코드 업체명 조회
	List<Map> getVdrList(); 
	
	// 설비 사용여부 및 비가동 상태를 포함판 조회
	List<Map> getEqActStatList(); 
	
	// 설비 사용여부 및 비가동 상태를 포함판 검색
	List<Map> getEqInActList(String key);
	
	// 비가동 상태 설비 조회
	List<Map> getEqInList();
	
	// 설비 점검 전체 리스트
	List<Map> getEqChkList(); 
	
	// 설비구분명 + 점검시작일 + 차기점검일 기준 조회
	List<Map>getEqChkSelectList(@RequestBody HashMap<String, Object> list); 
	
	
}
