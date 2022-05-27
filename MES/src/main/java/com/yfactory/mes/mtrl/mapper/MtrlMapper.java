package com.yfactory.mes.mtrl.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface MtrlMapper {
	
	/*발주등록*/
	//미지시 생산계획조회
	List<Map>selectPl();
	//생산계획별 자재재고
	List<Map>mtrlPlanList(@Param("ppCd") String ppCd);
	//발주요청서 등록
	List<Map>mtrlOrderList(@Param("ppCd")String ppCd, @Param("mtCd")String mtCd);
	
	//발주관리 조회
    List<Map>listRequest();	
    //발주관리 검색
    List<Map>mtrlReqSelectSearch(@Param("poCdinput")String poCdinput);

    //발주등록
  	int mtrlReqInsert(Map<String, String> result);
    
	/*LOT페이지*/
	//LOT재고조회
	List<Map>listMtrlLot();
	//LOT재고 검색
	List<Map>lotSelectSearch(@Param("m1") String m1,
							 @Param("m2") String m2,
							 @Param("req1") String req1,
							 @Param("req2") String req2);
	//입고조회
	List<Map>insertList();
	
	/*MODAL페이지*/
	//자재명 전체조회
	List<Map>mtcdList();
	//자재명 검색
	List<Map>mtnmSelectSearch(@Param("mtnm") String mtnm);
	//업체명 전체조회
	List<Map>vendorList();
	//업체명 검색
	List<Map>vdrnmSelectSearch(@Param("vdrnm") String vdrnm);
	//발주코드 검색
	List<Map>pocdList();
	List<Map>pocdSelectSearch(@Param("pocd")String pocd);
	
	//입고 전체조회
	List<Map>insertSearch(@Param("m1") String m1,
			 @Param("m2") String m2,
			 @Param("req1") String req1,
			 @Param("req2") String req2);
	//입고예정목록
	List<Map>expectList();
	
}
