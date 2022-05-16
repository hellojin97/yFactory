package com.yfactory.mes.proc.mapper;

import java.util.List;

import com.yfactory.mes.test.TestVO;

public interface ProcMapper {
	List<TestVO> OrderSelect();		//주문서 등록
	int PlanInsert(TestVO test);	//계획 등록
	TestVO OrderSelectOne(TestVO ordCd);	//주문서 조회
	
	
}
