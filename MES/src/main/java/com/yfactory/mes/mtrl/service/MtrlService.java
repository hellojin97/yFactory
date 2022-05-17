package com.yfactory.mes.mtrl.service;

import java.util.List;
import java.util.Map;

public interface MtrlService {
	
	//미지시 생산계획조회
	List<Map>selectPl();
	
	
	//LOT재고조회
	List<Map>listMtrlLot();
}
