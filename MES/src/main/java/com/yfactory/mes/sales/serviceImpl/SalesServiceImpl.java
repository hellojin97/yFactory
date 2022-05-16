package com.yfactory.mes.sales.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yfactory.mes.sales.mapper.SalesMapper;
import com.yfactory.mes.sales.service.SalesService;
import com.yfactory.mes.test.TestVO;

@Service
public class SalesServiceImpl implements SalesService {
	
	@Autowired	SalesMapper map;
	
	@Override
	public List<Map> selectOrderList() {
		// TODO 
		
		return map.selectOrderList();
	}

}
