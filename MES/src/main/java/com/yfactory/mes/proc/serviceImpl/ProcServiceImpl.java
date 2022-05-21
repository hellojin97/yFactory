package com.yfactory.mes.proc.serviceImpl;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yfactory.mes.proc.mapper.ProcMapper;
import com.yfactory.mes.proc.service.ProcService;

@Service
public class ProcServiceImpl implements ProcService{
	@Autowired	ProcMapper map;
	
	@Override
	public List<Map> OrderSelectOk(String ordCd) {
		// TODO Auto-generated method stub
		return map.OrderSelectOk(ordCd);
	}




	@Override
	public List<Map> PrdSelect() {
		// TODO Auto-generated method stub
		return map.PrdSelect();
	}

	@Override
	public List<Map> prdtPlanSelect(String date1, String date2) {
		// TODO Auto-generated method stub
		return map.prdtPlanSelect(date1, date2);
	}

	/*
	 * @Override public int prdtPlanInsert(String PP_NM, Date date1) { // TODO
	 * Auto-generated method stub return 0; }
	 */

	@Override
	public List<Map> ProcOrderSelectAll() {
		// TODO Auto-generated method stub
		return map.ProcOrderSelectAll();
	}

	@Override
	public List<Map> PrdSelectOne(String prodCd) {
		// TODO Auto-generated method stub
		return map.PrdSelectOne(prodCd);
	}


	@Override
	public int ProcPlanInsert(HashMap<String, Object> procPI) {
		// TODO Auto-generated method stub
		// ajax 해온 값
		System.out.println(procPI);
		List<Map<String, String>> list = (List<Map<String, String>>) procPI.get("array");
		// 배열에 뽑은 값
		System.out.println(list);
		//return map.ProcPlanInsert(procPI);
		return 1;
	}




	@Override
	public List<Map> procPlanAll() {
		// TODO Auto-generated method stub
		return map.procPlanAll();
	}




	@Override
	public int prdtPlanInsert(String PP_NM, java.util.Date date1) {
		// TODO Auto-generated method stub
		return 0;
	}










	
}
