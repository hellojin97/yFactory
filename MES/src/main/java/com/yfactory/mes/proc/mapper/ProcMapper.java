package com.yfactory.mes.proc.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

public interface ProcMapper {

	List<Map> ProcOrderSelectAll(); // 주문서 조회

	List<Map> OrderSelectOk(String ordCd); // 주문서 조회 (주문코드O)

	int ProcPlanInsert(Map<String, String> procPI); // 계획 등록
	
	int procCancelPl(Map<String, String> cancel); // 계획 취소

	List<Map> PrdSelect(); // 제품 목록 조회

	List<Map> PrdtPlanSelect(@Param("date1") String date1, @Param("date2") String date2); // 생산계획 조회

	List<Map> ProcPlanSelect(String ppCd); //생산계획 단건조회
	
	//public List<Map> ProcPlanSelectState(@Param("date1") String date1, @Param("date2") String date2, String ppCd,String radio); //생산계획 상태조회
	List<Map> ProcPlanSelectState(HashMap<String, Object> procPlSelect);
	
	int prdtPlanInsert(String PP_NM, String date1); //

	List<Map> PrdSelectOne(String prodCd);

	List<Map> ProcPlanAll(); // 생산계획전체조회

	List<Map> NoPlanSelect(String state); //생산미지시계획
	
	List<Map> procDtPlanSelect(Map<String,String> ppCd); //상세생산계획
	
	List<Map> ProcLineSelect(Map<String,String> prodNm); // 상품 라인코드 조회
	
    List<Map> ProcNeedMtrl(@RequestBody HashMap<String, Object> line); // 필요 자재 조회
    
    List<Map> ProcNeedMtrlLOT(@RequestBody HashMap<String, Object> mtNm); //필요 자재 LOT 조회
    
    List<Map> ProcOrderSelect(@RequestBody HashMap<String, Object> list); //생산 지시 조회
    
    List<Map> ProcOrderList(@RequestBody HashMap<String, Object> list); //생산 지시 목록
    
    List<Map> ProcOrderCdSelectOne(String dtlCd); //생산 지시 코드 단건 조회
    
    List<Map> ProcOrderLineSelectOne(String line); //생산 라인 코드 단건 조회
    
    int ProcStartLogic(@RequestBody HashMap<String, Object> list); //생산 로직 
    
    List<Map> procResultList(); //공정 실적 조회
    
    List<Map> procResultOrdersList(); // 공정 실적 - 생산 지시 조회
    
    List<Map> procResultProcessList(); // 공정 실적 - 공정 모달 조회
    
    int ProcStopLogic(HashMap<String, Object> list); // 긴급 중지 로직 
    
    int ProcRestartLogic(HashMap<String, Object> list); // 재시작 로직
    
    List<Map> procProcessCtlSelect(); // 공정 관리 조회
    
    List<Map> procProcessCheckList(); // 공정 체크박스 목록 조회
}
