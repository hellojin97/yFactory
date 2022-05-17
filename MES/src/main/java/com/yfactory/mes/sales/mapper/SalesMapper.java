package com.yfactory.mes.sales.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface SalesMapper {
	//주문서 조회
	List<Map> selectOrderList();
	//주문서 검색
	List<Map> searchOrderList(@Param("pnm") String pnm, @Param("vnm") String vnm, 
							  @Param("req1") String req1,@Param("req2") String req2 ,
							  @Param("res1") String res1, @Param("res2") String res2);	
}
