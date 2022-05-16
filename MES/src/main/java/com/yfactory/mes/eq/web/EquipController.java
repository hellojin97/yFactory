package com.yfactory.mes.eq.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yfactory.mes.eq.mapper.EquipMapper;
import com.yfactory.mes.eq.vo.EqVO;

@Controller
public class EquipController {
	
	
	@Autowired
	public EquipMapper mapper;
	
	@RequestMapping("/eqpartJoin")
	public List<EqVO> eqlist(){
		
		//return mapper.findAll();
		return null;
	}
}
