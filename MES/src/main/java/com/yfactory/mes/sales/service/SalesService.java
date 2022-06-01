package com.yfactory.mes.sales.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.GetMapping;

public interface SalesService {
	//주문서 조회
	List<Map> selectOrderList();

	List<Map> selectBomList(String key);

	//주문서 검색
	List<Map> searchOrderList(String pnm, String vnm,
							  String pcd, String vcd,
							  String req1, String req2,
							  String res1, String res2, String key);
	
	//완제품LOT 조회
	List<Map> selectProdLotList();
	
	//완제품LOT 검색
	List<Map> searchProdLotList(String pnm, String pcd, String fdt1, String fdt2);
	
	//완제품modal리스트
	List<Map> prodModalList();
	
	//완제품modal 검색
	List<Map> prodModalSearch(String key);
	
	//입고 리스트
	List<Map> prodWrnoteIn();
	
	//출고 리스트
	List<Map> prodWrnoteOut();
	
	//입고 검색
	List<Map> searchWrnIn(String pnm, String pcd, String fdt1, String fdt2);
	
	//출고 검색
	List<Map> searchWrnOut(String pnm, String pcd, String fdt1, String fdt2);
	
	//주문상세 조회
	List<Map> ordDtpList();
	
	//출고 완제품 modal 조회
	List<Map> outProdModal(String key);
	
	//출고등록
	int releaseOrder(Map<String, String> result);
	
	//주문서 조회 - 주문 상세 조회 그리드
	List<Map> ordtlModalList(String key);
	
	//완제품 안전 재고 수정
	int updateSafe(Map<String, String> result);
	
	//BOM 수정
	int updateBom(Map<String, String> result);

}
