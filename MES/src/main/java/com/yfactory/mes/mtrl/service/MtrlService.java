package com.yfactory.mes.mtrl.service;

import java.util.List;
import java.util.Map;

public interface MtrlService {
	
	//미지시 생산계획조회
	List<Map>selectPl();
	
	
	//LOT재고조회
	List<Map>listMtrlLot();
	
	//자재명 조회
	List<Map>mtcdList();
	
	//자재명 검색
	List<Map>mtnmSelectSearch(String mtnm);
	
	//업체명 조회
	List<Map>vendorList();
}
