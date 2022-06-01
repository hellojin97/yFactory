package com.yfactory.mes.mtrl.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yfactory.mes.mtrl.mapper.MtrlMapper;
import com.yfactory.mes.mtrl.service.MtrlService;

@Service
public class MtrlServiceImpl implements MtrlService {
	
	@Autowired MtrlMapper map;

	@Override
	public List<Map> selectPl() {
		// TODO Auto-generated method stub
		return map.selectPl();
	}

	@Override
	public List<Map> listMtrlLot() {
		// TODO Auto-generated method stub
		return map.listMtrlLot();
	}

	@Override
	public List<Map> mtcdList() {
		// TODO Auto-generated method stub
		return map.mtcdList();
	}

	@Override
	public List<Map> vendorList() {
		// TODO Auto-generated method stub
		return map.vendorList();
	}

	@Override
	public List<Map> mtnmSelectSearch(String mtnm) {
		// TODO Auto-generated method stub
		return map.mtnmSelectSearch(mtnm);
	}

	@Override
	public List<Map> vdrnmSelectSearch(String vdrnm) {
		// TODO Auto-generated method stub
		return map.vdrnmSelectSearch(vdrnm);
	}

	@Override
	public List<Map> lotSelectSearch(String m1, String m2, String req1, String req2) {
		// TODO Auto-generated method stub
		return map.lotSelectSearch(m1, m2, req1, req2);
	}

	@Override
	public List<Map> mtrlPlanList(String ppCd) {
		// TODO Auto-generated method stub
		return map.mtrlPlanList(ppCd);
	}

	@Override
	public List<Map> mtrlOrderList(String ppCd, String mtCd) {
		// TODO Auto-generated method stub
		return map.mtrlOrderList(ppCd, mtCd);
	}

	@Override
	public List<Map> pocdList() {
		// TODO Auto-generated method stub
		return map.pocdList();
	}

	@Override
	public List<Map> pocdSelectSearch(String pocd) {
		// TODO Auto-generated method stub
		return map.pocdSelectSearch(pocd);
	}

	@Override
	public List<Map> listRequest() {
		// TODO Auto-generated method stub
		return map.listRequest();
	}

	@Override
	public List<Map> mtrlReqSelectSearch(String poCdinput) {
		// TODO Auto-generated method stub
		return map.mtrlReqSelectSearch(poCdinput);
	}

	@Override
	public int mtrlReqInsert(Map<String, String> result) {
		// TODO Auto-generated method stub
		return map.mtrlReqInsert(result);
	}

	@Override
	public List<Map> insertList() {
		// TODO Auto-generated method stub
		return map.insertList();
	}

	@Override
	public List<Map> insertSearch(String m1, String m2, String req1, String req2) {
		// TODO Auto-generated method stub
		return map.insertSearch(m1, m2, req1, req2);
	}

	@Override
	public List<Map> expectList() {
		// TODO Auto-generated method stub
		return map.expectList();
	}

	@Override
	public List<Map> selectMtrlReqList(Map<String, String> result) {
		// TODO Auto-generated method stub
		return map.selectMtrlReqList(result);
	}

	@Override
	public int insertMtrlIn(Map<String, String> mtrlIn) {
		// TODO Auto-generated method stub
		return map.insertMtrlIn(mtrlIn);
	}

	@Override
	public List<Map> mtrlStorageList() {
		// TODO Auto-generated method stub
		return map.mtrlStorageList();
	}

	@Override
	public List<Map> mtrlStorageSearch(String m1, String m2) {
		// TODO Auto-generated method stub
		return map.mtrlStorageSearch(m1, m2);
	}

	@Override
	public List<Map> mtrlSafetyList() {
		// TODO Auto-generated method stub
		return map.mtrlSafetyList();
	}

	@Override
	public List<Map> mtrlSafetySearch(String m1) {
		// TODO Auto-generated method stub
		return map.mtrlSafetySearch(m1);
	}



}
