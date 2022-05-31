package com.yfactory.mes.eq.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.yfactory.mes.eq.mapper.EquipMapper;
import com.yfactory.mes.eq.service.EquipService;
import com.yfactory.mes.eq.vo.EqVO;

@Service
public class EquipServiceImpl implements EquipService{

	@Autowired
	EquipMapper mapper;
	
	@Override
	public List<Map> searchEq(){
		return mapper.searchEq();
	}

	@Override
	public List<Map> selectEq(String eqCd) {
	
		return mapper.selectEq(eqCd);
	}

	@Override
	public int insertEq(EqVO vo) {
		
		return mapper.insertEq(vo);
	}

	@Override
	public List<Map> searchEqMngList() {
		
		return mapper.searchEqMngList();
	}

	@Override
	public List<Map> searchPrcList() {
		
		return mapper.searchPrcList();
	}

	@Override
	public List<Map> selectEqPrc(String eqCd) {
		
		return mapper.selectEqPrc(eqCd);
	}

	@Override
	public List<Map> searchEmp() {
		
		return mapper.searchEmp();
	}

	@Override
	public List<Map> getVdrList() {
		
		return mapper.getVdrList();
	}

	@Override
	public List<Map> getEqActStatList() {
		
		return mapper.getEqActStatList();
	}

	@Override
	public List<Map> getEqInActList(String key) {
		return mapper.getEqInActList(key);
	}

	@Override
	public List<Map> getEqInList() {
		return mapper.getEqInList();
	}

	@Override

	public List<Map> getEqChkList() {
		
		return mapper.getEqChkList();
	}

	@Override
	public List<Map> getEqChkSelectList( HashMap<String, Object> list) {
		
		return mapper.getEqChkSelectList(list);

	}

	@Override
	public int setEqIn(Map<String, String> result) {
		return mapper.setEqIn(result);
	}

	@Override
	public List<Map> searchEqIna(Map<String, String> result) {
		return mapper.searchEqIna(result);
	}

	@Override
	public List<Map> getEqDailyChkCount(String chkdt1 ,String chkdt2) {
		
		return mapper.getEqDailyChkCount(chkdt1, chkdt2);
	}

	@Override
	public int eqChkResultAjax(List<HashMap<String, Object>> list) {
		
		return mapper.eqChkResultAjax(list);
	}

	@Override
	public List<Map> dailyChkListAjax(List<HashMap<String, Object>> list) {
		
		return mapper.dailyChkListAjax(list);
	}

	@Override

	public int eqChkDelAjax(List<HashMap<String, Object>> list) {
	
		return mapper.eqChkDelAjax(list);
	}

	@Override
	public int eqMngUpdateAjax(List<HashMap<String, Object>> list) {
		
		return mapper.eqMngUpdateAjax(list);
	}
	public int updateIna(Map<String, String> result) {
		return mapper.updateIna(result);

	}
	
	
	
}
