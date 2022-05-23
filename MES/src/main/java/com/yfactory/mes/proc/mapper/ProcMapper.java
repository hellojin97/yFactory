package com.yfactory.mes.proc.mapper;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface ProcMapper {

	List<Map> ProcOrderSelectAll(); // 주문서 조회

	List<Map> OrderSelectOk(String ordCd); // 주문서 조회 (주문코드O)

	int ProcPlanInsert(HashMap<String, Object> procPI); // 계획 등록

	List<Map> PrdSelect(); // 제품 목록 조회

	List<Map> PrdtPlanSelect(@Param("date1") String date1, @Param("date2") String date2); // 생산계획 조회

	List<Map> ProcPlanSelect(String ppCd); //생산계획 단건조회
	
	//public List<Map> ProcPlanSelectState(@Param("date1") String date1, @Param("date2") String date2, String ppCd,String radio); //생산계획 상태조회
	List<Map> ProcPlanSelectState(HashMap<String, Object> procPlSelect);
	
	int prdtPlanInsert(String PP_NM, String date1); //

	List<Map> PrdSelectOne(String prodCd);

	List<Map> ProcPlanAll(); // 생산계획전체조회

	List<Map> NoPlanSelect(); //생산미지시계획
	List<Map> procDtPlanSelect(String ppCd); //상세생산계획
}
