package com.yfactory.mes.eq.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yfactory.mes.eq.mapper.EquipMapper;
import com.yfactory.mes.eq.service.EquipService;

@Service
public class EquipServiceImpl implements EquipService{

	@Autowired
	EquipMapper mapper;
	
	@Override
	public List<Map> searchEq(){
		return mapper.searchEq();
	}
	
	
	
}
