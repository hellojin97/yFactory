package com.yfactory.mes.proc.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;


public interface ProcMapper {

	
	TestVO OrderSelectOne(String prodCd);	//주문서 조회 (주문코드X)
	
	List<Map> PrdSelect();		//제품 목록 조회
	List<Map> prdtPlanSelect(Date date1, Date date2);	//생산계획 조회
	
	int prdtPlanInsert(TestVO PP_NM, Date date1);
	
}
