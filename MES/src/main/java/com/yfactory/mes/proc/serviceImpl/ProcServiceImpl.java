package com.yfactory.mes.proc.serviceImpl;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yfactory.mes.proc.mapper.ProcMapper;
import com.yfactory.mes.proc.service.ProcService;
import com.yfactory.mes.proc.vo.PlanDtlVO;
import com.yfactory.mes.sales.mapper.SalesMapper;

@Service
public class ProcServiceImpl implements ProcService{
	@Autowired	ProcMapper map;
	
	@Override
	public List<Map> OrderSelectOk(String ordCd) {
		// TODO Auto-generated method stub
		return map.OrderSelectOk(ordCd);
	}

	@Override
	public Map OrderSelectNo(Map prodCd) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int PlanInsert(PlanDtlVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Map> PrdSelect() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Map> prdtPlanSelect(Date date1, Date date2) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int prdtPlanInsert(String PP_NM, Date date1) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
