package com.yfactory.mes.proc.serviceImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

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
	public List<Map> PrdtPlanSelect(String date1, String date2) {
		// TODO Auto-generated method stub
		return map.PrdtPlanSelect(date1, date2);
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

	// 생산계획 등록
	@Override
	public int ProcPlanInsert(Map<String, String> procPI) {
		// TODO Auto-generated method stub
		return map.ProcPlanInsert(procPI);
	}




	@Override
	public List<Map> ProcPlanAll() {
		// TODO Auto-generated method stub
		return map.ProcPlanAll();
	}
	
	@Override
	public int prdInsInsert(Map<String, Object> prdIns) {
		return map.prdInsInsert(prdIns);
	}



	@Override
	public List<Map> ProcPlanSelect(String ppCd) {
		// TODO Auto-generated method stub
		return map.ProcPlanSelect(ppCd);
	}




	@Override
	//public List<Map> ProcPlanSelectState(String ppCd, String date1, String date2,String radio) {
	public List<Map> ProcPlanSelectState(HashMap<String, Object> procPlSelect){
		
		return map.ProcPlanSelectState(procPlSelect);
	}




	@Override
	public int prdtPlanInsert(String PP_NM, String date1) {
		// TODO Auto-generated method stub
		return 0;
	}




	@Override
	public List<Map> NoPlanSelect(String state) {
		// TODO Auto-generated method stub
		return map.NoPlanSelect(state);
	}










	@Override
	public List<Map> ProcNeedMtrl(HashMap<String, Object> line) {
		// TODO Auto-generated method stub
		return map.ProcNeedMtrl(line);
	}




	@Override
	public List<Map> ProcNeedMtrlLOT(HashMap<String, Object> mtNm) {
		// TODO Auto-generated method stub
		return map.ProcNeedMtrlLOT(mtNm);
	}




	@Override
	public List<Map> ProcOrderSelect(HashMap<String, Object> list) {
		// TODO Auto-generated method stub
		return map.ProcOrderSelect(list);
	}



	// 생산 지시 목록
	@Override
	public List<Map> ProcOrderList(HashMap<String, Object> list) {
		// TODO Auto-generated method stub
		return map.ProcOrderList(list);
	}




	@Override
	public List<Map> ProcOrderCdSelectOne(String dtlCd) {
		// TODO Auto-generated method stub
		return map.ProcOrderCdSelectOne(dtlCd);
	}




	@Override
	public List<Map> ProcOrderLineSelectOne(String line) {
		// TODO Auto-generated method stub
		return map.ProcOrderLineSelectOne(line);
	}



	
	@Override
	public int ProcStartLogic(HashMap<String, Object> list) {
		
		return map.ProcStartLogic(list);
	}




	@Override
	public List<Map> procResultList() {
		return map.procResultList();
	}




	@Override
	public List<Map> procResultOrdersList() {
		return map.procResultOrdersList();
	}




	@Override
	public List<Map> procResultProcessList() {
		return map.procResultProcessList();
	}




	@Override
	public int procCancelPl(Map<String, String> cancel) {
		// TODO Auto-generated method stub
		return map.procCancelPl(cancel);
	}




	@Override
	public List<Map> procDtPlanSelect(Map<String, String> ppCd) {
		// TODO Auto-generated method stub
		return map.procDtPlanSelect(ppCd);
	}




	@Override
	public List<Map> ProcLineSelect(Map<String, String> prodNm) {
		// TODO Auto-generated method stub
		return map.ProcLineSelect(prodNm);
	}




	@Override
	public int ProcStopLogic(List<HashMap<String, Object>> list) {
		// TODO Auto-generated method stub
		for(HashMap<String, Object>mapper : list) {
			map.ProcStopLogic(mapper);
		}
		return 1;
	}




	@Override
	public int ProcRestartLogic(List<HashMap<String, Object>> list) {
		// TODO Auto-generated method stub
		for(HashMap<String, Object>mapper : list) {
			map.ProcRestartLogic(mapper);
		}
		return 1;
	}




	@Override
	public List<Map> procProcessCtlSelect() {
		// TODO Auto-generated method stub
		return map.procProcessCtlSelect();
	}




	@Override
	public List<Map> procProcessCheckList() {
		// TODO Auto-generated method stub
		return map.procProcessCheckList();
	}
  @Override
	public List<Map> searchProcResult(Map<String, String> result) {
		return map.searchProcResult(result);
	}




@Override
public List<Map> procLineAjax() {
	// TODO Auto-generated method stub
	return map.procLineAjax();
}








	


























	
}
