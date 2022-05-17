package com.yfactory.mes.sales.mapper;

import java.util.List;
import java.util.Map;

public interface SalesMapper {
	//주문서 조회
	List<Map> selectOrderList();
	List<Map> selectBomList();
}

