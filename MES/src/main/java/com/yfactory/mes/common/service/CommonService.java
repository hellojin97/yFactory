
package com.yfactory.mes.common.service;

import java.util.List;
import java.util.Map;


public interface CommonService {

	//주문서 조회
	List<Map> mainOrdersList();
	
	//완제품 재고 간단조회
	List<Map> mainProdList();
	
	//원자재 재고 간단조회
	List<Map> mainMtrlList();
	
	//(사용자) 주문 
	List<Map> userOrderForm();
}
