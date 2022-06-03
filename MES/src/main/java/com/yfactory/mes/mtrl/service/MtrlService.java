package com.yfactory.mes.mtrl.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface MtrlService {
	
	/*발주관리등록페이지*/
	//미지시 생산계획조회
	List<Map>selectPl();
	//생산계획별 자재재고
	List<Map>mtrlPlanList(String ppCd);
	//발주요청서 등록
	List<Map>mtrlOrderList(String ppCd, String mtCd);
	
	//발주조회
	List<Map>listRequest();
	//발주조회 검색
	List<Map>mtrlReqSelectSearch(String poCdinput);
	
	/*LOT페이지*/
	//LOT재고조회
	List<Map>listMtrlLot();
	//LOT재고 검색
	List<Map>lotSelectSearch(String m1,
			 String m2,
			 String req1,
			 String req2);
	/* 안전재고페이지 */
	//안전재고 전체조회
	List<Map>mtrlSafetyList();
	//안전재고 단건조회
	List<Map>mtrlSafetySearch(String m1);
	//안전재고 수정
	int mtrlUpdateSafe(Map<String, String> result);
	/*MODAL페이지*/
	//자재명 조회
	List<Map>mtcdList();
	List<Map>mtnmSelectSearch(String mtnm);
	
	//업체명 조회
	List<Map>vendorList();
	List<Map>vdrnmSelectSearch(String vdrnm);
	
	//발주코드 검색
	List<Map>pocdList();
	List<Map>pocdSelectSearch(String pocd);
	
	//발주등록
	int mtrlReqInsert(Map<String, String> result);
	
	//입고등록
	int insertMtrlIn(Map<String,String> mtrlIn);
	
	//입고등록조회
	List<Map>insertList();
	//입고예정버튼
	List<Map>selectMtrlReqList(Map<String, String> result);
	//입고등록전체조회
	List<Map>insertSearch(String m1,
			 String m2,
			 String req1,
			 String req2);
	//입고예정목록
	List<Map>expectList();
	//입고전체조회
    List<Map>mtrlInList();
    //입고단건조회
    List<Map>mtrlInSearch(String m1,
			 String m2,
			 String req1,
			 String req2);
	
	
	//원자제 조회
	List<Map>mtrlStorageList();
	//원자재 검색
	List<Map>mtrlStorageSearch(String m1,
							   String m2);
	
}
