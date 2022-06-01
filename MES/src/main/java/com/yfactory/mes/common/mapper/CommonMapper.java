package com.yfactory.mes.common.mapper;

import java.util.List;
import java.util.Map;

import com.yfactory.mes.common.vo.EmployeeVO;

public interface CommonMapper {

	//주문서 조회
		List<Map> mainOrdersList();
		
	//완제품 재고 간단조회
		List<Map> mainProdList();
		
	//원자재 재고 간단조회
		List<Map> mainMtrlList();
		
	//(사용자) 주문 
		List<Map> userOrderForm();
		
	//(사용자) 주문등록
		int userOrderInsert(Map<String, String> parameter);
	
	//로그인
		EmployeeVO userLogin(EmployeeVO empVO);
}
