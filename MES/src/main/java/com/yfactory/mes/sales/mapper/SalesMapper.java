package com.yfactory.mes.sales.mapper;

import java.util.List;

import com.yfactory.mes.test.TestVO;

public interface SalesMapper {
	//주문서 조회
	List<TestVO> orderSelect();
}
