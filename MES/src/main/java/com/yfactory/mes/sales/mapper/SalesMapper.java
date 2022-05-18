package com.yfactory.mes.sales.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface SalesMapper {
	//주문서 조회
	List<Map> selectOrderList();

	//BOM 조회
	List<Map> selectBomList();

	//주문서 검색
	List<Map> searchOrderList(@Param("pnm") String pnm, @Param("vnm") String vnm, 
							  @Param("req1") String req1,@Param("req2") String req2 ,
							  @Param("res1") String res1, @Param("res2") String res2, @Param("key") String key);

	//완제품LOT 조회
	List<Map> selectProdLotList();
	
	//완제품LOT 검색
	List<Map> searchProdLotList(@Param("pnm") String pnm, @Param("pcd") String pcd, @Param("fdt1") String fdt1, @Param("fdt2") String fdt2);
	
	//완제품modal리스트
		List<Map> prodModalList();
	
}

