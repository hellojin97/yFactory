package com.yfactory.mes.quality.serviceImpl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yfactory.mes.quality.mapper.QualityMapper;
import com.yfactory.mes.quality.service.QualityService;
import com.yfactory.mes.quality.vo.MtCheckVO;

@Service
public class QualityServiceImpl implements QualityService {

	@Autowired QualityMapper map;

	@Override
	public List<Map> selectErrCode() {
		return map.selectErrCode();
	}

	@Override
	public List<Map> selectpoDtlRequest() {
		return map.selectpoDtlRequest();
	}

	@Override
	public List<Map> selectMtCheckMgr() {
		return map.selectMtCheckMgr();
	}
	
	@Override
	public List<Map> selectMtCheck() {
		return map.selectMtCheck();
	}
	
	@Override
	public List<Map> selectProdCheck() {
		return map.selectProdCheck();
	}

	@Override
	public List<Map> selectMtErrList() {
		return map.selectMtErrList();
	}
	
	@Override
	public List<Map> selectProdErrList() {
		return map.selectProdErrList();
	}
	
	public List<Map> searchErrName(String key) {
		return map.searchErrName(key);
	}
	
	@Override
	public List<Map> searchpoDtlRequest(String key) {
		return map.searchpoDtlRequest(key);
	}

	@Override
	public int reqMtQuality(String pdt) {
		return map.reqMtQuality(pdt);
	}
	
	@Override
	public int resMtQuality(Map<String, Object> list) {
		return map.resMtQuality(list);
	}

}