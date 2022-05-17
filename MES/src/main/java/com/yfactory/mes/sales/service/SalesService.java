package com.yfactory.mes.sales.service;

import java.util.List;
import java.util.Map;

public interface SalesService {
	List<Map> selectOrderList();
	List<Map> selectBomList();
}
