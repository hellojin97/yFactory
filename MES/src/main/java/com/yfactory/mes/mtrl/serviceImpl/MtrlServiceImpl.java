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



}
