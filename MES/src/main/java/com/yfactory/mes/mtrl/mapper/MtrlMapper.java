package com.yfactory.mes.mtrl.mapper;

import java.util.List;
import java.util.Map;

public interface MtrlMapper {
	//미지시 생산계획조회
	List<Map>selectPl();
	
	//LOT재고조회
	List<Map>listMtrlLot();
	
	//자재명 조회
	List<Map>mtcdList();
	
	//업체명 조회
	List<Map>vendorList();
}
