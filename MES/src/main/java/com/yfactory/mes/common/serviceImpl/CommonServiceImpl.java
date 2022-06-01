package com.yfactory.mes.common.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yfactory.mes.common.mapper.CommonMapper;
import com.yfactory.mes.common.service.CommonService;
import com.yfactory.mes.common.vo.EmployeeVO;

@Service
public class CommonServiceImpl implements CommonService {

	@Autowired private CommonMapper map;

	// 주문서 조회
	@Override
	public List<Map> mainOrdersList() {
		// TODO Auto-generated method stub
		return map.mainOrdersList();
	}

	@Override
	public List<Map> mainProdList() {
		// TODO Auto-generated method stub
		return map.mainProdList();
	}

	@Override
	public List<Map> mainMtrlList() {
		// TODO Auto-generated method stub
		return map.mainMtrlList();
	}

	@Override
	public List<Map> userOrderForm() {
		// TODO Auto-generated method stub
		return map.userOrderForm();
	}

	@Override
	public int userOrderInsert(Map<String, String> parameter) {
		// TODO Auto-generated method stub
		return map.userOrderInsert(parameter);
	}

	@Override
	public EmployeeVO userLogin(EmployeeVO empVO) {
		return map.userLogin(empVO);
	}
}
