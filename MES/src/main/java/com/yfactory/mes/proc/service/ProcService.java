package com.yfactory.mes.proc.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;

import com.yfactory.mes.proc.vo.PlanDtlVO;

public interface ProcService {
	List<Map> ProcOrderSelectAll(); //주문서 조회
	List<Map> OrderSelectOk(String ordCd);	//주문서 조회 (주문코드O)
	Map OrderSelectNo(Map prodCd);	//주문서 조회 (주문코드X)
 
	int PlanInsert(PlanDtlVO vo);	//계획 등록
	
	List<Map> PrdSelect();		//제품 목록 조회
	List<Map> prdtPlanSelect(Date date1, Date date2);	//생산계획 조회
	
	int prdtPlanInsert(String PP_NM, Date date1);
	
	List<Map>  PrdSelectOne(String prodCd);
	
}
