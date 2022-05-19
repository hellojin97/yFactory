package com.yfactory.mes.quality.serviceImpl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yfactory.mes.quality.mapper.QualityMapper;
import com.yfactory.mes.quality.service.QualityService;

@Service
public class QualityServiceImpl implements QualityService {

	@Autowired QualityMapper map;

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
	public List<Map> selectMtErrList() {
		return map.selectMtErrList();
	}
	
	@Override
	public List<Map> searchpoDtlRequest() {
		return map.searchpoDtlRequest();
	}

	@Override
	public List<Map> searchMtQuality(Date startDate, Date endDate, String mtName) {
		return map.searchMtQuality(startDate, endDate, mtName);
	}

	@Override
	public List<Map> searchProdQuality(String prodName) {
		return map.searchProdQuality(prodName);
	}

	@Override
	public List<Map> searchMtErrList(String errDtl, String mtName) {
		return map.searchMtErrList(errDtl, mtName);
	}

	@Override
	public List<Map> searchProdErrList(String errDtl, String prodName) {
		return map.searchProdErrList(errDtl, prodName);
	}
}
