package com.yfactory.mes.sales.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.GetMapping;

public interface SalesService {
	//주문서 조회
	List<Map> selectOrderList();

	List<Map> selectBomList();

	//주문서 검색
	List<Map> searchOrderList(String pnm, String vnm,
							  String req1, String req2,
							  String res1, String res2, String key);
	
	//완제품LOT 조회
	List<Map> selectProdLotList();
	
	//완제품LOT 검색
	List<Map> searchProdLotList(String pnm, String pcd, String fdt1, String fdt2);
	
	//완제품modal리스트
	List<Map> prodModalList();

}
