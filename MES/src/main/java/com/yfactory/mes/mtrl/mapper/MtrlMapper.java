package com.yfactory.mes.mtrl.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface MtrlMapper {
	//미지시 생산계획조회
	List<Map>selectPl();
	
	//LOT재고조회
	List<Map>listMtrlLot();
	
	//자재명 전체조회
	List<Map>mtcdList();
	
	//자재명 검색
	List<Map>mtnmSelectSearch(@Param("mtnm")String mtnm);
	
	//업체명 전체조회
	List<Map>vendorList();
	
	//업체명 검색
	List<Map>vdrnmSelectSearch(@Param("vdrnm")String vdrnm);
}
