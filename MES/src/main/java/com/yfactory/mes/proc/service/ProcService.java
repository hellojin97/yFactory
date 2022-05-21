package com.yfactory.mes.proc.service;


import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface ProcService {
	List<Map> ProcOrderSelectAll(); //주문서 조회
	List<Map> OrderSelectOk(String ordCd);	//주문서 조회 (주문코드O)
 
	int ProcPlanInsert(HashMap<String, Object> procPI);	//계획 등록
	
	List<Map> PrdSelect();		//제품 목록 조회
	
	int prdtPlanInsert(String PP_NM, Date date1);
	
	List<Map>  PrdSelectOne(String prodCd);
	
	public List<Map> procPlanAll();
	List<Map> prdtPlanSelect(String date1, String date2);	//날짜별 생산계획조회
	
}
