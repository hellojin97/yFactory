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
	

}
