package com.yfactory.mes.proc.mapper;


import com.yfactory.mes.proc.vo.PlanDtlVO;


public interface ProcMapper {


	Map OrderSelectOk(Map ordCd);	//주문서 조회 (주문코드O)
	Map OrderSelectNo(Map prodCd);	//주문서 조회 (주문코드X)

	int PlanInsert(PlanDtlVO vo);	//계획 등록
	
	List<Map> PrdSelect();		//제품 목록 조회
	List<Map> prdtPlanSelect(Date date1, Date date2);	//생산계획 조회
	
	int prdtPlanInsert(String PP_NM, Date date1);
	

}
