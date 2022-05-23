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
							  @Param("pcd")String pcd, @Param("vcd")String vcd,
							  @Param("req1") String req1,@Param("req2") String req2 ,
							  @Param("res1") String res1, @Param("res2") String res2, @Param("key") String key);

	//완제품LOT 조회
	List<Map> selectProdLotList();
	
	//완제품LOT 검색
	List<Map> searchProdLotList(@Param("pnm") String pnm, @Param("pcd") String pcd, @Param("fdt1") String fdt1, @Param("fdt2") String fdt2);
	
	//완제품modal리스트
	List<Map> prodModalList();
	
	//완제품modal 검색
	List<Map> prodModalSearch(String key);
	
	//입고 리스트
	List<Map> prodWrnoteIn();
	
	//출고 리스트
	List<Map> prodWrnoteOut();
	
	//입고 검색
	List<Map> searchWrnIn(@Param("pnm") String pnm, @Param("pcd") String pcd, @Param("fdt1") String fdt1, @Param("fdt2") String fdt2);
		
	//출고 검색
	List<Map> searchWrnOut(@Param("pnm") String pnm, @Param("pcd") String pcd, @Param("fdt1") String fdt1, @Param("fdt2") String fdt2);
	
	//주문상세 조회
	List<Map> ordDtpList();
	
	//출고 완제품 modal 조회
	List<Map> outProdModal(String key);
	
	
	//출고등록
	int releaseOrder(Map<String, String> result);
}

